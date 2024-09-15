<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Teacher Feedback Form</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
     <script src="https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.all.min.js"></script>
 <link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.min.css'></link>  
    
    <link href="${pageContext.request.contextPath}/resources/css/main.css" rel="stylesheet" >

 <script src="${pageContext.request.contextPath}/resources/js/sweetalert2.all.min.js"></script>
    
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
            <h2 class="text-center">Teacher Feedback</h2>
            <form id="teacherFeedbackForm" action="" method="post">
                <div class="form-group">
                    <label for="teacherName">Name:</label>
                    <input type="text" id="teacherName" name="teacherName" class="form-control" required>
                    <div id="teacherNameFeedback" class="invalid-feedback">Name should not contain numbers or special symbols.</div>
                </div>
                <div class="form-group">
                    <label for="teacherEmail">Email:</label>
                    <input type="email" id="teacherEmail" name="teacherEmail" class="form-control">
                    <div id="teacherEmailFeedback" class="invalid-feedback">Please enter a valid email address.</div>
                </div>
                <div class="form-group">
                    <label for="course">Course:</label>
                    <input type="text" id="course" name="course" class="form-control" required placeholder="e.g., Introduction to Computer Science (CS101)">
                    <div id="courseFeedback" class="invalid-feedback">Course cannot be empty or contain only numbers.</div>
                </div>
                <div class="form-group">
                    <label for="teachingExperience">Teaching Experience (in years):</label>
                    <input type="number" id="teachingExperience" name="teachingExperience" class="form-control" required min="0" step="1">
                    <div id="teachingExperienceFeedback" class="invalid-feedback">Teaching experience must be a positive integer.</div>
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
            var nameField = document.getElementById('teacherName');
            var emailField = document.getElementById('teacherEmail');
            var courseField = document.getElementById('course');
            var teachingExperienceField = document.getElementById('teachingExperience');
            var feedbackField = document.getElementById('feedback');
            var form = document.getElementById('teacherFeedbackForm');

            function validateName() {
                if (/[^a-zA-Z\s]/.test(nameField.value)) {
                    nameField.classList.add('is-invalid');
                    document.getElementById('teacherNameFeedback').style.display = 'block';
                } else {
                    nameField.classList.remove('is-invalid');
                    document.getElementById('teacherNameFeedback').style.display = 'none';
                }
            }

            function validateEmail() {
                var emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
                if (!emailPattern.test(emailField.value)) {
                    emailField.classList.add('is-invalid');
                    document.getElementById('teacherEmailFeedback').style.display = 'block';
                } else {
                    emailField.classList.remove('is-invalid');
                    document.getElementById('teacherEmailFeedback').style.display = 'none';
                }
            }

            function validateCourse() {
                var courseValue = courseField.value.trim();
                if (courseValue === '') {
                    courseField.classList.add('is-invalid');
                    document.getElementById('courseFeedback').textContent = 'Course cannot be empty.';
                    document.getElementById('courseFeedback').style.display = 'block';
                } else if (/^\d+$/.test(courseValue)) {
                    courseField.classList.add('is-invalid');
                    document.getElementById('courseFeedback').textContent = 'Course cannot contain only numbers.';
                    document.getElementById('courseFeedback').style.display = 'block';
                } else {
                    courseField.classList.remove('is-invalid');
                    document.getElementById('courseFeedback').style.display = 'none';
                }
            }

            function validateTeachingExperience() {
                var teachingExperience = teachingExperienceField.value.trim();
                if (teachingExperience === '') {
                    teachingExperienceField.classList.remove('is-invalid');
                    document.getElementById('teachingExperienceFeedback').style.display = 'none';
                } else {
                    var teachingExperienceNumber = parseInt(teachingExperience, 10);
                    if (isNaN(teachingExperienceNumber) || teachingExperienceNumber < 0) {
                        teachingExperienceField.classList.add('is-invalid');
                        document.getElementById('teachingExperienceFeedback').style.display = 'block';
                    } else {
                        teachingExperienceField.classList.remove('is-invalid');
                        document.getElementById('teachingExperienceFeedback').style.display = 'none';
                    }
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
            courseField.addEventListener('input', validateCourse);
            teachingExperienceField.addEventListener('input', validateTeachingExperience);
            feedbackField.addEventListener('input', validateFeedback);

            form.addEventListener('submit', function(event) {
                validateName();
                validateEmail();
                validateCourse();
                validateTeachingExperience();
                validateFeedback();

                if (nameField.classList.contains('is-invalid') ||
                    emailField.classList.contains('is-invalid') ||
                    courseField.classList.contains('is-invalid') ||
                    teachingExperienceField.classList.contains('is-invalid') ||
                    feedbackField.classList.contains('is-invalid')) {
                    event.preventDefault(); // Prevent form submission if validation fails
                }
            });
        });
    </script>
    
    
</body>
<script>
$('#submitbtn').click(function(){

	  var tname  =	$('#teacherName').val();
	    var temail = $('#teacherEmail').val();
	    var tcourse = $('#course').val();
	    var texp = $('#teachingExperience').val();
	    var tfeedback = $('#feedback').val();
	    
	    	alert(tfeedback);
	    	$.ajax({
	    		
	    		type:"POST",
	    		url:"/teacherfbsendtoserver",
	    		data:{'tname1':tname,'temail1':temail,'tcourse1':tcourse,'text1':texp,'feedback1':tfeedback},
	    		success:function(response)
	    		{
	    			swal("Record Inserted Successfully");
	    		},
	    		error:function(response)
	    		{
	    			swal("ajax error std feedback");
	    		}
	    		
	    	});
	    	

});


</script>





</html>
