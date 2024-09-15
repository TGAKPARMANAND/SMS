package com.management.controller;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public interface repositoryinterface {

	//public abstract List<beean> findBySqlQuery(String paramString);
	public void savadata(String fname,String fathname,String email,String mobile, String gender, String address,
			String jobtype,String cd,String enqury);
	public String savaRegistrationdata(String fname,String fathname,String email,String mob1, String dob1
			,String adhar1,String gender1,String cat1,String qualification1 ,String address1 ,
			String pin1,String job1 ,String classadmission1,MultipartFile file2, String pwd
			);
	public beean findregistrationdetail(String enqno);
	public void stdfeedbacksave(String stdname, String stdemail, String stdfeedback);
	public void teacherfeedbacksave(String tname, String temail, String tcourse, String texp, String tfeedback);
	public Boolean loginteacherstd(String username1, String password1);

	/*
	 * public String savecertificate(MultipartFile nursery, MultipartFile lkg,
	 * MultipartFile ukg, MultipartFile first, MultipartFile second, MultipartFile
	 * third, MultipartFile fourth, MultipartFile fifth, MultipartFile sixth,
	 * MultipartFile seven, MultipartFile eight, MultipartFile nine, MultipartFile
	 * ten, MultipartFile eleven, MultipartFile twelve);
	 */
	public String savecertificate(String classname1, MultipartFile lkg, String stdid);
}
