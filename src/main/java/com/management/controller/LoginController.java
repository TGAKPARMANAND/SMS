package com.management.controller;




import java.io.IOException;

import javax.servlet.RequestDispatcher;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;







@Controller
@RequestMapping("/")
public class LoginController {

	@Autowired(required=true)
	private repositoryinterface daoobj;
	
	@RequestMapping("/login")
	public ModelAndView login(ModelAndView mv)
	{
		mv.setViewName("login");
		return mv;
	}
	
	@RequestMapping("/Uploadcertificates")
	public ModelAndView Uploadcertificates(ModelAndView mv)
	{
		mv.setViewName("fileUpload");
		return mv;
	}
	
	@RequestMapping("/attendence")
	public ModelAndView lattendenceogin(ModelAndView mv)
	{
		mv.setViewName("attendence");
		return mv;
	}
	
	
	
	@PostMapping("/sendtocontroller")
	@ResponseBody
    public String handlePostRequest(@RequestBody @RequestParam("name2") String fname,
    		@RequestParam("email") String email,@RequestParam("mobile") String mobile,
    		@RequestParam("gender") String gender,@RequestParam("address") String address,
    		@RequestParam("jobtype") String jobtype,@RequestParam("cd") String cd,@RequestParam("enqury") String enqury,
    		@RequestParam("fathname") String fathname,ModelAndView mv) 
	{
		
        
       
        this.daoobj.savadata(fname,fathname,email,mobile,gender,address,jobtype,cd,enqury);
       // System.out.println(b);
        return "success";

	
	}
	@RequestMapping("/index")
	public ModelAndView index(ModelAndView mv)
	{
		System.out.println("jay");
		mv.setViewName("index");
		return mv;
	}
	
	@RequestMapping("/TeacherRegistration")
	public ModelAndView TeachersRegistration(ModelAndView mv)
	{
		System.out.println("jay");
		mv.setViewName("TeacherRegistration");
		return mv;
	}
	
	@RequestMapping("/enquery")
	public ModelAndView Enquery(ModelAndView mv)
	{
		mv.setViewName("Enquery");
		return mv;
	}
	
	@RequestMapping("/RegistraionStudent")
	public ModelAndView RegistrationStudent(ModelAndView mv)
	{
		
		mv.setViewName("RegistraionStudent");
		return mv;
	}
	@RequestMapping("/RegistrationFormInserte")
	@ResponseBody
	public String Registrationform(@RequestBody @RequestParam("name") String fname,
    			@RequestParam("fname") String fathname,@RequestParam("email") String email,
    			@RequestParam("mob") String mob1,@RequestParam("dob") String dob1,
    			@RequestParam("adhar") String adhar1,@RequestParam("gender") String gender1,
    			@RequestParam("cat") String cat1,@RequestParam("qualification") String qualification1,
    			@RequestParam("address") String address1,@RequestParam("pin") String pin1,
    			@RequestParam("job") String job1,@RequestParam("admissionclass") String classadmission1,
    			@RequestParam("file2") MultipartFile file2) 
	
	
	{
		System.out.println(pin1);
		System.out.println(file2.getOriginalFilename());
       
		//PasswordGenerate pd = new PasswordGenerate();
		String pwd=PasswordGenerate.generateRandomString(10);
		
       String b= this.daoobj.savaRegistrationdata(fname,fathname,email,mob1,dob1,adhar1,gender1,cat1,qualification1
    		   ,address1,pin1,job1,classadmission1,file2,pwd);
        
        System.out.println(b); 
       // String pwd=PasswordGenerate.generateRandomString(10);
        return pwd;

	
	}
	
	@RequestMapping("/showregistrationdetail")
	@ResponseBody
	public beean showregistrationdetail(@RequestParam("enqid") String enqno)
	{
		
		beean lis=this.daoobj.findregistrationdetail(enqno);
		System.out.println(lis);
		return lis;
	}
	
	@RequestMapping("/Pay_Fees_Page")
	public ModelAndView Pay_Fees_Page(ModelAndView mv)
	{
		mv.setViewName("Pay_Fees_Page");
		return mv;
	}
	
	@RequestMapping("/Afterstudentlogin")
	public ModelAndView Afterstudentlogin(ModelAndView mv)
	{
		mv.setViewName("Afterstudentlogin");
		return mv;
	}
	@RequestMapping("/teacherFeedback")
	public ModelAndView teacherFeedback(ModelAndView mv)
	{
		mv.setViewName("teacherFeedback");
		return mv;
	}
	@RequestMapping("/studentFeedback")
	public ModelAndView studentFeedback(ModelAndView mv)
	{
		mv.setViewName("studentFeedback");
		return mv;
	}
	
	@PostMapping(value="/fbsendtoserver")
	@ResponseBody
	public void stdfeedback(@RequestParam("stdname1") String stdname,@RequestParam("stdemail1") String stdemail,@RequestParam("feedback1") String stdfeedback)
    {
		System.out.println(stdname);
		System.out.println(stdemail);
		System.out.println(stdfeedback);
    	this.daoobj.stdfeedbacksave(stdname,stdemail,stdfeedback);
    }
	
	@PostMapping(value="/teacherfbsendtoserver")
	@ResponseBody
	public void teacherfeedback(@RequestParam("tname1") String tname,@RequestParam("temail1") String temail,
			@RequestParam("tcourse1") String tcourse,@RequestParam("text1") String texp,@RequestParam("feedback1") String tfeedback)
    {
		System.out.println(tname);
		System.out.println(temail);
		System.out.println(tcourse);
		System.out.println(texp);
		System.out.println(tfeedback);
    	this.daoobj.teacherfeedbacksave(tname,temail,tcourse,texp,tfeedback);
    }
	
	@RequestMapping(value="/loginsercall")
	@ResponseBody
	public Boolean  loginsercall(HttpServletRequest req, HttpServletResponse resp,@RequestParam("username") String username1,@RequestParam("password") String password1) throws IOException, ServletException
	{
		
		System.out.println(username1);
		System.out.println(password1);
		
		Boolean b=this.daoobj.loginteacherstd(username1,password1);
			
         System.out.println("jayGood"+b);
		 
		return b;
		
	}

	@PostMapping("/savecertificate")
	@ResponseBody
	public String savecertificate(@RequestParam("classname1") String classname1,@RequestParam("certificate1") MultipartFile lkg,@RequestParam("stdid2") String stdid)
	{
		
		System.out.println("ok");
		String msg = this.daoobj.savecertificate(classname1,lkg,stdid);
		
		return null;
	}
	
	
	
}

