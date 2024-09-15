<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
 <script src="https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.all.min.js"></script>
 <link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.min.css'></link>  

    <link href="${pageContext.request.contextPath}/resources/css/main.css" rel="stylesheet" >

 <script src="${pageContext.request.contextPath}/resources/js/sweetalert2.all.min.js"></script>
 
    <meta charset="UTF-8">
    <title>Student Feedback Form</title>
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> 
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f4f7f6;
        }
        .feedback-form {
            max-width: 600px;
            margin: 5% auto;
            padding: 2em;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        }
        .feedback-form h2 {
            margin-bottom: 1em;
            color: #333;
        }
        .feedback-form .form-control {
            border-radius: 0.25rem;
        }
        .feedback-form .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }
        .feedback-form .btn-primary:hover {
            background-color: #0056b3;
            border-color: #004085;
        }
        .feedback-form .form-group {
            margin-bottom: 1.5em;
        }
        .invalid-feedback {
            display: none;
            color: red;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="feedback-form">
            <h2 class="text-center">Student Feedback</h2>
            <form id="feedbackForm" action="" method="post">
                <div class="form-group">
                    <label for="studentName">Name:</label>
                    <input type="text" id="studentName" name="studentName" value="jay prkash" class="form-control" required>
                    <div id="nameFeedback" class="invalid-feedback">Name should not contain numbers or special symbols.</div>
                </div>
                <div class="form-group">
                    <label for="studentEmail">Email:</label>
                    <input type="email" id="studentEmail" name="studentEmail" value="jay@gmail.com" class="form-control">
                    <div id="emailFeedback" class="invalid-feedback">Please enter a valid email address.</div>
                </div>
                <div class="form-group">
                    <label for="feedback">Feedback:</label>
                    <textarea id="feedback" name="feedback" class="form-control" rows="5" required></textarea>
                    <div id="feedbackFeedback" class="invalid-feedback">Feedback must be at least 20 words.</div>
                </div>
                <div class="form-group text-center">
                    <button type="button" class="btn btn-primary" id="submitbtn">Submit</button>
                    <button type="reset" class="btn btn-secondary ml-2">Reset</button>
                </div>
            </form>
        </div>
    </div>
   <!--  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script> -->
     <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            var nameField = document.getElementById('studentName');
            var emailField = document.getElementById('studentEmail');
            var feedbackField = document.getElementById('feedback');
            var form = document.getElementById('feedbackForm');

            function validateName() {
                if (/[^a-zA-Z\s]/.test(nameField.value)) {
                    nameField.classList.add('is-invalid');
                    document.getElementById('nameFeedback').style.display = 'block';
                } else {
                    nameField.classList.remove('is-invalid');
                    document.getElementById('nameFeedback').style.display = 'none';
                }
            }

            function validateEmail() {
                var emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
                if (!emailPattern.test(emailField.value)) {
                    emailField.classList.add('is-invalid');
                    document.getElementById('emailFeedback').style.display = 'block';
                } else {
                    emailField.classList.remove('is-invalid');
                    document.getElementById('emailFeedback').style.display = 'none';
                }
            }

            function validateFeedback() {
                var feedbackWords = feedbackField.value.trim().split(/\s+/).length;
                if (feedbackWords < 20) {
                    feedbackField.classList.add('is-invalid');
                    document.getElementById('feedbackFeedback').style.display = 'block';
                } else {
                    feedbackField.classList.remove('is-invalid');
                    document.getElementById('feedbackFeedback').style.display = 'none';
                }
            }

            nameField.addEventListener('input', validateName);
            emailField.addEventListener('input', validateEmail);
            feedbackField.addEventListener('input', validateFeedback);

            form.addEventListener('submit', function(event) {
                validateName();
                validateEmail();
                validateFeedback();

                if (nameField.classList.contains('is-invalid') ||
                    emailField.classList.contains('is-invalid') ||
                    feedbackField.classList.contains('is-invalid')) {
                    event.preventDefault(); // Prevent form submission if validation fails
                }
            });
        });
    </script>
    
    <script>
    $('#submitbtn').click(function(){
    var stdname  =	$('#studentName').val();
    var stdemail = $('#studentEmail').val();
    var feedback = $('#feedback').val();
    
    
    	$.ajax({
    		
    		type:"POST",
    		url:"/fbsendtoserver",
    		data:{'stdname1':stdname,'stdemail1':stdemail,'feedback1':feedback},
    		success:function(response)
    		{
    			swal("Record Inserted successfully");
    		},
    		error:function(response)
    		{
    			swal("ajax error std feedback");
    		}
    		
    	});
    	
    });
    
    </script>
    
</body>
</html>
