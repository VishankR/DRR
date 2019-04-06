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

@WebFilter("/NewApplicationServlet")
public class NewApplicationFilter implements Filter 
{
	ValidationFunctions validate=new ValidationFunctions();
	public void destroy() {
		// TODO Auto-generated method stub
	}
	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException 
	{
		 HttpServletRequest httpRequest = (HttpServletRequest) request;
		if(httpRequest.getMethod().equalsIgnoreCase("POST"))
		{
		String phn=request.getParameter("phn");
		String email=request.getParameter("email");
		String aadhar_card=request.getParameter("aadhar_card");
		String pan_card=request.getParameter("pan_card");
		@SuppressWarnings("unused")
		String income=request.getParameter("income");
		
		//perform phn validation	
		 if (!validate.isValidPhn(phn)) 
		 {
			 request.setAttribute("msg1","Phn number entered is invalid");
		 }
		 
		//perform email validation
		
		 if (!validate.isValidEmail(email))
		 {
			 request.setAttribute("msg2","Enter correct email address");
		 }
		 
		 //perform aadhar number validation
		 
		 if (!validate.validateAadharNumber(aadhar_card))
		 {
			 request.setAttribute("msg3","Enter correct aadhar number");
		 }
		 
		 if (!validate.isValidPan(pan_card))
		 {
			 request.setAttribute("msg4","Enter correct pan number");
		 }
		
		 if(!validate.isValidPhn(phn) || !validate.isValidEmail(email) || !validate.validateAadharNumber(aadhar_card) || !validate.isValidPan(pan_card))
		 {
			 if(request.getParameter("command").equals("EDIT"))
				 request.getRequestDispatcher("/CustomerEdit.jsp").forward(request, response);
			 else
			 request.getRequestDispatcher("/application.jsp").forward(request, response);
		 }
		 else
		 {
		    chain.doFilter(request, response);
	     }
		}
		 else
		 {
		    chain.doFilter(request, response);
	     }
		 }

	 //init
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
