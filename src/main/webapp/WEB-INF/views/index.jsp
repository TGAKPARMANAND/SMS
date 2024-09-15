

<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
	
<html lang="eng" class="no-js">
<html>

<head>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css" />

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.0.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.3/css/dataTables.bootstrap5.min.css">
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<style type="text/css">

@media only screen and (max-width: 600px) {

.home_banner_text {
    padding: 0 !important;
    top: 50% !important;
    left: 50% !important;
    transform: translateX(-50%) translateY(-50%) !important;
    position: absolute !important;
    width: 100% !important;
}
.img {
  display: center;
  margin-left: auto;
  margin-right: auto;
  alignment:center;
}

.center {
  display: block;
  margin-left: auto;
  margin-right: auto;
  width: 50%;
}
}
</style>

</head>

<body>
    <header class="shadow">

        <div class="row">
            <div class="col-4">
                <%-- <a href="#">
                    <img src="${pageContext.request.contextPath}/Resources/images/logo1.png" alt="img" class="logo01" />
                </a> --%>
            </div>
              <div class="col-5">
                <div class="header_text">
                    <h4>School Management System</h4>
                    
                </div>
            </div>
            <div class="col-5">
               <%--  <a href="#">
                    <img src="${pageContext.request.contextPath}/Resources/images/logo.jpeg" alt="logo img" class="logo02" />
                </a> --%>
            </div>
           </div>
        <button class="navbar-toggler position-absolute d-md-none collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false" aria-label="Toggle navigation">
            <i class="fa fa-bars"></i>
        </button>
    </header>
    <div class="home_banner">
        <div class="container">
            <div class="home_banner_text">
                <div class="row justify-content-center">
                    <div class="col-12">
                    
                                         
	
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="enquery">Enquery</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="navbar-brand" href="RegistraionStudent">Student Registration <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="navbar-brand" href="Pay_Fees_Page">Fees Payment</a>
      </li>
      <li class="nav-item dropdown">
       
       
      </li>
      <li class="nav-item">
        <a class="navbar-brand" href="TeacherRegistration">Teacher Registration</a>
      </li>
    </ul>
   
      <input class="form-control mr-sm-1" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    
      </div>
</nav>
   
     <div >
  
            <img src="${pageContext.request.contextPath}/Resources/images/logo1.png" alt="img" style="display: block; margin-left: auto; margin-right: auto;" />
          </div>      
              <div>                 
   <button style="display: block; margin-left: auto; margin-right: auto;"><a href="login" class="rounded-pill" >LOGIN (लॉगिन)</a></button>
                       
    </div>

<footer class="bg-body-tertiary text-center">
  <!-- Grid container -->
  <div class="container p-4"></div>
  <!-- Grid container -->

  <!-- Copyright -->
  <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.05);">
  <div>
    <a href="studentFeedback">Student Feedback</a>
    
    <a href="teacherFeedback">Teacher Feedback</a>
    <a href="Uploadcertificates">Upload Certificate</a>
    </div>
      <div>
   
    
    <a href="attendence">View Attendence</a>
    </div>
    
  </div>
  
</footer>
	
	 
                    
	</div>
       
                </div>
            </div>
        </div>
    </div>
    <div class="home_mini_footer">
            </div>

</body>

</html>
