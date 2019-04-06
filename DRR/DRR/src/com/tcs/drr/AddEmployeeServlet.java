package com.tcs.drr;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

/**
 * Servlet implementation class AddEmployeeServlet
 */
@WebServlet("/AddEmployeeServlet")
public class AddEmployeeServlet extends HttpServlet {
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
		String employee_name=request.getParameter("employee_name");
		String employee_password=request.getParameter("employee_password");
		String confirm_password=request.getParameter("confirm_password");
		
		if((confirm_password).equals(employee_password))
		{
			Employee employee=new Employee(employee_name,employee_password);
			employeeutil.insert(employee);
			request.setAttribute("msg1","Employee added successfully");
			request.getRequestDispatcher("/AdminDashboard.jsp").forward(request, response);
		}
		else
		{
			request.setAttribute("msg","the passwords do not match");
			request.getRequestDispatcher("/AdminDashboard.jsp").forward(request, response);
		}
}
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String cmd=request.getParameter("command");
		if(cmd.equals("DELETE"))
		{
			try
			{
			String id=request.getParameter("id");
			employeeutil.delete(id);
			listEmployees(request,response);
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}
		else
		{
		listEmployees(request,response);
		}
	}
	private void listEmployees(HttpServletRequest request, HttpServletResponse response) 
	{
		try
		{
		List<Employee> list=employeeutil.getEmployees();
		request.setAttribute("Employees",list);
		request.getRequestDispatcher("/EmployeeDetails.jsp").forward(request, response);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
	}}
