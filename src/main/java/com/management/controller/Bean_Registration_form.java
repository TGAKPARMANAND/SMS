package com.management.controller;

import java.util.Arrays;

public class Bean_Registration_form {

	
	public String imagename;
	public String getImagename() {
		return imagename;
	}
	public void setImagename(String imagename) {
		this.imagename = imagename;
	}
	public byte[] image1;
	public byte[] getImage1() {
		return image1;
	}
	public void setImage1(byte[] image1) {
		this.image1 = image1;
	}
	public int stdid;
	public int getStdid() {
		return stdid;
	}
	public void setStdid(int stdid) {
		this.stdid = stdid;
	}
	public String name;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String fathername;
	public String getFathername() {
		return fathername;
	}
	public void setFathername(String fathername) {
		this.fathername = fathername;
	}
	public String mobile;
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String dob;
	
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public String adhar;
	public String getAdhar() {
		return adhar;
	}
	public void setAdhar(String adhar) {
		this.adhar = adhar;
	}
	public String gender;
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String category;
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String qualification;
	public String getQualification() {
		return qualification;
	}
	public void setQualification(String qualification) {
		this.qualification = qualification;
	}
	public String address;
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String pin;
	public String getPin() {
		return pin;
	}
	public void setPin(String pin) {
		this.pin = pin;
	}
	public String job;
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public String classadmission;
	public String getClassadmission() {
		return classadmission;
	}
	public void setClassadmission(String classadmission) {
		this.classadmission = classadmission;
	}
	@Override
	public String toString() {
		return "Bean_Registration_form [imagename=" + imagename + ", image1=" + Arrays.toString(image1) + ", stdid="
				+ stdid + ", name=" + name + ", fathername=" + fathername + ", mobile=" + mobile + ", dob=" + dob
				+ ", adhar=" + adhar + ", gender=" + gender + ", category=" + category + ", qualification="
				+ qualification + ", address=" + address + ", pin=" + pin + ", job=" + job + ", classadmission="
				+ classadmission + "]";
	}
	
	
}
