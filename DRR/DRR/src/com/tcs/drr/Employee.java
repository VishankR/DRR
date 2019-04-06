package com.tcs.drr;

public class Employee 
{
int id;
String employee_name;
String employee_password;

public Employee(int id, String employee_name) {
	this.id = id;
	this.employee_name = employee_name;
}

public Employee(String employee_name, String employee_password) 
{
	this.employee_name = employee_name;
	this.employee_password = employee_password;
}

public int getId() {
	return id;
}

public void setId(int id) {
	this.id = id;
}

public String getEmployee_name() {
	return employee_name;
}

public void setEmployee_name(String employee_name) {
	this.employee_name = employee_name;
}

public String getEmployee_password() {
	return employee_password;
}

public void setEmployee_password(String employee_password) {
	this.employee_password = employee_password;
}


}
