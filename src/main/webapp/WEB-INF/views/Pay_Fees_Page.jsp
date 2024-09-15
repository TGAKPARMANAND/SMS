<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>School Fee Payment Form</title>

<%------------------------------------------------CSS--------------------------------------------------------------- --%>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f0f0f0;
        margin: 0;
        padding: 20px;
        color: #333;
    }
    .form-container {
        max-width: 600px;
        background-color: #ffffff;
        padding: 30px;
        margin: auto;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }
    h2 {
        text-align: center;
        margin-bottom: 30px;
        color: #4CAF50;
    }
    .form-group {
        margin-bottom: 20px;
    }
    .form-group label {
        font-weight: bold;
        color: #555;
    }
    .form-group input[type="text"],
    .form-group input[type="email"],
    .form-group input[type="tel"],
    .form-group select {
        width: calc(100% - 6px);
        padding: 10px;
        font-size: 16px;
        border: 1px solid #ddd;
        border-radius: 4px;
        transition: border-color 0.3s ease;
        background-color: #f9f9f9;
    }
    .form-group input[type="text"]:focus,
    .form-group input[type="email"]:focus,
    .form-group input[type="tel"]:focus,
    .form-group select:focus {
        border-color: #4CAF50;
    }
    .form-group select {
        appearance: none;
        -webkit-appearance: none;
        background: url('data:image/svg+xml;utf8,<svg fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path d="M10 12l-6-6h12l-6 6z"/></svg>') no-repeat;
        background-position: right 8px top 50%;
        background-size: 12px;
        padding-right: 24px;
    }
    .form-group .checkbox-group label {
        font-weight: normal;
        color: #555;
    }
    .form-group .checkbox-group input[type="checkbox"] {
        margin-right: 8px;
    }
    .form-group .checkbox-group input[type="checkbox"]:checked + label {
        font-weight: bold;
    }
    .form-group .payment-method {
        display: flex;
        align-items: center;
        flex-wrap: wrap;
    }
    .form-group .payment-method .custom-radio {
        position: relative;
        padding-left: 35px;
        margin-right: 15px;
        cursor: pointer;
        font-size: 16px;
        color: #555;
        user-select: none;
    }
    .form-group .payment-method .custom-radio input {
        position: absolute;
        opacity: 0;
        cursor: pointer;
    }
    .form-group .payment-method .custom-radio .checkmark {
        position: absolute;
        top: 0;
        left: 0;
        height: 20px;
        width: 20px;
        background-color: #eee;
        border-radius: 50%;
    }
    .form-group .payment-method .custom-radio:hover input ~ .checkmark {
        background-color: #ccc;
    }
    .form-group .payment-method .custom-radio input:checked ~ .checkmark {
        background-color: #4CAF50;
    }
    .form-group .payment-method .custom-radio .checkmark:after {
        content: "";
        position: absolute;
        display: none;
    }
    .form-group .payment-method .custom-radio input:checked ~ .checkmark:after {
        display: block;
    }
    .form-group .payment-method .custom-radio .checkmark:after {
        top: 6px;
        left: 6px;
        width: 8px;
        height: 8px;
        border-radius: 50%;
        background: white;
    }
    .form-group .signature {
        display: flex;
        justify-content: space-between;
        align-items: center;
    }
    .form-group .signature input[type="text"] {
        flex: 1;
        margin-right: 10px;
    }
    .form-group .verification {
        margin-top: 20px;
        display: flex;
        align-items: center;
    }
    .form-group .verification label {
        flex: 1;
        font-weight: bold;
        color: #555;
    }
    .form-group .verification .g-recaptcha {
        flex: 2;
    }
    .form-group .submit-btn {
        text-align: center;
        margin-top: 30px;
    }
 .submit-btn input[type="submit"] {
   
   width: 100%; /* Make the button span full width */
  padding: 10px 20px;
     background-color: limegreen; /* Change to lime green */
    color: #fff;
    border: none;
    font-size: 18px;
    font-weight: bold; /* Make text bold */
    cursor: pointer;
    border-radius: 4px;
    transition: background-color 0.3s ease;
    }

.form-group .submit-btn input[type="submit"]:hover {
background-color: #45a049; /* Darker shade on hover */
}

    .checkbox-group {
        display: flex;
        flex-direction: column;
        gap: 10px;
        margin-top: 10px;
    }
    .form-group .payment-method label {
        margin-top: 10px;
    }
    .form-group .name-group {
        display: flex;
        justify-content: space-between;
    }
    .form-group .name-group input[type="text"] {
        width: calc(50% - 5px);
    }
    .error-message {
        color: red;
        font-size: 14px;
    }
</style>

<%-------------------------------------------JavaScript------------------------------------------------------------ --%>
<script>

function clearError(element) {
    var errorElement = element.parentNode.querySelector('.error-message');
    if (errorElement && errorElement.parentNode === element.parentNode) {
        element.parentNode.removeChild(errorElement);
    }
}

function showError(element, message) {
    clearError(element);
    var errorMessage = document.createElement('span');
    errorMessage.className = 'error-message';
    errorMessage.innerText = message;
    element.parentNode.appendChild(errorMessage);
}

function validateField(element) {
    var value = element.value.trim(); // Trim whitespace for accurate validation
    var id = element.id;
    var valid = true;

    switch (id) {
        case 'studentFirstName':
            if (value === '') {
                showError(element, "Please enter the First Name.");
                valid = false;
            } else {
                clearError(element);
            }
            break;

        case 'studentLastName':
            if (value === '') {
                showError(element, "Please enter the Last Name.");
                valid = false;
            } else {
                clearError(element);
            }
            break;

        case 'email':
            var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
            if (!emailPattern.test(value)) {
                showError(element, "Please enter a valid email address.");
                valid = false;
            } else {
                clearError(element);
            }
            break;

        case 'phone':
            var phonePattern = /^[0-9]{10}$/;
            if (!phonePattern.test(value)) {
                showError(element, "Please enter a valid phone number in the format: 9876543210");
                valid = false;
            } else {
                clearError(element);
            }
            break;

        case 'date':
            var datePattern = /^\d{2}-\d{2}-\d{4}$/;
            if (!datePattern.test(value)) {
                showError(element, "Please enter a valid date in the format: DD-MM-YYYY");
                valid = false;
            } else {
                clearError(element);
            }
            break;

        case 'studentId':
            if (value === '') {
                showError(element, "Please enter Student's ID.");
                valid = false;
            } else {
                clearError(element);
            }
            break;

        case 'course':
            if (value === '') {
                showError(element, "Please enter Course/Program name.");
                valid = false;
            } else {
                clearError(element);
            }
            break;

        case 'year':
            if (value === '') {
                showError(element, "Please enter Year of study.");
                valid = false;
            } else {
                clearError(element);
            }
            break;
    }

    return valid;
}

function validateForm() {
    var valid = true;

    var email = document.getElementById("email");
    var phone = document.getElementById("phone");
    var date = document.getElementById("date");
    var studentFirstName = document.getElementById("studentFirstName");
    var studentLastName = document.getElementById("studentLastName");
    var studentId = document.getElementById("studentId");
    var course = document.getElementById("course");
    var year = document.getElementById("year");

    // Validate email, phone, and date fields
    if (!validateField(email)) valid = false;
    if (!validateField(phone)) valid = false;
    if (!validateField(date)) valid = false;

    // Validate Student's name (First Name and Last Name)
    if (!validateField(studentFirstName)) valid = false;
    if (!validateField(studentLastName)) valid = false;

    // Validate Student's ID
    if (!validateField(studentId)) valid = false;

    // Validate Course/Program name
    if (!validateField(course)) valid = false;

    // Validate Year of study
    if (!validateField(year)) valid = false;

    // Validate payment method selection
    var paymentMethods = document.getElementsByName("paymentMethod");
    var paymentMethodSelected = false;
    for (var i = 0; i < paymentMethods.length; i++) {
        if (paymentMethods[i].checked) {
            paymentMethodSelected = true;
            break;
        }
    }
    if (!paymentMethodSelected) {
        showError(paymentMethods[0].parentNode, "Please select a payment method.");
        valid = false;
    } else {
        clearError(paymentMethods[0].parentNode);
    }

    // Validate fee selection
    var fees = document.querySelectorAll('input[name="fees[]"]:checked');
    if (fees.length === 0) {
        showError(document.querySelector('.checkbox-group'), "Please select at least one fee to pay.");
        valid = false;
    } else {
        clearError(document.querySelector('.checkbox-group'));
    }

    return valid;
}
</script>




</head>
<body>
<div class="form-container">
    <h2>School Fee Payment Form</h2>
    <form action="submit_payment.jsp" method="post" onsubmit="return validateForm()">
        <div class="form-group">
            <label for="studentFirstName">Student's name:</label>
            <div class="name-group">
                <input type="text" id="studentFirstName" name="studentFirstName" placeholder="FirstName" oninput="validateField(this)">
                <input type="text" id="studentLastName" name="studentLastName" placeholder="LastName" oninput="validateField(this)">
            </div>
        </div>
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" placeholder="xyz@gmail.com" oninput="validateField(this)">
        </div>
       <div class="form-group">
    <label for="phone">Phone number:</label>
    <input type="tel" id="phone" name="phone" placeholder="9876543210" oninput="validateField(this)">
</div>

        <div class="form-group">
            <label for="studentId">Student's ID:</label>
            <input type="text" id="studentId" name="studentId" oninput="validateField(this)">
        </div>
        <div class="form-group">
            <label for="course">Course/Program name:</label>
            <input type="text" id="course" name="course" oninput="validateField(this)">
        </div>
        <div class="form-group">
            <label for="year">Year of study:</label>
            <input type="text" id="year" name="year" oninput="validateField(this)">
        </div>
        <div class="form-group">
            <label>Select what fee/s you want to pay:</label>
            <div class="checkbox-group">
                <div>
                    <input type="checkbox" id="admissionFee" name="fees[]" value="Admission fee">
                    <label for="admissionFee">Admission fee</label>
                </div>
                <div>
                    <input type="checkbox" id="examFee" name="fees[]" value="Exam fee">
                    <label for="examFee">Exam fee</label>
                </div>
                <div>
                    <input type="checkbox" id="tuitionFee" name="fees[]" value="Tuition fee">
                    <label for="tuitionFee">Tuition fee</label>
                </div>
            </div>
        </div>
        <div class="form-group">
            <label>Payment method:</label>
            <div class="payment-method">
                <label class="custom-radio">Cash
                    <input type="radio" name="paymentMethod" value="Cash">
                    <span class="checkmark"></span>
                </label>
                <label class="custom-radio">Bank transfer
                    <input type="radio" name="paymentMethod" value="Bank transfer">
                    <span class="checkmark"></span>
                </label>
                <label class="custom-radio">PayPal
                    <input type="radio" name="paymentMethod" value="PayPal">
                    <span class="checkmark"></span>
                </label>
            </div>
        </div>
        <div class="form-group">
            <label class="signature">Signature:</label>
            <input type="text" id="signature" name="signature">
            <label for="date">Date:</label>
    <input type="text" id="date" name="date" placeholder="DD-MM-YYYY" oninput="validateField(this)">
 </div>
        <div class="form-group submit-btn">
            <input type="submit" value="Submit">
        </div>
    </form>
</div>
</body>
</html>
