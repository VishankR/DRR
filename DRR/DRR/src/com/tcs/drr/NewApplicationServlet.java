package com.tcs.drr;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

@WebServlet("/NewApplicationServlet")
public class NewApplicationServlet extends HttpServlet 
{
	@Resource(name="jdbc/customer-tracker")
	DataSource datasource;
	CustomerUtil customerutil;
	//pass datasource to customerutil class 
	@Override
	public void init() throws ServletException 
	{
		try
		{
			customerutil=new CustomerUtil(datasource);
		}
		catch(Exception e)
		{
			throw new ServletException(e);
		}
	}
	
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html");
	    		//take user input
		String cmd=request.getParameter("command");
		String first_name=request.getParameter("first_name");
		String last_name=request.getParameter("last_name");
		String gender=request.getParameter("gender");
		String address=request.getParameter("address");
		String phn=request.getParameter("phn");
		String email=request.getParameter("email");
		String aadhar_card=request.getParameter("aadhar_card");
		String pan_card=request.getParameter("pan_card");
		String income=request.getParameter("income");
		try
		{
		if(cmd.equals("EDIT"))
				{
					String id=request.getParameter("id");
					int customer_id=Integer.parseInt(id);
					Customer customer_new=new Customer(customer_id,first_name, last_name, gender, address, phn, email, aadhar_card, pan_card, income);
					customerutil.edit(customer_new);
					listcustomer(request,response);
				}
		else
		{
		Customer customer=new Customer(first_name, last_name, gender, address, phn, email, aadhar_card, pan_card, income);
		
		//call insert method
		
		customerutil.insert(customer);
		
		//Auto Loan
		autoLoan(customer,request,response);
		}}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

	private void autoLoan(Customer customer, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		int maxTenure[]= {1,2,3,4,5,6,7};
		int id=0;
		int income=Integer.parseInt(customer.getIncome());
		int maxLoan=0;
		double interest=0.0;
		String email=customer.getEmail();
		if(income>=300000)
		{
			maxLoan=4*income;
			if(customer.getGender().equals("M"))
			{
				interest=9.30;
			}
			else
			{
				interest=9.25;
			}
			try
			{
			id=customerutil.getCustomerId(customer.getAadhar_card());
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			HttpSession oldSession = request.getSession(false);
			oldSession.setAttribute("email",email);
			oldSession.setAttribute("customer_id",id);
			oldSession.setAttribute("maxTenure",maxTenure);
			oldSession.setAttribute("maxLoan",maxLoan);
			oldSession.setAttribute("interest",interest);
			homeLoan(customer,request,response);
		}
		else
		{
			request.setAttribute("msg0","The person is not eligible");
			request.getRequestDispatcher("/application.jsp").forward(request,response);
		}
		
	}
	private void homeLoan(Customer customer, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		int maxTenure[]= new int[30];
		for(int i=1;i<=30;i++)
			maxTenure[i-1]=i;	
		int id=0;
		int income=Integer.parseInt(customer.getIncome());
		int maxLoan=0;
		double interest=0.0;
		String email=customer.getEmail();
		if(income>=300000)
		{
			maxLoan=7*income;
			if(customer.getGender().equals("M"))
			{
				interest=8.35;
			}
			else
			{
				interest=8.30;
			}
			try
			{
			id=customerutil.getCustomerId(customer.getAadhar_card());
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			HttpSession oldSession = request.getSession(false);
			oldSession.setAttribute("email2",email);
			oldSession.setAttribute("customer_id2",id);
			oldSession.setAttribute("maxTenure2",maxTenure);
			oldSession.setAttribute("maxLoan2",maxLoan);
			oldSession.setAttribute("interest2",interest);
			response.sendRedirect("loandetail.jsp");
		}
		else
		{
			
		}}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String cmd=request.getParameter("command");
		switch(cmd)
		{
		case "LIST":
			listcustomer(request,response);
		case "DELETE":
			deletecustomer(request,response);
		case "LOAD":
			loadcustomer(request,response);
		}
	}

	private void loadcustomer(HttpServletRequest request, HttpServletResponse response) 
	{
		try
		{
			HttpSession session=request.getSession(false);
		String id=request.getParameter("id");
		Customer customer=customerutil.read(id);
		session.setAttribute("customer", customer);
		request.getRequestDispatcher("/CustomerEdit.jsp").forward(request, response);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
	}

	private void deletecustomer(HttpServletRequest request, HttpServletResponse response) 
	{
		try
		{
		String id=request.getParameter("id");
		customerutil.delete(id);
		listcustomer(request,response);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
	}

	private void listcustomer(HttpServletRequest request, HttpServletResponse response) 
	{
		try
		{
		List<Customer> list=customerutil.getCustomer();
		request.setAttribute("Customers",list);
		request.getRequestDispatcher("/CustomerDetails.jsp").forward(request, response);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	
	
}
