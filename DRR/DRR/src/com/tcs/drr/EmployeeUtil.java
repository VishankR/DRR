package com.tcs.drr;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

public class EmployeeUtil 
{
	DataSource datasource;

	public EmployeeUtil(DataSource datasource) 
	{
		this.datasource = datasource;
	}

public boolean login(Employee employee) throws Exception
{
Connection conn=null;
Statement stmt=null;
ResultSet rs=null;
//connect to database
	try
	{
		conn=datasource.getConnection();
		stmt=conn.createStatement();
		
		String sql=   "select * from employee where employee_name='"+employee.getEmployee_name()+"' AND employee_password='"+employee.getEmployee_password()+"'";
		rs=stmt.executeQuery(sql);
	    boolean more=rs.next();
	    
	    if(!more)
	    {
	    	return false;
	    }
	    else
	    {
	    	return true;
	    }
	}
	//some exception handling
    finally 
    {
     close(conn,stmt,rs);
    }
}
public void edit(Employee employee_new) throws Exception 
{
	Connection conn=null;	
	PreparedStatement stmt=null;
	
//connect to database
	try
	{
		conn=datasource.getConnection();
		String sql="update employee "
					+"set employee_password=? "
					+"where id=1";
		
		stmt=conn.prepareStatement(sql);
		stmt.setString(1,employee_new.getEmployee_password());
			
		stmt.execute();
	}
	 finally 
	    {
	     close(conn,stmt,null);
	    }
	
}

public void insert(Employee employee)
{
	
	Connection conn=null;	
	PreparedStatement stmt=null;
	
//connect to database
	try
	{
		conn=datasource.getConnection();
		String sql="INSERT into employee "+
					"(employee_name, employee_password) "+
					"VALUES (?, ?)";
		
		stmt=conn.prepareStatement(sql);
		stmt.setString(1,employee.getEmployee_name());
		stmt.setString(2,employee.getEmployee_password());
		//insert to database
				stmt.execute();
	}
	catch(Exception e)
	{				
	}
}
public List<Employee> getEmployees() throws Exception
{
List<Employee> list=new ArrayList<>();
	
Connection conn=null;
Statement stmt=null;
ResultSet rs=null;
//connect to database
try
{
	conn=datasource.getConnection();
	stmt=conn.createStatement();
	
	String sql=   "select * from employee order by id";
	rs=stmt.executeQuery(sql);
	while(rs.next())
	{
		int id=rs.getInt("id");
		if(id==1)
			continue;
		String name=rs.getString("employee_name");
		
		Employee employee=new Employee(id,name);
		
		list.add(employee);
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
	int employee_id=Integer.parseInt(id);
	Connection conn=null;	
	PreparedStatement stmt=null;
	try
	{
	conn=datasource.getConnection();
	String sql="DELETE from employee where id=?";
	
	stmt=conn.prepareStatement(sql);
	stmt.setInt(1,employee_id);
	//delete from database
			stmt.execute();
	}
	 finally 
	    {
	     close(conn,stmt,null);
	    }
}
}