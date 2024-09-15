package com.management.controller;


import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

@Repository
public class repositoryimp implements repositoryinterface {

	@Autowired
	public JdbcTemplate jt;
	
	public List<beean> findBySqlQuery(String sqlStr) {
		String q=sqlStr;
		return this.jt.query(q,BeanPropertyRowMapper.newInstance(beean.class));
	}

	@Override
	public void savadata(String fname,String fathname,String email,String mobile,String gender,String address,
			String jobtype,String cd,String enqury)
	{
		Connection connection=null;
		
		String query="insert into std_reg (name,fathername,email,mobile,Gender,District,qualification,category,purpose) values(?,?,?,?,?,?,?,?,?)";
		try {
			connection = jt.getDataSource().getConnection();
			PreparedStatement ps = connection.prepareStatement(query);
			
			ps.setString(1, fname);
			ps.setString(2, fathname);
			ps.setString(3, email);
			ps.setString(4, mobile);
			ps.setString(5, gender);
			ps.setString(6, address);
			ps.setString(7, jobtype);
			ps.setString(8, cd);
			ps.setString(9, enqury);
			ps.execute(); 
			connection.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public String savaRegistrationdata(String fname, String fathname, String email,String mob1,String dob1,String adhar1, String gender1,String cat1,
			String qualification1 ,String address1 ,
			String pin1,String job1 ,String classadmission1,MultipartFile file2,String pwd
			) 
	{
		
		Connection connection=null;
		System.out.println(job1+""+classadmission1);
		//String query="insert into Registration_Form values(?,?,?,?,?,?,?,?,?,?)";
		String query="insert into Registration_Form (name,fathername,email,mobile,dob,adhar,gender,category,"
				+ "qualification,address,pincode,job,classadmission,imagename,photo,password) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		
		try {
			Bean_Registration_form brf = new Bean_Registration_form();
			brf.setImagename(file2.getOriginalFilename());
			brf.setImage1(file2.getBytes());
			connection = jt.getDataSource().getConnection();
			PreparedStatement ps = connection.prepareStatement(query);
			
			ps.setString(1, fname);
			ps.setString(2, fathname);
			ps.setString(3, email);
			ps.setString(4, mob1);
			ps.setString(5, dob1);
			ps.setString(6, adhar1);
			ps.setString(7, gender1);
			ps.setString(8, cat1);
			ps.setString(9, qualification1);
			ps.setString(10, address1);
			ps.setString(11, pin1);
			ps.setString(12, job1);
			ps.setString(13, classadmission1);
			ps.setString(14, brf.imagename);
			ps.setBytes(15, brf.image1);
			ps.setString(16, pwd);
			ps.executeUpdate(); 
			connection.close();
			return"success";
			
		} catch (SQLException | IOException e) {
			System.out.println(e);
			e.printStackTrace();
		}
		return"success";


	}

	@Override
	public beean findregistrationdetail(String enqno) {
		beean obj = new beean();
		Connection connection=null;
		ResultSet rs=null;
		System.out.println(enqno);
		
		String query="select * from std_reg where id="+enqno+"";
		//String query="select * from std_reg where id=10";
		
		try {
			connection = jt.getDataSource().getConnection();
			PreparedStatement ps = connection.prepareStatement(query);
			
			
			
			rs=ps.executeQuery();
			while(rs.next()){ 
				obj.setFirstName(rs.getString("name"));
				obj.setFathername(rs.getString("fathername"));
				obj.setEmail(rs.getString("email"));
				obj.setMobile(rs.getString("mobile"));
				
				obj.setAddress(rs.getString("District"));
				
				
				
				 
				}  
			
			System.out.println(obj);
			connection.close();
			return obj;
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return obj;


		
	
	}

	@Override
	public void stdfeedbacksave(String stdname, String stdemail, String stdfeedback) {
    
		Connection connection=null;
		System.out.println(stdname+""+stdfeedback);

		String query="insert into std_feedback(Name,emailid,FeedBack) values(?,?,?)";
		
		try {
			connection = jt.getDataSource().getConnection();
			PreparedStatement ps = connection.prepareStatement(query);
			
			ps.setString(1, stdname);
			ps.setString(2, stdemail);
			ps.setString(3, stdfeedback);
			 ps.executeUpdate();
				System.out.println("Success");
			connection.close();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		


		
	}

	@Override
	public void teacherfeedbacksave(String tname, String temail, String tcourse, String texp, String tfeedback) 
	{
		Connection connection=null;
		System.out.println(tname+""+temail);

		String query="insert into teacher_feedback(Name,EmailId,Course,TeachingExp,TFeedBack) values(?,?,?,?,?)";
		
		try {
			connection = jt.getDataSource().getConnection();
			PreparedStatement ps = connection.prepareStatement(query);
			
			ps.setString(1, tname);
			ps.setString(2, temail);
			ps.setString(3, tcourse);
			ps.setString(4, texp);
			ps.setString(5, tfeedback);
			 ps.executeUpdate();
				System.out.println("Success");
			connection.close();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		
	}

	@Override
	public Boolean loginteacherstd(String username1, String password1) 
	{
		loginmodel obj = new loginmodel();
		Connection connection=null;
		ResultSet rs=null;
		
		
		String query="select email,password from Registration_Form where email='"+username1+"' and password='"+password1+"'";
		
		
		try {
			connection = jt.getDataSource().getConnection();
			PreparedStatement ps = connection.prepareStatement(query);			
			rs=ps.executeQuery();
			while(rs.next()){ 
				obj.setUsername(rs.getString("email"));
				obj.setPassword(rs.getString("password"));
				
				System.out.println("username and password is correct");
				
				return true;
				 
				}  
			
			
			 connection.close();
		
		}
		catch (SQLException e) 
		{
			
			e.printStackTrace();
		}

		return false;
	}

	@Override
	public String savecertificate(String classnameofschool, MultipartFile lkg,String stdid) {
		String nursery1="NURSERY";
		String LKG1="LKG";
		String UKG1="UKG";
		String Class1="Class 1";
		String Class2="Class 2";
		String Class3="Class 3";
		String Class4="Class 4";
		String Class5="Class 5";
		String Class6="Class 6";
		String Class7="Class 7";
		String Class8="Class 8";
		String Class9="Class 9";
		String Class10="Class 10";
		String Class11="Class 11";
		String Class12="Class 12";

		
		certificatemodel cf = new certificatemodel();
		Connection connection=null;
		PreparedStatement ps;
				
		try {
		
			cf.setLkgname(lkg.getOriginalFilename());
			cf.setNursery(lkg.getBytes());
			
			String query="update certificate_upload set nurseryname=?,nurseryphoto=? where id=?";
			String querylkg="update certificate_upload set lkgname=?,lkgphoto=? where id=?";
			String queryukg="update certificate_upload set ukgname=?,ukgphoto=? where id=?";
			String queryClass1="update certificate_upload set firstname=?,firstphoto=? where id=?";
			String queryClass2="update certificate_upload set secondname=?,secondphoto=? where id=?";
			String queryClass3="update certificate_upload set thirdname=?,thirdphoto=? where id=?";
			String queryClass4="update certificate_upload set fourname=?,fourphoto=? where id=?";
			String queryClass5="update certificate_upload set fivename=?,fivephoto=? where id=?";
			String queryClass6="update certificate_upload set sixname=?,sixphoto=? where id=?";
			String queryClass7="update certificate_upload set sevenname=?,sevenphoto=? where id=?";
			String queryClass8="update certificate_upload set eightname=?, eightphoto=? where id=?";
			String queryClass9="update certificate_upload set ninename=?,ninephoto=? where id=?";
			String queryClass10="update certificate_upload set tenname=?,tenphoto=? where id=?";
			String queryClass11="update certificate_upload set elevenname=?,elevenphoto=? where id=?";
			String queryClass12="update certificate_upload set twelvename=?,twelvephoto=? where id=?";
			connection = jt.getDataSource().getConnection();
		

			if(nursery1.equalsIgnoreCase(classnameofschool))
			{
		    ps = connection.prepareStatement(query);
			ps.setString(1, lkg.getOriginalFilename());
			ps.setBytes(2, lkg.getBytes());
			ps.setString(3, stdid);
			int b=	ps.executeUpdate(); 
			System.out.println("Good done "+b);
			}
			if(LKG1.equalsIgnoreCase(classnameofschool))
			{
		    ps = connection.prepareStatement(querylkg);
			ps.setString(1, lkg.getOriginalFilename());
			ps.setBytes(2, lkg.getBytes());
			ps.setString(3, stdid);	
			int b=	ps.executeUpdate(); 
			System.out.println("Good done "+b);
			}
			if(UKG1.equalsIgnoreCase(classnameofschool))
			{
		    ps = connection.prepareStatement(queryukg);
			ps.setString(1, lkg.getOriginalFilename());
			ps.setBytes(2, lkg.getBytes());
			ps.setString(3, stdid);
			int b=	ps.executeUpdate(); 
			System.out.println("Good done "+b);
			}
			if(Class1.equalsIgnoreCase(classnameofschool))
			{
		    ps = connection.prepareStatement(queryClass1);
			ps.setString(1, lkg.getOriginalFilename());
			ps.setBytes(2, lkg.getBytes());
			ps.setString(3, stdid);
			int b=	ps.executeUpdate(); 
			System.out.println("Good done "+b);
			}
			if(Class2.equalsIgnoreCase(classnameofschool))
			{
		    ps = connection.prepareStatement(queryClass2);
			ps.setString(1, lkg.getOriginalFilename());
			ps.setBytes(2, lkg.getBytes());
			ps.setString(3, stdid);
			int b=	ps.executeUpdate(); 
			System.out.println("Good done "+b);
			}
			if(Class3.equalsIgnoreCase(classnameofschool))
			{
		    ps = connection.prepareStatement(queryClass3);
			ps.setString(1, lkg.getOriginalFilename());
			ps.setBytes(2, lkg.getBytes());
			ps.setString(3, stdid);
			int b=	ps.executeUpdate(); 
			System.out.println("Good done "+b);
			}
			if(Class4.equalsIgnoreCase(classnameofschool))
			{
		    ps = connection.prepareStatement(queryClass4);
			ps.setString(1, lkg.getOriginalFilename());
			ps.setBytes(2, lkg.getBytes());
			ps.setString(3, stdid);
			int b=	ps.executeUpdate(); 
			System.out.println("Good done "+b);
			}

			if(Class5.equalsIgnoreCase(classnameofschool))
			{
		    ps = connection.prepareStatement(queryClass5);
			ps.setString(1, lkg.getOriginalFilename());
			ps.setBytes(2, lkg.getBytes());
			ps.setString(3, stdid);
			int b=	ps.executeUpdate(); 
			System.out.println("Good done "+b);
			}
			
			if(Class6.equalsIgnoreCase(classnameofschool))
			{
		    ps = connection.prepareStatement(queryClass6);
			ps.setString(1, lkg.getOriginalFilename());
			ps.setBytes(2, lkg.getBytes());
			ps.setString(3, stdid);
			int b=	ps.executeUpdate(); 
			System.out.println("Good done "+b);
			}
			
			if(Class7.equalsIgnoreCase(classnameofschool))
			{
		    ps = connection.prepareStatement(queryClass7);
			ps.setString(1, lkg.getOriginalFilename());
			ps.setBytes(2, lkg.getBytes());
			ps.setString(3, stdid);
			int b=	ps.executeUpdate(); 
			System.out.println("Good done "+b);
			}
			if(Class8.equalsIgnoreCase(classnameofschool))
			{
		    ps = connection.prepareStatement(queryClass8);
			ps.setString(1, lkg.getOriginalFilename());
			ps.setBytes(2, lkg.getBytes());
			ps.setString(3, stdid);
			int b=	ps.executeUpdate(); 
			System.out.println("Good done "+b);
			}
			if(Class9.equalsIgnoreCase(classnameofschool))
			{
		    ps = connection.prepareStatement(queryClass9);
			ps.setString(1, lkg.getOriginalFilename());
			ps.setBytes(2, lkg.getBytes());
			ps.setString(3, stdid);
			int b=	ps.executeUpdate(); 
			System.out.println("Good done "+b);
			}
			if(Class10.equalsIgnoreCase(classnameofschool))
			{
		    ps = connection.prepareStatement(queryClass10);
			ps.setString(1, lkg.getOriginalFilename());
			ps.setBytes(2, lkg.getBytes());
			ps.setString(3, stdid);
			int b=	ps.executeUpdate(); 
			System.out.println("Good done "+b);
			}
			if(Class11.equalsIgnoreCase(classnameofschool))
			{
		    ps = connection.prepareStatement(queryClass11);
			ps.setString(1, lkg.getOriginalFilename());
			ps.setBytes(2, lkg.getBytes());
			ps.setString(3, stdid);
			int b=	ps.executeUpdate(); 
			System.out.println("Good done "+b);
			}
			if(Class12.equalsIgnoreCase(classnameofschool))
			{
		    ps = connection.prepareStatement(queryClass12);
			ps.setString(1, lkg.getOriginalFilename());
			ps.setBytes(2, lkg.getBytes());
			ps.setString(3, stdid);
			int b=	ps.executeUpdate(); 
			System.out.println("Good done "+b);
			}
			connection.close();
			return"success";
			
		} catch (SQLException | IOException e) {
			System.out.println(e);
			e.printStackTrace();
		}
		return"success";

	
	
	
	}

}