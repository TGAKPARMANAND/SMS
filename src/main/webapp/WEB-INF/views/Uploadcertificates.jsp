<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

   Nursery <input class="input--style-1" type="file" placeholder="NurseryClass" name="NurseryClass"  id="NurseryClass">
   LkgClass<input class="input--style-1" type="file" placeholder="LkgClass" name="LkgClass"  id="LkgClass">
   UkgClass<input class="input--style-1" type="file" placeholder="UkgClass" name="UkgClass"  id="UkgClass">
                              
   FirstClass <input class="input--style-1" type="file" placeholder="FirstClassCartificate" name="firstclass"  id="firstclass">
   SecondClass <input class="input--style-1" type="file" placeholder="SecondClass" name="SecondClass"  id="SecondClass">
   ThirdClass <input class="input--style-1" type="file" placeholder="ThirdClass" name="ThirdClass"  id="ThirdClass">
   FourthClass <input class="input--style-1" type="file" placeholder="FourthClass" name="FourthClass"  id="FourthClass">
   FifthClass <input class="input--style-1" type="file" placeholder="FifthClass" name="FifthClass"  id="FifthClass">
   SixClass <input class="input--style-1" type="file" placeholder="SixClass" name="SixClass"  id="SixClass">
   SevenClass <input class="input--style-1" type="file" placeholder="SevenClass" name="SevenClass"  id="SevenClass">
   EightClass <input class="input--style-1" type="file" placeholder="EightClass" name="EightClass"  id="EightClass">
   NineClass <input class="input--style-1" type="file" placeholder="NineClass" name="NineClass"  id="NineClass">
   TenClass <input class="input--style-1" type="file" placeholder="TenClass" name="TenClass"  id="TenClass">
   ElevenClass <input class="input--style-1" type="file" placeholder="ElevenClass" name="ElevenClass"  id="ElevenClass">
   TwelveClass <input class="input--style-1" type="file" placeholder="TwelveClass" name="TwelveClass"  id="TwelveClass">

   <input type="button" name="certificatesubmit" id="certificatesubmit" value="Submit">
   
<script type="text/javascript">

$('#certificatesubmit').click(function(){
	
	 var fileInput = $('#NurseryClass')[0];
    var nursery = fileInput.files[0]; 
    var lkg = $('#LkgClass')[0];
    var lkg1 = lkg.files[0];
    var ukg = $('#UkgClass')[0];
    var ukg1 = ukg.files[0];
     var first = $('#firstclass')[0];
    var first1 = first.files[0]; 
   
     var second = $('#SecondClass')[0];
    var second1 = second.files[0];
    var third = $('#ThirdClass')[0];
    var third1 = third.files[0];
    var fourth = $('#FourthClass')[0];
    var fourth1 = fourth.files[0]; 
   
     var fifth = $('#FifthClass')[0];
    var fifth1 = fifth.files[0];
    var sixth = $('#SixClass')[0];
    var sixth1 = sixth.files[0];
    var seven = $('#SevenClass')[0];
    var seven1 = seven.files[0]; 
    
    var eight = $('#EightClass')[0];
    var eight1 = eight.files[0];
    var nine = $('#NineClass')[0];
    var nine1 = nine.files[0];
    var ten = $('#TenClass')[0];
    var ten1 = ten.files[0];
    
     var eleven = $('#ElevenClass')[0];
    var eleven1 = eleven.files[0];
    var twelve = $('#TwelveClass')[0];
    var twelve1 = twelve.files[0]; 
   
    var formData = new FormData();
    formData.append('nursery', nursery);
    formData.append('lkg', lkg1);
    formData.append('ukg', ukg1);
    formData.append('first', first1);
    formData.append('second', second1);
    formData.append('third', third1);
    formData.append('fourth', fourth1);
    formData.append('fifth', fifth1);
    formData.append('six', sixth1);
    formData.append('seven', seven1);
    formData.append('eight', eight1);
    formData.append('nine', nine1);
    formData.append('ten', ten1);
    formData.append('eleven', eleven1);
    formData.append('twelve', twelve1);
    
    alert("images upload");
    
    $.ajax({
    	type:"POST",
		url:"savecertificate",
		data:formData,
		 processData: false, 
         contentType: false,
         
         success:function(response)
         {
        	 alert("success");
         },
         error:function(response)
         {
        	 alert("image ajax error");
         }
		
    	
    });
    
});
</script>                          
</body>

</html>
