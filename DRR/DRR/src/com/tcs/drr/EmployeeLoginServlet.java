package com.tcs.drr;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

@WebServlet("/EmployeeLoginServlet")
public class EmployeeLoginServlet extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	
	@Resource(name="jdbc/customer-tracker")
	DataSource datasource;
	EmployeeUtil employeeutil;
	//pass datasource to EmployeeUtil class 
	@Override
	public void init() throws ServletException 
	{
		try
		{
			employeeutil=new EmployeeUtil(datasource);
		}
		catch(Exception e)
		{
			throw new ServletException(e);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html");
		
	    //take user input
		
		String employee_name=request.getParameter("employee_name");
		String employee_password=request.getParameter("employee_password");
		
		// store it in Employee class
		
		Employee employee=new Employee(employee_name, employee_password);
		
		//check for login
		try
		{
		boolean valid=employeeutil.login(employee);
		if(!valid)
		{
			String msg="It seems you are not registered kindly contact the administrator";
			request.setAttribute("msg",msg);
			request.getRequestDispatcher("/login.jsp").forward(request,response);
		}
		else
		{
			 HttpSession oldSession = request.getSession(false);
	            if (oldSession != null) {
	                oldSession.invalidate();
	            }
			HttpSession session = request.getSession(true);	    
	          session.setAttribute("currentSessionUser",employee); 
	          response.sendRedirect("application.jsp"); //logged-in page   
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}

}}
