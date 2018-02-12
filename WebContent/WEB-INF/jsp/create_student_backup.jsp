<%@include file="header.jsp"%>
<script>
$(function() {
    $( "#dateOfBirthString" ).datepicker({ dateFormat: 'yy-mm-dd' });
    
  });
</script>
<script>
function isDeleteMethod(isDelete) {
	var form = document.getElementById('editForm');
    if (isDelete){
        window.location.href="<%=request.getContextPath()%>/cms/list_student/${id}";
        return false;
    }
    else{
    	form.submit();
    	return true;
    }
}
</script>
</head>
<body>
<%@include file="login_nav.jsp"%>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/jquery-ui.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/jquery.ui.theme.css" />

<main> 
<%@include file="school_main_menu.jsp"%>
<form method="post" action="<%=request.getContextPath() %>/cms/createStudent" id="editForm" enctype="multipart/form-data">
<input type="hidden" name="path" id="path" value="${id}">
<div class="container login_margin_top">
	<div class="row">
		<div class="col s12 m4 l4"></div>
		<div class="col s12 m4 l4">
			<div class="center">
				<h5 class="Lato_normal_font">New Student</h5>
			</div>
		</div>
		<div class="col s12 m4 l4"></div>
	</div>
	<div class="row">
		<div class="col s12 m2 l2"></div>
		<div class="col s12 m4 l4">Student Information</div>
	</div>
	<div class="row">
		<div class="col s12 m2 l2"></div>
		<div class="col s12 m4 l4">
			<div>
				<label class="Lato_normal_font">First Name</label>
				<spring:bind path="student.firstName">
				 <input type="text" name="${status.expression}" value="${status.value}" id="${status.expression}"/>
				</spring:bind>
				<input>
			</div>
			<div>
				<label class="Lato_normal_font">Last Name</label>
				<spring:bind path="student.lastName">
				 <input type="text" name="${status.expression}" value="${status.value}" id="${status.expression}"/>
				</spring:bind>
			</div>
			<div>
				<label class="Lato_normal_font">Preferred Name To Be Called</label>
				<spring:bind path="student.preferedNameToBeCalled">
				 <input type="text" name="${status.expression}" value="${status.value}" id="${status.expression}"/>
				</spring:bind>
			</div>
			<div>
				<label class="Lato_normal_font">Date of Birth</label>
				
				<input type="text" id="dateOfBirthString" name="dateOfBirthString"/>
			</div>
			<div class="input-field">
				<spring:bind path="student.gender">
				<select name="${status.expression}" id="${status.expression}">
					<option value="" disabled selected>Select gender</option>
					<option value="1">Male</option>
					<option value="2">Female</option>
				</select>
				</spring:bind>
				<label class="Lato_normal_font">Gender</label>
			</div>
			<div class="file-field input-field">
				<div class="btn">
					<span>Photo</span>
					<input type="file" name="photo" id="photo">
				</div>
				<div class="file-path-wrapper">
					<input class="file-path validate" type="text">
				</div>
			</div>
			
			
		</div>
		<div class="col s12 m4 l4">
			<div>
				<label class="Lato_normal_font">Pediatrician Name</label>
				<spring:bind path="student.pediatricianName">
				 <input type="text" name="${status.expression}" value="${status.value}" id="${status.expression}"/>
				</spring:bind>
			</div>
			<div>
				<label class="Lato_normal_font">Pediatrician Phone</label>
				<spring:bind path="student.pediatricianPhone">
				 <input type="text" name="${status.expression}" value="${status.value}" id="${status.expression}"/>
				</spring:bind>
			</div>
		</div>
		<div class="col s12 m2 l2"></div>
	</div>
	<div class="row">
		<div class="col s12 m2 l2"></div>
		<div class="col s12 m4 l4">Father/Guardian Information</div>
	</div>
	<div class="row">
		<div class="col s12 m2 l2"></div>
		<div class="col s12 m4 l4 left">
			<div>
				<label class="Lato_normal_font">First Name</label>
				<spring:bind path="primaryContact.firstName">
				 <input type="text" name="primaryContact.firstName" value="${status.value}" id="primaryContact.firstName"/>
				</spring:bind>
			</div>
			<div>
				<label class="Lato_normal_font">Last Name</label>
				<spring:bind path="primaryContact.lastName">
				 <input type="text" name="primaryContact.lastName" value="${status.value}" id="primaryContact.lastName"/>
				</spring:bind>
			</div>
			<div>
				<label class="Lato_normal_font">Identification No</label>
				<spring:bind path="primaryContact.identificationNo">
				 <input type="text" name="${status.expression}" value="${status.value}" id="${status.expression}"/>
				</spring:bind>
			</div>
			<div>
				<label class="Lato_normal_font">Email</label>
				<spring:bind path="primaryContact.email">
				 <input type="text" name="${status.expression}" value="${status.value}" id="${status.expression}"/>
				</spring:bind>
			</div>
			<div>
				<label class="Lato_normal_font">Marital Status</label>
				<spring:bind path="primaryContact.martialStatus">
				 <select name="${status.expression}" id="${status.expression}">
					<option value="1">Married</option>
					<option value="2">Widowed</option>
					<option value="3">Divorced</option>
					<option value="4">Single</option>
				</select>
				</spring:bind>
			</div>
			<div>
				<label class="Lato_normal_font">Relationship To The Child</label>
				<spring:bind path="primaryContact.relationType">
				 <select name="${status.expression}" id="${status.expression}">
					<option value="1">Father</option>
					<option value="2">Mother</option>
					<option value="3">Guardian</option>
					<option value="4">Other</option>
				</select>
				</spring:bind>
			</div>
			<div>
				<label class="Lato_normal_font">Occupation</label>
				<spring:bind path="primaryContact.occupation">
				 <input type="text" name="${status.expression}" value="${status.value}" id="${status.expression}"/>
				</spring:bind>
			</div>
			<div>
				<label class="Lato_normal_font">Employed By</label>
				<spring:bind path="primaryContact.employedBy">
				 <input type="text" name="${status.expression}" value="${status.value}" id="${status.expression}"/>
				</spring:bind>
			</div>
			<div>
				<label class="Lato_normal_font">Work Hours</label>
				<spring:bind path="primaryContact.workingHours">
				 <input type="text" name="${status.expression}" value="${status.value}" id="${status.expression}"/>
				</spring:bind>
			</div>
			<div>
				<label class="Lato_normal_font">Car Plate No</label>
				<spring:bind path="primaryContact.carNumber">
				 <input type="text" name="${status.expression}" value="${status.value}" id="${status.expression}"/>
				</spring:bind>
			</div>
			<div class="file-field input-field">
				<div class="btn">
					<span>Photo</span>
					<input type="file" name="primaryContactPhoto" id="primaryContactPhoto">
				</div>
				<div class="file-path-wrapper">
					<input class="file-path validate" type="text">
				</div>
			</div>
		</div>
		<div class="col s12 m4 l4">

			<div>
				<label class="Lato_normal_font">Home Phone</label>
				<spring:bind path="primaryContact.homePhone">
				 <input type="text" name="${status.expression}" value="${status.value}" id="${status.expression}"/>
				</spring:bind>
			</div>
			<div>
				<label class="Lato_normal_font">Office Phone</label>
				<spring:bind path="primaryContact.officePhone">
				 <input type="text" name="${status.expression}" value="${status.value}" id="${status.expression}"/>
				</spring:bind>
			</div>
			<div>
				<label class="Lato_normal_font">Mobile Phone</label>
				<spring:bind path="primaryContact.mobilePhone">
				 <input type="text" name="${status.expression}" value="${status.value}" id="${status.expression}"/>
				</spring:bind>
			</div>
			<div>
				<label class="Lato_normal_font">Address 1</label>
				<spring:bind path="primaryContact.homeAddressStreetOne">
				 <input type="text" name="${status.expression}" value="${status.value}" id="${status.expression}"/>
				</spring:bind>
			</div>
			<div>
				<label class="Lato_normal_font">Address 2</label>
				<spring:bind path="primaryContact.homeAddressStreetTwo">
				 <input type="text" name="${status.expression}" value="${status.value}" id="${status.expression}"/>
				</spring:bind>
			</div>
			
			<div>
				<label class="Lato_normal_font">City</label>
				<spring:bind path="primaryContact.homeAddressCity">
				 <input type="text" name="${status.expression}" value="${status.value}" id="${status.expression}"/>
				</spring:bind>
			</div>
			
			<div>
				<label class="Lato_normal_font">State</label>
				<spring:bind path="primaryContact.homeAddressState">
				 <input type="text" name="${status.expression}" value="${status.value}" id="${status.expression}"/>
				</spring:bind>
			</div>
			
			<div>
				<label class="Lato_normal_font">Postcode</label>
				<spring:bind path="primaryContact.homeAddressPostCode">
				 <input type="text" name="${status.expression}" value="${status.value}" id="${status.expression}"/>
				</spring:bind>
			</div>
			
			<div>
				<label class="Lato_normal_font">Country</label>
				<spring:bind path="primaryContact.homeAddressCountry">
				 <input type="text" name="${status.expression}" value="${status.value}" id="${status.expression}"/>
				</spring:bind>
			</div>
			
			<div>
				<label class="Lato_normal_font">Work Address 1</label>
				<spring:bind path="primaryContact.workAddressStreetOne">
				 <input type="text" name="${status.expression}" value="${status.value}" id="${status.expression}"/>
				</spring:bind>
			</div>
			<div>
				<label class="Lato_normal_font">Work Address 2</label>
				<spring:bind path="primaryContact.workAddressStreetTwo">
				 <input type="text" name="${status.expression}" value="${status.value}" id="${status.expression}"/>
				</spring:bind>
			</div>
			<div>
				<label class="Lato_normal_font">City</label>
				<spring:bind path="primaryContact.workAddressCity">
				 <input type="text" name="${status.expression}" value="${status.value}" id="${status.expression}"/>
				</spring:bind>
			</div>
			<div>
				<label class="Lato_normal_font">State</label>
				<spring:bind path="primaryContact.workAddressState">
				 <input type="text" name="${status.expression}" value="${status.value}" id="${status.expression}"/>
				</spring:bind>
			</div>
			<div>
				<label class="Lato_normal_font">Postcode</label>
				<spring:bind path="primaryContact.workAddressPostCode">
				 <input type="text" name="${status.expression}" value="${status.value}" id="${status.expression}"/>
				</spring:bind>
			</div>
			<div>
				<label class="Lato_normal_font">Country</label>
				<spring:bind path="primaryContact.workAddressCountry">
				 <input type="text" name="${status.expression}" value="${status.value}" id="${status.expression}"/>
				</spring:bind>
			</div>
			
		</div>
		<div class="col s12 m2 l2"></div>
	</div>
	<div class="row">
		<div class="col s12 m2 l2"></div>
		<div class="col s12 m4 l4">Mother/Guardian Information</div>
	</div>
	
	
	
	
	
	
	
	
	
	<div class="row">
		<div class="col s12 m2 l2"></div>
		<div class="col s12 m4 l4 left">
			<div>
				<label class="Lato_normal_font">First Name</label>
				<spring:bind path="secondaryContact.firstName">
				 <input type="text" name="secondaryContact.firstName" value="${status.value}" id="secondaryContact.firstName"/>
				</spring:bind>
			</div>
			<div>
				<label class="Lato_normal_font">Last Name</label>
				<spring:bind path="secondaryContact.lastName">
				 <input type="text" name="secondaryContact.lastName" value="${status.value}" id="secondaryContact.lastName"/>
				</spring:bind>
			</div>
			<div>
				<label class="Lato_normal_font">Identification No</label>
				<spring:bind path="secondaryContact.identificationNo">
				 <input type="text" name="secondaryContact.identificationNo" value="${status.value}" id="secondaryContact.identificationNo"/>
				</spring:bind>
			</div>
			<div>
				<label class="Lato_normal_font">Email</label>
				<spring:bind path="secondaryContact.email">
				 <input type="text" name="secondaryContact.email" value="${status.value}" id="secondaryContact.email"/>
				</spring:bind>
			</div>
			<div>
				<label class="Lato_normal_font">Marital Status</label>
				<spring:bind path="secondaryContact.martialStatus">
				 <select name="secondaryContact.martialStatus" id="secondaryContact.martialStatus">
					<option value="1">Married</option>
					<option value="2">Widowed</option>
					<option value="3">Divorced</option>
					<option value="4">Single</option>
				</select>
				</spring:bind>
			</div>
			<div>
				<label class="Lato_normal_font">Relationship To The Child</label>
				<spring:bind path="secondaryContact.relationType">
				 <select name="secondaryContact.relationType" id="secondaryContact.relationType">
					<option value="1">Father</option>
					<option value="2">Mother</option>
					<option value="3">Guardian</option>
					<option value="4">Other</option>
				</select>
				</spring:bind>
			</div>
			<div>
				<label class="Lato_normal_font">Occupation</label>
				<spring:bind path="secondaryContact.occupation">
				 <input type="text" name="secondaryContact.occupation" id="${status.expression}"/>
				</spring:bind>
			</div>
			<div>
				<label class="Lato_normal_font">Employed By</label>
				<spring:bind path="secondaryContact.employedBy">
				 <input type="text" name="secondaryContact.employedBy" value="${status.value}" id="secondaryContact.employedBy"/>
				</spring:bind>
			</div>
			<div>
				<label class="Lato_normal_font">Work Hours</label>
				<spring:bind path="secondaryContact.workingHours">
				 <input type="text" name="secondaryContact.workingHours" value="${status.value}" id="secondaryContact.workingHours"/>
				</spring:bind>
			</div>
			<div>
				<label class="Lato_normal_font">Car Plate No</label>
				<spring:bind path="secondaryContact.carNumber">
				 <input type="text" name="secondaryContact.carNumber" value="${status.value}" id="secondaryContact.carNumber"/>
				</spring:bind>
			</div>
			<div class="file-field input-field">
				<div class="btn">
					<span>Photo</span>
					<input type="file" name="secondaryContactPhoto" id="secondaryContactPhoto">
				</div>
				<div class="file-path-wrapper">
					<input class="file-path validate" type="text">
				</div>
			</div>
		</div>
		<div class="col s12 m4 l4">

			<div>
				<label class="Lato_normal_font">Home Phone</label>
				<spring:bind path="secondaryContact.homePhone">
				 <input type="text" name="secondaryContact.homePhone" value="${status.value}" id="secondaryContact.homePhone"/>
				</spring:bind>
			</div>
			<div>
				<label class="Lato_normal_font">Office Phone</label>
				<spring:bind path="secondaryContact.officePhone">
				 <input type="text" name="secondaryContact.officePhone" value="${status.value}" id="secondaryContact.officePhone"/>
				</spring:bind>
			</div>
			<div>
				<label class="Lato_normal_font">Mobile Phone</label>
				<spring:bind path="secondaryContact.mobilePhone">
				 <input type="text" name="secondaryContact.mobilePhone" value="${status.value}" id="secondaryContact.mobilePhone"/>
				</spring:bind>
			</div>
			<div>
				<label class="Lato_normal_font">Address 1</label>
				<spring:bind path="secondaryContact.homeAddressStreetOne">
				 <input type="text" name="secondaryContact.homeAddressStreetOne" value="${status.value}" id="secondaryContact.homeAddressStreetOne"/>
				</spring:bind>
			</div>
			<div>
				<label class="Lato_normal_font">Address 2</label>
				<spring:bind path="secondaryContact.homeAddressStreetTwo">
				 <input type="text" name="secondaryContact.homeAddressStreetTwo" value="${status.value}" id="secondaryContact.homeAddressStreetTwo"/>
				</spring:bind>
			</div>
			
			<div>
				<label class="Lato_normal_font">City</label>
				<spring:bind path="secondaryContact.homeAddressCity">
				 <input type="text" name="secondaryContact.homeAddressCity" value="${status.value}" id="secondaryContact.homeAddressCity"/>
				</spring:bind>
			</div>
			
			<div>
				<label class="Lato_normal_font">Postcode</label>
				<spring:bind path="secondaryContact.homeAddressPostCode">
				 <input type="text" name="secondaryContact.homeAddressPostCode" value="${status.value}" id="secondaryContact.homeAddressPostCode"/>
				</spring:bind>
			</div>
			
			<div>
				<label class="Lato_normal_font">State</label>
				<spring:bind path="secondaryContact.homeAddressState">
				 <input type="text" name="secondaryContact.homeAddressState" value="${status.value}" id="secondaryContact.homeAddressState"/>
				</spring:bind>
			</div>
			
			<div>
				<label class="Lato_normal_font">Country</label>
				<spring:bind path="secondaryContact.homeAddressCountry">
				 <input type="text" name="secondaryContact.homeAddressCountry" value="${status.value}" id="secondaryContact.homeAddressCountry"/>
				</spring:bind>
			</div>
			
			<div>
				<label class="Lato_normal_font">Work Address 1</label>
				<spring:bind path="secondaryContact.workAddressStreetOne">
				 <input type="text" name="secondaryContact.workAddressStreetOne" value="${status.value}" id="secondaryContact.workAddressStreetOne"/>
				</spring:bind>
			</div>
			<div>
				<label class="Lato_normal_font">Work Address 2</label>
				<spring:bind path="secondaryContact.workAddressStreetTwo">
				 <input type="text" name="secondaryContact.workAddressStreetTwo" value="${status.value}" id="secondaryContact.workAddressStreetTwo"/>
				</spring:bind>
			</div>
			<div>
				<label class="Lato_normal_font">City</label>
				<spring:bind path="secondaryContact.workAddressCity">
				 <input type="text" name="secondaryContact.workAddressCity" value="${status.value}" id="secondaryContact.workAddressCity"/>
				</spring:bind>
			</div>
				<div>
				<label class="Lato_normal_font">Postcode</label>
				<spring:bind path="secondaryContact.workAddressPostCode">
				 <input type="text" name="secondaryContact.workAddressPostCode" value="${status.value}" id="secondaryContact.workAddressPostCode"/>
				</spring:bind>
			</div>
			<div>
				<label class="Lato_normal_font">State</label>
				<spring:bind path="secondaryContact.workAddressState">
				 <input type="text" name="secondaryContact.workAddressState" value="${status.value}" id="secondaryContact.workAddressState"/>
				</spring:bind>
			</div>
			<div>
				<label class="Lato_normal_font">Country</label>
				<spring:bind path="secondaryContact.workAddressCountry">
				 <input type="text" name="secondaryContact.workAddressCountry" value="${status.value}" id="secondaryContact.workAddressCountry"/>
				</spring:bind>
			</div>
			
		</div>
		<div class="col s12 m2 l2"></div>
	</div>
	
	
	
	
	
	
	
	<div class="row">
		<div class="col s12 m4 l4"></div>
		<div class="col s12 m4 l4">
			<div class="center">
				<a onclick="return isDeleteMethod(false);" class="waves-effect waves-light blue darken-4 btn center login_button Lato_normal_font">Submit</a>
				<a onclick="return isDeleteMethod(true);" class="waves-effect waves-light blue darken-4 btn center login_button Lato_normal_font">Cancel</a>
			</div>
		</div>
		<div class="col s12 m4 l4"></div>
	</div>


</div>
</form>
</main>
<%@include file="footer.jsp"%>