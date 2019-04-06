package com.tcs.drr;

public class Customer 
{
	private int id;
	private String first_name;
	private String last_name;
	private String gender;
	private String address;
	private String phn;
	private String email;
	private String aadhar_card;
	private String pan_card;
	private String income;
	
	public Customer(int id, String first_name, String last_name, String gender, String address, String phn,
			String email, String aadhar_card, String pan_card, String income) 
	{
		this.id = id;
		this.first_name = first_name;
		this.last_name = last_name;
		this.gender = gender;
		this.address = address;
		this.phn = phn;
		this.email = email;
		this.aadhar_card = aadhar_card;
		this.pan_card = pan_card;
		this.income = income;
	}

	public Customer(String first_name, String last_name, String gender, String address, String phn, String email,
			String aadhar_card, String pan_card, String income) {
		this.first_name = first_name;
		this.last_name = last_name;
		this.gender = gender;
		this.address = address;
		this.phn = phn;
		this.email = email;
		this.aadhar_card = aadhar_card;
		this.pan_card = pan_card;
		this.income = income;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFirst_name() {
		return first_name;
	}

	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}

	public String getLast_name() {
		return last_name;
	}

	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhn() {
		return phn;
	}

	public void setPhn(String phn) {
		this.phn = phn;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAadhar_card() {
		return aadhar_card;
	}

	public void setAadhar_card(String aadhar_card) {
		this.aadhar_card = aadhar_card;
	}

	public String getPan_card() {
		return pan_card;
	}

	public void setPan_card(String pan_card) {
		this.pan_card = pan_card;
	}

	public String getIncome() {
		return income;
	}

	public void setIncome(String income) {
		this.income = income;
	}
	}

