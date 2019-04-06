package com.tcs.drr;

public class Loan 
{
	private int id;
	private String tol;
	private double amount;
	private String date;
	private int tenure;
	
	public Loan(int id, String tol, double amount, String date, int tenure)
	{
		this.id = id;
		this.tol = tol;
		this.amount = amount;
		this.date = date;
		this.tenure = tenure;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTol() {
		return tol;
	}

	public void setTol(String tol) {
		this.tol = tol;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public int getTenure() {
		return tenure;
	}

	public void setTenure(int tenure) {
		this.tenure = tenure;
	}	
	
}
