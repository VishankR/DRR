package com.tcs.drr;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

public class CustomerUtil 
{
	
DataSource datasource;

public CustomerUtil(DataSource datasource) 
{
	this.datasource = datasource;
}

public void insert(Customer customer) throws Exception
{
	
	Connection conn=null;	
	PreparedStatement stmt=null;
	
//connect to database
	try
	{
		conn=datasource.getConnection();
		String sql="INSERT into customer "+
					"(first_name, last_name, gender, address, phn, email, aadhar_card, pan_card, income) "+
					"VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		stmt=conn.prepareStatement(sql);
		stmt.setString(1,customer.getFirst_name());
		stmt.setString(2,customer.getLast_name());
		stmt.setString(3,customer.getGender());
		stmt.setString(4,customer.getAddress());
		stmt.setString(5,customer.getPhn());
		stmt.setString(6,customer.getEmail());
		stmt.setString(7,customer.getAadhar_card());
		stmt.setString(8,customer.getPan_card());
		stmt.setString(9,customer.getIncome());
			
		//insert to database
		stmt.execute();
	}
	 finally 
	    {
	     close(conn,stmt,null);
	    }
}

public List<Customer> getCustomer() throws Exception
{
	List<Customer> list=new ArrayList<>();
	
	Connection conn=null;
	Statement stmt=null;
	ResultSet rs=null;
	//connect to database
	try
	{
		conn=datasource.getConnection();
		stmt=conn.createStatement();
		
		String sql=   "select * from customer order by id";
		rs=stmt.executeQuery(sql);
		while(rs.next())
		{
			int id=rs.getInt("id");
			String first_name=rs.getString("first_name");
			String last_name=rs.getString("last_name");
			String gender=rs.getString("gender");
			String address=rs.getString("address");
			String phn=rs.getString("phn");
			String email=rs.getString("email");
			String aadhar_card=rs.getString("aadhar_card");
			String pan_card=rs.getString("pan_card");
			String income=rs.getString("income");
			Customer customer=new Customer(id,first_name, last_name, gender, address, phn, email, aadhar_card, pan_card, income);
			
			list.add(customer);
		}
		return list;
	}
	finally
	{
		close(conn,stmt,rs);
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

public void delete(String id) throws Exception
{
	int customer_id=Integer.parseInt(id);
	Connection conn=null;	
	PreparedStatement stmt=null;
	try
	{
	conn=datasource.getConnection();
	String sql="DELETE from customer where id=?";
	
	stmt=conn.prepareStatement(sql);
	stmt.setInt(1,customer_id);
	//delete from database
			stmt.execute();
	}
	 finally 
	    {
	     close(conn,stmt,null);
	    }	
}

public Customer read(String id) throws Exception
{
	int customer_id=Integer.parseInt(id);
	Connection conn=null;
	Statement stmt=null;
	ResultSet rs=null;
	Customer customer=null;
	//connect to database
	try
	{
		conn=datasource.getConnection();
		stmt=conn.createStatement();
		
		String sql=   "select * from customer where id='"+customer_id+"'";
		rs=stmt.executeQuery(sql);
		while(rs.next())
		{
			String first_name=rs.getString("first_name");
			String last_name=rs.getString("last_name");
			String gender=rs.getString("gender");
			String address=rs.getString("address");
			String phn=rs.getString("phn");
			String email=rs.getString("email");
			String aadhar_card=rs.getString("aadhar_card");
			String pan_card=rs.getString("pan_card");
			String income=rs.getString("income");
			customer=new Customer(customer_id,first_name, last_name, gender, address, phn, email, aadhar_card, pan_card, income);			
		}
		return customer;
	}
	finally 
    {
     close(conn,stmt,null);
    }			
}

public void edit(Customer customer_new) throws Exception 
{
	Connection conn=null;	
	PreparedStatement stmt=null;
	
//connect to database
	try
	{
		conn=datasource.getConnection();
		String sql="update customer "
					+"set first_name=?, last_name=?, gender=?, address=?, phn=?, email=?, aadhar_card=?, pan_card=?, income=? "
					+"where id=?";
		
		stmt=conn.prepareStatement(sql);
		stmt.setString(1,customer_new.getFirst_name());
		stmt.setString(2,customer_new.getLast_name());
		stmt.setString(3,customer_new.getGender());
		stmt.setString(4,customer_new.getAddress());
		stmt.setString(5,customer_new.getPhn());
		stmt.setString(6,customer_new.getEmail());
		stmt.setString(7,customer_new.getAadhar_card());
		stmt.setString(8,customer_new.getPan_card());
		stmt.setString(9,customer_new.getIncome());
		stmt.setInt(10,customer_new.getId());
			
		stmt.execute();
	}
	 finally 
	    {
	     close(conn,stmt,null);
	    }
	
}

public int getCustomerId(String aadhar_card) throws Exception
{
	Connection conn=null;
	Statement stmt=null;
	ResultSet rs=null;
	int id=0;
	
	//connect to database
	try
	{
		conn=datasource.getConnection();
		stmt=conn.createStatement();
		
		String sql=   "select id from customer where aadhar_card='"+aadhar_card+"'";
		rs=stmt.executeQuery(sql);
		while(rs.next())
		{
			id=rs.getInt("id");
			break;
		}
	    return id;
	}
	finally 
    {
     close(conn,stmt,null);
    }			
}}
