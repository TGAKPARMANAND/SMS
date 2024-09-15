package com.management.controller;

import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

public class beean {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	 private int id;
	 
	 
		private String firstName;
		
		public String getFirstName() {
			return firstName;
		}
		public void setFirstName(String firstName) {
			this.firstName = firstName;
		}

		
	
	public beean(){}
	
	 public beean(int id)
	  {
	    this.id = id;
	    
	  }
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	public String fathername;

	public String getFathername() {
		return fathername;
	}
	public void setFathername(String fathername) {
		this.fathername = fathername;
	}
	
	public String email;
	

	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

	public String mobile;
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	
	public String gender;
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}

	public String address;
	
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String jobtype;
	public String getJobtype() {
		return jobtype;
	}
	public void setJobtype(String jobtype) {
		this.jobtype = jobtype;
	}

	public String cd;
	public String getCd() {
		return cd;
	}
	public void setCd(String cd) {
		this.cd = cd;
	}

	public String enqury;
	
	public String getEnqury() {
		return enqury;
	}
	public void setEnqury(String enqury) {
		this.enqury = enqury;
	}
	@Override
	public String toString() {
		return "beean [id=" + id + ", firstName=" + firstName + ", fathername=" + fathername + ", email=" + email
				+ ", mobile=" + mobile + ", gender=" + gender + ", address=" + address + ", jobtype=" + jobtype
				+ ", cd=" + cd + ", enqury=" + enqury + "]";
	}	
	
	
}
