package com.tcs.drr;

import java.sql.Connection;
import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;

import javax.sql.DataSource;

public class LoanUtil 
{
	DataSource datasource;

	public LoanUtil(DataSource datasource) 
	{
		this.datasource = datasource;
	}

	public void insert(Loan loan) throws Exception
	{

		Connection conn=null;	
		PreparedStatement stmt=null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date startDate = sdf.parse(loan.getDate());
		java.sql.Date datenew= new java.sql.Date(startDate.getTime());
		
	//connect to database
		try
		{
			conn=datasource.getConnection();
			String sql="INSERT into loan "+
						"(id, tol, amount, date, tenure) "+
						"VALUES (?, ?, ?, ?, ?)";
			
			stmt=conn.prepareStatement(sql);
			
			stmt.setInt(1,loan.getId());
			stmt.setString(2,loan.getTol());
			stmt.setDouble(3,loan.getAmount());
			stmt.setDate(4,datenew);
			stmt.setInt(5,loan.getTenure());
			//insert to database
			stmt.execute();
		}
		 finally 
		    {
		     close(conn,stmt,null);
		    }
	}
		
	private void close(Connection conn, Statement stmt, ResultSet rs) 
	{
		try
		{
		  if (rs != null)
	          rs.close();

		
	       if (stmt != null)
	           stmt.close();
	          	
	       if (conn != null)
	           conn.close();
		}
		catch(Exception e)
	      	{
	      	 e.printStackTrace();
	      	}
	}

	public Loan read(String id) throws Exception
	{
		int cid=Integer.parseInt(id);
		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		Loan loan=null;
		//connect to database
		try
		{
			conn=datasource.getConnection();
			stmt=conn.createStatement();
			
			String sql=   "select * from loan where id='"+cid+"'";
			rs=stmt.executeQuery(sql);
			while(rs.next())
			{
				String tol=rs.getString("tol");
				double amount=rs.getDouble("amount");
				Date d1 = new Date(rs.getDate("date").getTime());
				SimpleDateFormat sdf2= new SimpleDateFormat("yyyy-MM-dd");
				String date2 = sdf2.format(d1);
				int tenure=rs.getInt("tenure");
				loan=new Loan(cid,tol,amount,date2,tenure);
			}
			return loan;
		}
		finally 
	    {
	     close(conn,stmt,null);
	    }			
	}
}
