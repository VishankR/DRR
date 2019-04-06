package com.tcs.drr;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Properties;

import javax.annotation.Resource;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.apache.commons.mail.EmailException;

/**
 * Servlet implementation class LoanServlet
 */
@WebServlet("/LoanServlet")
public class LoanServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	@Resource(name="jdbc/customer-tracker")
	DataSource datasource;
	LoanUtil loanutil;
	//pass datasource to customerutil class 
	@Override
	public void init() throws ServletException 
	{
		try
		{
			loanutil=new LoanUtil(datasource);
		}
		catch(Exception e)
		{
			throw new ServletException(e);
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String tol=request.getParameter("tol");
		String date=request.getParameter("date");
		double loan_amount=Double.parseDouble(request.getParameter("loan_amount"));
		int tenure=Integer.parseInt(request.getParameter("tenure"));
		int id=Integer.parseInt(request.getParameter("id"));
		String email=request.getParameter("email");
		try
		{
		Loan loan=new Loan(id,tol,loan_amount,date,tenure);
		loanutil.insert(loan);
		//auto loan repayment
		auto_loan(loan,email,request,response);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}	
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String id=request.getParameter("id");
		try
		{
		Loan loan=loanutil.read(id);
		CustomerUtil customerutil=new CustomerUtil(datasource);
		Customer customer=customerutil.read(id);
		auto_loan(loan,customer,request,response);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
	}
	private void auto_loan(Loan loan, Customer customer, HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ArrayList<LoanDetail> details=new ArrayList<>();
		double interest;
        if(loan.getTol().equals("auto"))
        {
        	if(customer.getGender().equals("M"))
			{
				interest=9.30;
			}
			else
			{
				interest=9.25;
			}
        }
        else
        {
        	if(customer.getGender().equals("M"))
			{
				interest=8.35;
			}
			else
			{
				interest=8.30;
			}
        }
        interest=interest/1200;
        int tenure=loan.getTenure()*12;
        double p=loan.getAmount();
        //EMI
        double emi=(p*interest*(Math.pow((1+interest),tenure)))/((Math.pow(1+interest,tenure))-1);
        //dates
		String date=loan.getDate();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date startDate = sdf.parse(date);
		Calendar c = Calendar.getInstance();
		for(int i=1;i<=tenure;i++)
		{
		LoanDetail ld=new LoanDetail();
		c.setTime(startDate);
		if(i>1)
		c.add(Calendar.DAY_OF_MONTH, 30);
		SimpleDateFormat sdf2= new SimpleDateFormat("dd/MM/yyyy");
		String output = sdf2.format(c.getTime());
		ld.setDate(output);
		startDate = sdf2.parse(output);
		
		//interest_amount and balance
			double interest_amount=interest*p;
			ld.setInterest(interest_amount);
			p=(p+interest_amount)-emi;
			if(p<0)
				p=0;
			ld.setBalance(p);
			
		//store in array list details
			details.add(ld);
		}
		
		//store everything in session
		HttpSession oldSession = request.getSession(false);
		oldSession.setAttribute("emi",emi);
		oldSession.setAttribute("details",details);
		response.sendRedirect("repaymentDetail2.jsp");
	}
	private void auto_loan(Loan loan, String email,HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ArrayList<LoanDetail> details=new ArrayList<>();
        double interest=Double.parseDouble(request.getParameter("interest"));
        interest=interest/1200;
        int tenure=loan.getTenure()*12;
        double p=loan.getAmount();
        //EMI
        double emi=(p*interest*(Math.pow((1+interest),tenure)))/((Math.pow(1+interest,tenure))-1);
        //dates
		String date=loan.getDate();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date startDate = sdf.parse(date);
		Calendar c = Calendar.getInstance();
		for(int i=1;i<=tenure;i++)
		{
		LoanDetail ld=new LoanDetail();
		c.setTime(startDate);
		if(i>1)
		c.add(Calendar.DAY_OF_MONTH, 30);
		SimpleDateFormat sdf2= new SimpleDateFormat("dd/MM/yyyy");
		String output = sdf2.format(c.getTime());
		ld.setDate(output);
		startDate = sdf2.parse(output);
		
		//interest_amount and balance
			double interest_amount=interest*p;
			ld.setInterest(interest_amount);
			p=(p+interest_amount)-emi;
			if(p<0)
				p=0;
			ld.setBalance(p);
			
		//store in array list details
			details.add(ld);
		}
		
		//store everything in session
		HttpSession oldSession = request.getSession(false);
		oldSession.setAttribute("email",email);
		oldSession.setAttribute("tol",loan.getTol());
		oldSession.setAttribute("amt",loan.getAmount());
		oldSession.setAttribute("emi",emi);
		oldSession.setAttribute("details",details);
		mail(details,emi,email);
		response.sendRedirect("repaymentDetail.jsp");
	}
	
	public void mail(ArrayList<LoanDetail> details, double emi, String email) throws EmailException
	{
		String user="nitinkhare97@gmail.com";
		String pass="Madhukhare97";
		String s="";
		String e=""+emi;
		
		for(LoanDetail d : details)
		{
			s=s+","+d.getDate();
		}
		
            Properties props = new Properties();
            
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
            props.put("mail.smtp.port","587"); 
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.enable", "true");
            
            Authenticator auth = new Authenticator() {
    			//override the getPasswordAuthentication method
    			protected PasswordAuthentication getPasswordAuthentication() {
    				return new PasswordAuthentication(user, pass);
    			}
    		};
    		Session session = Session.getInstance(props, auth);

           /* Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            	     @SuppressWarnings("unused")
					protected PasswordAuthentication getPaswordAuthentication() {
            	    	 return new PasswordAuthentication(user,pass);
            	     }
            		});
            */
            try {
            
            Message msg = new MimeMessage(session);

            msg.setFrom(new InternetAddress(user));

            msg.addRecipient(Message.RecipientType.TO, new InternetAddress(email));

            msg.setSubject("Repayment Details");
          
            
            msg.setText("You are required to pay an emi amount of Rs"+e+" on the following dates "+s);
           
            Transport.send(msg);
            
        }

            catch (MessagingException ex)
            {
            ex.printStackTrace();
             }
    }
}

