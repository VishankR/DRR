package com.tcs.drr;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter({"/AdminDashboard.jsp","/AddEmployeeServlet","/EmployeeDetails.jsp","/CustomerDetails.jsp","/CustomerEdit.jsp","/repaymentDetail2.jsp","/changepassword.jsp"})
public class AdminLoginFilter implements Filter {

	public void destroy() {
		// TODO Auto-generated method stub
	}

	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException 
	{
		HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;
		HttpSession session = request.getSession(false);
		
		if(session==null||(Employee)session.getAttribute("currentSessionUser")==null)
		{
			request.setAttribute("msg1","You need to login first");
			request.getRequestDispatcher("/adminLogin.jsp").forward(request,response);
		}
		else
		{
		chain.doFilter(request, response);
		}
	}

	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
