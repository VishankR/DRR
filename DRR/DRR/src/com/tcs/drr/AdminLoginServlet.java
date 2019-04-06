package com.tcs.drr;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Resource(name="jdbc/customer-tracker")
	DataSource datasource;
	EmployeeUtil employeeutil;
	//pass datasource to EmployeeUtil class 
	
	public void init(ServletConfig config) throws ServletException 
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
		  //take user input
				String admin_password=request.getParameter("admin_password");
				
		// store it in Employee class
				Employee employee=new Employee("admin", admin_password);
				
		//check for login
				try
				{
				boolean valid=employeeutil.login(employee);
				if(!valid)
				{
					String msg="the password entered is wrong";
					request.setAttribute("msg",msg);
					request.getRequestDispatcher("/adminLogin.jsp").forward(request,response);
				}
				
				else
				{
					 HttpSession oldSession = request.getSession(false);
			            if (oldSession != null) {
			                oldSession.invalidate();
			            }
					HttpSession session = request.getSession(true);	    
			          session.setAttribute("currentSessionUser",employee); 
			          response.sendRedirect("AdminDashboard.jsp"); //logged-in page   
				}
				}
				catch(Exception e)
				{
					e.printStackTrace();
				}
}}
