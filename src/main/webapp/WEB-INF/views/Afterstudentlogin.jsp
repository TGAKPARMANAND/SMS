<!DOCTYPE html>

<html>
<head>
<title>Welcome to school_name</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<!-- <link href="layout/styles/layout.css" rel="stylesheet" type="text/css" media="all"> -->

    <link href="${pageContext.request.contextPath}/resources/css/layout.css" rel="stylesheet" >



</head>
<body id="top">
<div class="wrapper row0">
  <header id="header" class="hoc clear"> 
    <!-- ################################################################################################ -->
    <div id="logo" class="fl_left">
      <h1>School Name</h1>
      
      <p>Good thought</p>
    </div>
    <!-- ################################################################################################ -->
    <nav id="mainav" class="fl_right">
      <p style="text-align: right;">Welcome to Mr/Mrs/ms : Student Name </p>
 <p style="text-align: right;"><a  href="#" >Log out</a></p>
    </nav>
    <!-- ################################################################################################ -->
  </header>
</div>

<div class="wrapper row3">
  <main class="hoc container clear"> 
    <!-- main body -->
    <div class="sidebar one_quarter first"> 
      <h6>Student Service</h6>
      <nav class="sdb_holder">
        <ul>
          <li><a href="#">Navigation - Level 1</a></li>
          <li><a href="#">Navigation - Level 1</a>
            <ul>
              <li><a href="#">Navigation - Level 2</a></li>
              <li><a href="#">Navigation - Level 2</a></li>
            </ul>
          </li>
          <li><a href="#">Navigation - Level 1</a>
            <ul>
              <li><a href="#">Navigation - Level 2</a></li>
              <li><a href="#">Navigation - Level 2</a>
                <ul>
                  <li><a href="#">Navigation - Level 3</a></li>
                  <li><a href="#">Navigation - Level 3</a></li>
                </ul>
              </li>
            </ul>
          </li>
          <li><a href="#">Navigation - Level 1</a></li>
        </ul>
      </nav>

    
    </div>
  
    <div class="content three_quarter"> 
   
      <h1>Student data show area</h1>
     
      <p>Students data will show this area ................................................</p>
    
     
    </div>
     <script src="${pageContext.request.contextPath}/resources/js/sweetalert2.all.min.js"></script>

</body>
</html>