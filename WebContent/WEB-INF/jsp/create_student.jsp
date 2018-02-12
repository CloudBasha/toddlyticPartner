<%@include file="header.jsp"%>
<script>
$(function() {
    $( "#dateOfBirthString" ).datepicker({ dateFormat: 'yy-mm-dd' });
  });

$( function() {
 
    $( "#primaryContactFirstName" ).autocomplete({
    	source: function (request, response) {
             $.ajax({
                 type: 'GET',
                 url: '<%=request.getContextPath()%>/cms/getContactsByName',
                 data: { 'searchtext' : encodeURIComponent(request.term), 'field' : 'primary','role':$('#primaryContactRelationType').val() },
                 dataType: 'json',
                 success: function(jsonData) {
                     response(jsonData);
                 }
             });
         },
        change: function(event, ui) {
        	if (ui.item === null) {
        	$('#primaryContactId').val('');
        	$("#primaryContactLastName").val('');
			$("#primaryContactIdentificationNo").val('');
			$("#primaryContactEmail").val('');
			$("primaryContactMartialStatus select").val('');
			$("#primaryContactOccupation").val('');
			$("#primaryContactEmployedBy").val('');
			$("#primaryContactWorkingHours").val('');
			$("#primaryContactCarNumber").val('');
			$("#primaryContactHomePhone").val('');
			$("#primaryContactOfficePhone").val('');
			$("#primaryContactMobilePhone").val('');
			$("#primaryContactHomeAddressStreetOne").val('');
			$("#primaryContactHomeAddressStreetTwo").val('');
			$("#primaryContactHomeAddressCity").val('');
			$("#primaryContactHomeAddressState").val('');
			$("#primaryContactHomeAddressPostCode").val('');
			$("#primaryContactHomeAddressCountry").val('');
			$("#primaryContactWorkAddressStreetOne").val('');
			$("#primaryContactWorkAddressStreetTwo").val('');
			$("#primaryContactWorkAddressCity").val('');
			$("#primaryContactWorkAddressState").val('');
			$("#primaryContactWorkAddressPostCode").val('');
			$("#primaryContactWorkAddressCountry").val('');
			$("primaryContactMartialStatus select").val('');
			$('#primaryContactEmailOptIn').prop('checked', true);
			$('#primaryContactEmergencyContact').prop('checked', true);
			$('#primaryPhotoimageSection').empty();
        	}
        },
		select: function(event, ui){
			$("#primaryContactLastName").val(ui.item.lastName);
			$("#primaryContactIdentificationNo").val(ui.item.identificationNo);
			$("#primaryContactEmail").val(ui.item.email);
			$("#primaryContactOccupation").val(ui.item.occupation);
			$("#primaryContactEmployedBy").val(ui.item.employedBy);
			$("#primaryContactWorkingHours").val(ui.item.workingHours);
			$("#primaryContactCarNumber").val(ui.item.carNumber);
			$("#primaryContactHomePhone").val(ui.item.homePhone);
			$("#primaryContactOfficePhone").val(ui.item.officePhone);
			$("#primaryContactMobilePhone").val(ui.item.mobilePhone);
			$("#primaryContactHomeAddressStreetOne").val(ui.item.homeAddressStreetOne);
			$("#primaryContactHomeAddressStreetTwo").val(ui.item.homeAddressStreetTwo);
			$("#primaryContactHomeAddressCity").val(ui.item.homeAddressCity);
			$("#primaryContactHomeAddressState").val(ui.item.homeAddressState);
			$("#primaryContactHomeAddressPostCode").val(ui.item.homeAddressPostCode);
			$("#primaryContactHomeAddressCountry").val(ui.item.homeAddressCountry);
			$("#primaryContactWorkAddressStreetOne").val(ui.item.workAddressStreetOne);
			$("#primaryContactWorkAddressStreetTwo").val(ui.item.workAddressStreetTwo);
			$("#primaryContactWorkAddressCity").val(ui.item.workAddressCity);
			$("#primaryContactWorkAddressState").val(ui.item.workAddressState);
			$("#primaryContactWorkAddressPostCode").val(ui.item.workAddressPostCode);
			$("#primaryContactWorkAddressCountry").val(ui.item.workAddressCountry);
			$("primaryContactMartialStatus select").val(ui.item.martialStatus);
			
			$('#primaryContactId').val(ui.item.contactId);
			if(ui.item.emailOptIn=='true'){
			$('#primaryContactEmailOptIn').prop('checked', true);
			}
			else{
				$('#primaryContactEmailOptIn').prop('checked', false);	
			}
			
			if(ui.item.emergencyContact=='true'){
				$('#primaryContactEmergencyContact').prop('checked', true);
				}
				else{
					$('#primaryContactEmergencyContact').prop('checked', false);	
				}
			if(ui.item.photoUrl!='' && ui.item.photoUrl >0){
	    		var imageUrl ='<%=request.getContextPath()%>/cms/contactimages?id='+ui.item.contactId;
						var text = 'Photo';
						$("div#primaryPhotoimageSection").append('<a target="_blank" href="' + imageUrl + '">' + text + '</a>');
					}
			
		},
		minLength:1
    });
  } );
  
  
$( function() {
	 
    $( "#secondaryContactFirstName" ).autocomplete({
    	source: function (request, response) {
             $.ajax({
                 type: 'GET',
                 url: '<%=request.getContextPath()%>/cms/getContactsByName',
                 data: { 'searchtext' : encodeURIComponent(request.term), 'field' : 'primary','role':$('#secondaryContactRelationType').val() },
                 dataType: 'json',
                 success: function(jsonData) {
                     response(jsonData);
                 }
             });
         },
        change: function(event, ui) {
        	if (ui.item === null) {
        	$('#secondaryContactId').val('');
        	$("#secondaryContactLastName").val('');
			$("#secondaryContactIdentificationNo").val('');
			$("#secondaryContactEmail").val('');
			$("secondaryContactMartialStatus select").val('');
			$("#secondaryContactOccupation").val('');
			$("#secondaryContactEmployedBy").val('');
			$("#secondaryContactWorkingHours").val('');
			$("#secondaryContactCarNumber").val('');
			$("#secondaryContactHomePhone").val('');
			$("#secondaryContactOfficePhone").val('');
			$("#secondaryContactMobilePhone").val('');
			$("#secondaryContactHomeAddressStreetOne").val('');
			$("#secondaryContactHomeAddressStreetTwo").val('');
			$("#secondaryContactHomeAddressCity").val('');
			$("#secondaryContactHomeAddressState").val('');
			$("#secondaryContactHomeAddressPostCode").val('');
			$("#secondaryContactHomeAddressCountry").val('');
			$("#secondaryContactWorkAddressStreetOne").val('');
			$("#secondaryContactWorkAddressStreetTwo").val('');
			$("#secondaryContactWorkAddressCity").val('');
			$("#secondaryContactWorkAddressState").val('');
			$("#secondaryContactWorkAddressPostCode").val('');
			$("#secondaryContactWorkAddressCountry").val('');
			$("secondaryContactMartialStatus select").val('');
			$('#secondaryContactEmailOptIn').prop('checked', true);
			$('#secondaryContactEmergencyContact').prop('checked', true);
			$('#secondaryPhotoimageSection').empty();
        	}
        },
		select: function(event, ui){
			$("#secondaryContactLastName").val(ui.item.lastName);
			$("#secondaryContactIdentificationNo").val(ui.item.identificationNo);
			$("#secondaryContactEmail").val(ui.item.email);
			$("#secondaryContactOccupation").val(ui.item.occupation);
			$("#secondaryContactEmployedBy").val(ui.item.employedBy);
			$("#secondaryContactWorkingHours").val(ui.item.workingHours);
			$("#secondaryContactCarNumber").val(ui.item.carNumber);
			$("#secondaryContactHomePhone").val(ui.item.homePhone);
			$("#secondaryContactOfficePhone").val(ui.item.officePhone);
			$("#secondaryContactMobilePhone").val(ui.item.mobilePhone);
			$("#secondaryContactHomeAddressStreetOne").val(ui.item.homeAddressStreetOne);
			$("#secondaryContactHomeAddressStreetTwo").val(ui.item.homeAddressStreetTwo);
			$("#secondaryContactHomeAddressCity").val(ui.item.homeAddressCity);
			$("#secondaryContactHomeAddressState").val(ui.item.homeAddressState);
			$("#secondaryContactHomeAddressPostCode").val(ui.item.homeAddressPostCode);
			$("#secondaryContactHomeAddressCountry").val(ui.item.homeAddressCountry);
			$("#secondaryContactWorkAddressStreetOne").val(ui.item.workAddressStreetOne);
			$("#secondaryContactWorkAddressStreetTwo").val(ui.item.workAddressStreetTwo);
			$("#secondaryContactWorkAddressCity").val(ui.item.workAddressCity);
			$("#secondaryContactWorkAddressState").val(ui.item.workAddressState);
			$("#secondaryContactWorkAddressPostCode").val(ui.item.workAddressPostCode);
			$("#secondaryContactWorkAddressCountry").val(ui.item.workAddressCountry);
			$("secondaryContactMartialStatus select").val(ui.item.martialStatus);
			
			$('#secondaryContactId').val(ui.item.contactId);
			if(ui.item.emailOptIn=='true'){
			$('#secondaryContactEmailOptIn').prop('checked', true);
			}
			else{
				$('#secondaryContactEmailOptIn').prop('checked', false);	
			}
			
			if(ui.item.emergencyContact=='true'){
				$('#secondaryContactEmergencyContact').prop('checked', true);
				}
				else{
					$('#secondaryContactEmergencyContact').prop('checked', false);	
				}
			if(ui.item.photoUrl!='' && ui.item.photoUrl >0){
	    		var imageUrl ='<%=request.getContextPath()%>/cms/contactimages?id='+ui.item.contactId;
						var text = 'Photo';
						$("div#secondaryPhotoimageSection").append('<a target="_blank" href="' + imageUrl + '">' + text + '</a>');
					}
			
		},
		minLength:1
    });
  } );


$(document).ready(function(){


});
function isDeleteMethod(isDelete) {
	var form = document.getElementById('editForm');
    if (isDelete){
        window.location.href="<%=request.getContextPath()%>/cms/list_student/${id}";
			return false;
		} else {
			form.submit();
			return true;
		}
	}
</script>
</head>
<body>
	<%@include file="login_nav.jsp"%>
	<main> <%@include file="school_main_menu.jsp"%> <%
 	String action = request.getContextPath() + "/cms/createStudentPost";
 %> <form:form commandName="contactList" method="post" action="<%=action%>" id="editForm"
		enctype="multipart/form-data">
		<input type="hidden" name="primaryContactId" id="primaryContactId">
		<input type="hidden" name="secondaryContactId" id="secondaryContactId">
		<input type="hidden" name="path" id="path" value="${id}">
		<div class="container login_margin_top">
			<div class="row">
				<div class="col s12 m1 l1"></div>
				<div class="col s9 m4 l4">
					<div class="icon_beside_text">
						<i class="medium material-icons icon_beside_text">assignment_ind</i>
					</div>
					<div class="icon_beside_text">
						<h5 class="Lato_normal_font icon_beside_text">New Student</h5>
					</div>
				</div>
				<div class="col s12 m4 l4"></div>
			</div>

			<div class="row">
				<div class="col s12 m1 l1"></div>
				<div class="col s12 m10 l10">
					<ul class="collapsible" data-collapsible="accordion">
						<li>
							<div class="collapsible-header active">
								<i class="material-icons">assignment_ind</i>Student Information
							</div>
							<div class="collapsible-body">
								<div class="container container_margin_top">
									<div class="row">
										<div class="col s12 m6 l6">
											<label class="Lato_normal_font label_font">First Name</label>
											<form:input type="text" path="student.firstName" id="studentFirstName" />
										</div>
										<div class="col s12 m6 l6">
											<label class="Lato_normal_font label_font">Last Name</label>
											<form:input type="text" path="student.lastName" id="studentLastName" />
										</div>
									</div>
									<div class="row">
										<div class="col s12 m6 l6">
											<label class="Lato_normal_font label_font">Preferred Name</label>
											<form:input type="text" path="student.preferedNameToBeCalled" />
										</div>
										<div class="col s12 m6 l6">
											<label class="Lato_normal_font label_font">Date of Birth</label>
											<form:input path="student.dateOfBirthString" id="dateOfBirthString"
												placeholder="yyyy-mm-dd" />

										</div>
									</div>
									<div class="row">
										<div class="col s12 m6 l6">
											<div class="input-field gender_select">
												<form:select path="student.gender">
													<form:option value="" label="Select gender" disabled="disabled" selected="selected" />
													<form:option value="1" label="Male" />
													<form:option value="2" label="Female" />
												</form:select>
												<label class="Lato_normal_font label_font">Gender</label>
											</div>
										</div>
										<div class="col s12 m6 l6">
											<div class="input-field gender_select">
												<select>
													<option value="" value="" disabled="disabled" selected="selected">Select
														Program</option>
													<option value="1" value="Dummy Program 1">Dummy Program 1</option>
													<option value="2" value="Dummy Program 2">Dummy Program 2</option>
												</select> <label class="Lato_normal_font label_font">Program</label>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col s12 m6 l6">
											<label class="Lato_normal_font label_font">Peditrician Name</label>
											<form:input type="text" path="student.pediatricianName" />
										</div>
										<div class="col s12 m6 l6">
											<label class="Lato_normal_font label_font">Peditrician Contact No</label>
											<form:input type="text" path="student.pediatricianPhone" />
										</div>
									</div>
									<div class="row">
										<div class="col s12 m6 l6">
											<label class="Lato_normal_font label_font">Medication</label>
											<form:input type="text" path="student.medication" />
										</div>
										<div class="col s12 m6 l6">
											<div class="file-field input-field photo_btn">
												<div class="btn">
													<span>Photo</span> <input type="file" name="photo" id="photo">
												</div>
												<div class="file-path-wrapper">
													<input class="file-path validate" type="text">
												</div>
											</div>
										</div>

									</div>
								</div>
							</div>
						</li>
						<li>
							<div class="collapsible-header">
								<i class="material-icons">supervisor_account</i>Primary Contact Information
							</div>
							<div class="collapsible-body">
								<div class="container container_margin_top">
									<div class="row">
										<div class="col s12 m6 l6">
											<label class="Lato_normal_font label_font">First Name</label>
											<form:input type="text" path="primaryContact.firstName" id="primaryContactFirstName"
												class="ui-autocomplete-input" />
										</div>
										<div class="col s12 m6 l6">
											<label class="Lato_normal_font label_font">Last Name</label>
											<form:input type="text" path="primaryContact.lastName" id="primaryContactLastName" />
										</div>
									</div>
									<div class="row">
										<div class="col s12 m6 l6">
											<label class="Lato_normal_font label_font">Email</label>
											<form:input type="text" path="primaryContact.email" id="primaryContactEmail" />
										</div>
										<div class="col s12 m6 l6">
											<label class="Lato_normal_font label_font">Mobile Phone</label>
											<form:input type="text" path="primaryContact.mobilePhone" id="primaryContactMobilePhone" />
										</div>
									</div>
									<div class="row">
										<div class="col s12 m6 l6">
											<div class="input-field role_checkbox role_select">
												<form:select path="primaryContact.relationType" id="primaryContactRelationType">
													<form:option value="" label="-Select-" />
													<form:option value="1" label="Father" />
													<form:option value="2" label="Mother" />
													<form:option value="3" label="Guardian" />
													<form:option value="4" label="Other" />
												</form:select>
												<label class="Lato_normal_font label_font">Role</label>
											</div>
										</div>
										<div class="col s12 m6 l6">
											<label class="Lato_normal_font label_font">Marital Status</label>
											<form:select path="primaryContact.martialStatus" id="primaryContactMartialStatus">
												<form:option value="1" label="Married" />
												<form:option value="2" label="Widowed" />
												<form:option value="3" label="Divorced" />
												<form:option value="4" label="Single" />
											</form:select>
										</div>
									</div>
									<div class="row">
										<div class="col s12 m6 l6">
											<label class="Lato_normal_font label_font">Home Phone</label>
											<form:input type="text" path="primaryContact.homePhone" id="primaryContactHomePhone" />
										</div>
										<div class="col s12 m6 l6">
											<label class="Lato_normal_font label_font">Office Phone</label>
											<form:input type="text" path="primaryContact.officePhone" id="primaryContactOfficePhone" />
										</div>
									</div>
									<div class="row">
										<div class="col s12 m6 l6">
											<label class="Lato_normal_font label_font">Address 1</label>
											<form:input type="text" path="primaryContact.homeAddressStreetOne"
												id="primaryContactHomeAddressStreetOne" />
										</div>
										<div class="col s12 m6 l6">
											<label class="Lato_normal_font label_font">Address 2</label>
											<form:input type="text" path="primaryContact.homeAddressStreetTwo"
												id="primaryContactHomeAddressStreetTwo" />
										</div>
									</div>
									<div class="row">
										<div class="col s12 m6 l6">
											<label class="Lato_normal_font label_font">City</label>
											<form:input type="text" path="primaryContact.homeAddressCity"
												id="primaryContactHomeAddressCity" />
										</div>
										<div class="col s12 m6 l6">
											<label class="Lato_normal_font label_font">Postcode</label>
											<form:input type="text" path="primaryContact.homeAddressPostCode"
												id="primaryContactHomeAddressPostCode" />
										</div>
									</div>
									<div class="row">
										<div class="col s12 m6 l6">
											<label class="Lato_normal_font label_font">State</label>
											<form:input type="text" path="primaryContact.homeAddressState"
												id="primaryContactHomeAddressState" />
										</div>
										<div class="col s12 m6 l6">
											<label class="Lato_normal_font label_font">Country</label>
											<form:input type="text" path="primaryContact.homeAddressCountry"
												id="primaryContactHomeAddressCountry" />
										</div>
									</div>
									<div class="row">
										<div class="col s12 m6 l6">
											<label class="Lato_normal_font label_font">Identification No</label>
											<form:input type="text" path="primaryContact.identificationNo"
												id="primaryContactIdentificationNo" />
										</div>
										<div class="col s12 m6 l6">
											<label class="Lato_normal_font label_font">Employed By</label>
											<form:input type="text" path="primaryContact.employedBy" id="primaryContactEmployedBy" />
										</div>
									</div>
									<div class="row">
										<div class="col s12 m6 l6">
											<label class="Lato_normal_font label_font">Occupation</label>
											<form:input type="text" path="primaryContact.occupation" id="primaryContactOccupation" />
										</div>
										<div class="col s12 m6 l6"></div>
									</div>
									<div class="row">
										<div class="col s12 m6 l6">
											<label class="Lato_normal_font label_font">Work Address 1</label>
											<form:input type="text" path="primaryContact.workAddressStreetOne"
												id="primaryContactWorkAddressStreetOne" />
										</div>
										<div class="col s12 m6 l6">
											<label class="Lato_normal_font label_font">Work Address 2</label>
											<form:input type="text" path="primaryContact.workAddressStreetTwo"
												id="primaryContactWorkAddressStreetTwo" />
										</div>
									</div>
									<div class="row">
										<div class="col s12 m6 l6">
											<label class="Lato_normal_font label_font">City</label>
											<form:input type="text" path="primaryContact.workAddressPostCode"
												id="primaryContactWorkAddressCity" />
										</div>
										<div class="col s12 m6 l6">
											<label class="Lato_normal_font label_font">Postcode</label>
											<form:input type="text" path="primaryContact.workAddressPostCode"
												id="primaryContactWorkAddressPostCode" />
										</div>
									</div>
									<div class="row">
										<div class="col s12 m6 l6">
											<label class="Lato_normal_font label_font">State</label>

											<form:input type="text" path="primaryContact.workAddressState"
												id="primaryContactWorkAddressState" />
										</div>
										<div class="col s12 m6 l6">
											<label class="Lato_normal_font label_font">Country</label>
											<form:input type="text" path="primaryContact.workAddressCountry"
												id="primaryContactWorkAddressCountry" />
										</div>
									</div>
									<div class="row">
										<div class="col s12 m6 l6">
											<label class="Lato_normal_font label_font">Work Hours</label>

											<form:input type="text" path="primaryContact.workingHours"
												id="primaryContactWorkingHours" />
										</div>
										<div class="col s12 m6 l6">
											<label class="Lato_normal_font label_font">Car Plate No</label>
											<form:input type="text" path="primaryContact.carNumber" id="primaryContactCarNumber" />
										</div>
									</div>
									<div class="row">
										<div class="col s12 m6 l6">
											<div id="primaryPhotoimageSection"></div>
											<div class="file-field input-field">
												<div class="btn">
													<span>Photo</span> <input type="file" name="primaryContactPhoto"
														id="primaryContactPhoto">
												</div>
												<div class="file-path-wrapper">
													<input class="file-path validate" type="text">
												</div>
											</div>
										</div>
										<div class="col s12 m6 l6"></div>
									</div>
									<div class="row">
										<div class="col s12 m6 l6">
											<form:checkbox class="filled-in" id="primaryContactEmailOptIn"
												path="primaryContact.emailOptIn" checked="checked" value="true" />
											<form:label path="primaryContact.emailOptIn" class="label_font">Email Opt In</form:label>
										</div>
										<div class="col s12 m6 l6">
											<form:checkbox class="filled-in" id="primaryContactEmergencyContact" checked="checked"
												value="true" path="primaryContact.emergencyContact" />
											<form:label path="primaryContact.emergencyContact" class="label_font">Emergency Contact</form:label>
										</div>
									</div>
								</div>
							</div>
						</li>
						<li>
							<div class="collapsible-header">
								<i class="material-icons">supervisor_account</i>Secondary Contact Information
							</div>
							<div class="collapsible-body">
								<div class="container container_margin_top">
									<div class="row">
										<div class="col s12 m6 l6">
											<label class="Lato_normal_font label_font">First Name</label>
											<form:input type="text" path="secondaryContact.firstName" id="secondaryContactFirstName"
												class="ui-autocomplete-input" />
										</div>
										<div class="col s12 m6 l6">
											<label class="Lato_normal_font label_font">Last Name</label>
											<form:input type="text" path="secondaryContact.lastName" id="secondaryContactLastName" />
										</div>
									</div>
									<div class="row">
										<div class="col s12 m6 l6">
											<label class="Lato_normal_font label_font">Email</label>
											<form:input type="text" path="secondaryContact.email" id="secondaryContactEmail" />
										</div>
										<div class="col s12 m6 l6">
											<label class="Lato_normal_font label_font">Mobile Phone</label>
											<form:input type="text" path="secondaryContact.mobilePhone"
												id="secondaryContactMobilePhone" />
										</div>
									</div>
									<div class="row">
										<div class="col s12 m6 l6">
											<label class="Lato_normal_font label_font">Role</label>
											<form:select path="secondaryContact.relationType" id="secondaryContactRelationType">
												<form:option value="" label="-Select-" />
												<form:option value="1" label="Father" />
												<form:option value="2" label="Mother" />
												<form:option value="3" label="Guardian" />
												<form:option value="4" label="Other" />
											</form:select>
										</div>
										<div class="col s12 m6 l6">
											<label class="Lato_normal_font label_font">Marital Status</label>
											<form:select path="secondaryContact.martialStatus" id="secondaryContactMartialStatus">
												<form:option value="1" label="Married" />
												<form:option value="2" label="Widowed" />
												<form:option value="3" label="Divorced" />
												<form:option value="4" label="Single" />
											</form:select>
										</div>
									</div>
									<div class="row">
										<div class="col s12 m6 l6">
											<label class="Lato_normal_font label_font">Home Phone</label>
											<form:input type="text" path="secondaryContact.homePhone" id="secondaryContactHomePhone" />
										</div>
										<div class="col s12 m6 l6">
											<label class="Lato_normal_font label_font">Office Phone</label>
											<form:input type="text" path="secondaryContact.officePhone"
												id="secondaryContactOfficePhone" />
										</div>
									</div>
									<div class="row">
										<div class="col s12 m6 l6">
											<label class="Lato_normal_font label_font">Address 1</label>
											<form:input type="text" path="secondaryContact.homeAddressStreetOne"
												id="secondaryContactHomeAddressStreetOne" />
										</div>
										<div class="col s12 m6 l6">
											<label class="Lato_normal_font label_font">Address 2</label>
											<form:input type="text" path="secondaryContact.homeAddressStreetTwo"
												id="secondaryContactHomeAddressStreetTwo" />
										</div>
									</div>
									<div class="row">
										<div class="col s12 m6 l6">
											<label class="Lato_normal_font label_font">City</label>
											<form:input type="text" path="secondaryContact.homeAddressCity"
												id="secondaryContactHomeAddressCity" />
										</div>
										<div class="col s12 m6 l6">
											<label class="Lato_normal_font label_font">Postcode</label>
											<form:input type="text" path="secondaryContact.homeAddressPostCode"
												id="secondaryContactHomeAddressPostCode" />
										</div>
									</div>
									<div class="row">
										<div class="col s12 m6 l6">
											<label class="Lato_normal_font label_font">State</label>
											<form:input type="text" path="secondaryContact.homeAddressState"
												id="secondaryContactHomeAddressState" />
										</div>
										<div class="col s12 m6 l6">
											<label class="Lato_normal_font label_font">Country</label>
											<form:input type="text" path="secondaryContact.homeAddressCountry"
												id="secondaryContactHomeAddressCountry" />
										</div>
									</div>
									<div class="row">
										<div class="col s12 m6 l6">
											<label class="Lato_normal_font label_font">Identification No</label>
											<form:input type="text" path="secondaryContact.identificationNo"
												id="secondaryContactIdentificationNo" />
										</div>
										<div class="col s12 m6 l6">
											<label class="Lato_normal_font label_font">Employed By</label>
											<form:input type="text" path="secondaryContact.employedBy"
												id="secondaryContactEmployedBy" />
										</div>
									</div>
									<div class="row">
										<div class="col s12 m6 l6">
											<label class="Lato_normal_font label_font">Occupation</label>
											<form:input type="text" path="secondaryContact.occupation"
												id="secondaryContactOccupation" />
										</div>
										<div class="col s12 m6 l6"></div>
									</div>
									<div class="row">
										<div class="col s12 m6 l6">
											<label class="Lato_normal_font label_font">Work Address 1</label>
											<form:input type="text" path="secondaryContact.workAddressStreetOne"
												id="secondaryContactWorkAddressStreetOne" />
										</div>
										<div class="col s12 m6 l6">
											<label class="Lato_normal_font label_font">Work Address 2</label>
											<form:input type="text" path="secondaryContact.workAddressStreetTwo"
												id="secondaryContactWorkAddressStreetTwo" />
										</div>
									</div>
									<div class="row">
										<div class="col s12 m6 l6">
											<label class="Lato_normal_font label_font">City</label>
											<form:input type="text" path="secondaryContact.workAddressPostCode"
												id="secondaryContactWorkAddressCity" />
										</div>
										<div class="col s12 m6 l6">
											<label class="Lato_normal_font label_font">Postcode</label>
											<form:input type="text" path="secondaryContact.workAddressPostCode"
												id="secondaryContactWorkAddressPostCode" />
										</div>
									</div>
									<div class="row">
										<div class="col s12 m6 l6">
											<label class="Lato_normal_font label_font">State</label>
											<form:input type="text" path="secondaryContact.workAddressState"
												id="secondaryContactWorkAddressState" />
										</div>
										<div class="col s12 m6 l6">
											<label class="Lato_normal_font label_font">Country</label>
											<form:input type="text" path="secondaryContact.workAddressCountry"
												id="secondaryContactWorkAddressCountry" />
										</div>
									</div>
									<div class="row">
										<div class="col s12 m6 l6">
											<label class="Lato_normal_font label_font">Work Hours</label>
											<form:input type="text" path="secondaryContact.workingHours"
												id="secondaryContactWorkingHours" />
										</div>
										<div class="col s12 m6 l6">
											<label class="Lato_normal_font label_font">Car Plate No</label>
											<form:input type="text" path="secondaryContact.carNumber" id="secondaryContactCarNumber" />
										</div>
									</div>
									<div class="row">
										<div class="col s12 m6 l6">
											<div id="secondaryPhotoimageSection"></div>
											<div class="file-field input-field photo_sec_con">
												<div class="btn">
													<span>Photo</span> <input type="file" name="secondaryContactPhoto"
														id="secondaryContactPhoto">
												</div>
												<div class="file-path-wrapper">
													<input class="file-path validate" type="text">
												</div>
											</div>
										</div>
										<div class="col s12 m6 l6"></div>
									</div>
									<div class="row">
										<div class="col s12 m6 l6">
											<form:checkbox class="filled-in" id="secondaryContactEmailOptIn"
												path="secondaryContact.emailOptIn" checked="checked" value="true" />
											<form:label path="secondaryContact.emailOptIn">Email Opt In</form:label>
										</div>
										<div class="col s12 m6 l6">
											<form:checkbox class="filled-in" id="secondaryContactEmergencyContact" checked="checked"
												value="true" path="secondaryContact.emergencyContact" />
											<form:label path="secondaryContact.emergencyContact">Emergency Contact</form:label>
										</div>
									</div>
								</div>
							</div>
						</li>
					</ul>
				</div>
				<div class="col s12 m1 l1"></div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col s12 m2 l2"></div>
				<div class="col s12 m4 l4">
					<div class="center">
						<a onclick="return isDeleteMethod(false);"
							class="waves-effect waves-light blue darken-4 btn center login_button Lato_normal_font">Submit</a>
					</div>
				</div>
				<div class="col s12 m4 l4">
					<div class="center">
						<a onclick="return isDeleteMethod(true);"
							class="waves-effect waves-light blue darken-4 btn center login_button Lato_normal_font">Cancel</a>
					</div>
				</div>
				<div class="col s12 m4 l4"></div>
			</div>
		</div>
	</form:form> </main>
	<%@include file="footer.jsp"%>