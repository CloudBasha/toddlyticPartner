<%@include file="header.jsp"%>
<%-- <%
	String action = (String) request.getAttribute("action");
	String dateOfBirthString = (String) request
			.getAttribute("dateOfBirthString");
%> --%>
<script type="text/javascript">
<%-- var action ='<%=action%>';
$(function() {
    $( "#dateOfBirthString" ).datepicker({ dateFormat: 'yy-mm-dd' });
    var $datepicker = $( "#dateOfBirthString" );
    var dateOfBirthString = '<%=dateOfBirthString%>';
    if(dateOfBirthString!=null && dateOfBirthString!='' && dateOfBirthString!='null'){
    var parsedDate = $.datepicker.parseDate('yy-mm-dd', dateOfBirthString);
	$datepicker.datepicker('setDate',parsedDate );
    } 
  }); --%>
$(document).ready(function(){
	<%-- $('.listStudent').click(function(event){
		   var schoolId = $('#schoolId').val();	
		   var title = $(this).attr('title');
		   window.location.href="<%=request.getContextPath()%>/cms/viewStudent/"+schoolId+"?studentId="+title;
	    }); --%>
	<%-- $('.listStudent').click(function(event){
		   var schoolId = $('#schoolId').val();	
		   var title = $(this).attr('title');
		   window.location.href="<%=request.getContextPath()%>/cms/editStudent/"+schoolId+"?studentId="+title;
	    }); --%>
	/* if(action=='editStudent'){
		document.getElementById('view_student_info').style.display = 'none';
		document.getElementById('student_landing_div').style.display = 'none';
		document.getElementById('student_info').style.display = 'block';
		document.getElementById('student_func').style.display = 'none';
	}else if(action=='viewStudent'){
		document.getElementById('view_student_info').style.display = 'block';
		document.getElementById('student_landing_div').style.display = 'none';
		document.getElementById('student_func').style.display = 'block';
		document.getElementById('student_info').style.display = 'none';
	}else{
		document.getElementById('student_landing_div').style.display = 'block';
		document.getElementById('student_info').style.display = 'none';
		document.getElementById('student_func').style.display = 'none';
		document.getElementById('view_student_info').style.display = 'none';
	} */
	
	
});	

</script>
</head>
<body>
	<%@include file="login_nav.jsp"%>
	<script type="text/javascript">
	document.getElementById("login_title_logo").src = "<%=request.getContextPath()%>/images/pre_school_logo.jpg";
	</script>
	<main> <%@include file="school_main_menu.jsp"%>
	<div class="landing_div"></div>

	<div style="margin-top: 30px;">
		<div class="row">
			<!-- Left Column Div -->
			<div class="col s12 m3 l3 left_column">
				<div class="row">
					<div class="col s12 m12 l12">
						<div class="row">
							<div class="input-field col s12 autoC_ul">
								<i class="material-icons prefix">textsms</i> <input type="text" id="autocomplete-input"
									class="autocomplete"> <label for="autocomplete-input">Search Student</label>
							</div>
						</div>
					</div>
				</div>
				<div id="slider" style="height: 574px !important;">
					<div class="slider-content">
						<ul>
							<%-- <c:set var="startsWith" value="" />
							<c:forEach items="${studentsList}" var="student">
								<c:set var="firstName" value="${student.firstName}" />
								<c:set var="startsWith" value="${fn:substring(firstName, 0, 1)}" />
								<c:if test="${lastStartsWith=='' || lastStartsWith ne startsWith }">
									<li id="${startsWith}"><a class="title">${startsWith}</a>
										<ul>
								</c:if>

								<li><a href="javascript:void(0)" class="listStudent" onclick="switchStuInfoDiv(2);" title="${student.studentId}">
										<img src="<%=request.getContextPath()%>/cms/studentimages?id=${student.studentId}"
										width="40px" height="40px" class="circle li_student_img" /> ${student.firstName}
								</a></li>
								<c:if test="${not empty lastStartsWith  && lastStartsWith ne startsWith }">
						</ul>
						</li>
						</c:if>
						<c:set var="lastStartsWith" value="${startsWith}" />
						</c:forEach> --%>
							<li><a href="javascript:void(0)" onclick="switchStuInfoDiv(2);"> <img
									src="<%=request.getContextPath()%>/images/yuna.jpg" width="40px" height="40px"
									class="circle li_student_img" /> Yuna
							</a></li>

						</ul>
					</div>
				</div>
			</div>
			<div class="col s12 m1 l1"></div>

			<!-- Mid Column Div -->
			<div id="student_landing_div" class="col s12 m8 l8 landing_div center">
				<div class="row">
					<div class="col s12 m4 l3">
						<a href="<%=request.getContextPath()%>/cms/createStudent/${id}"
							class="waves-effect waves-light btn">New Student</a>
					</div>
				</div>
				<p>To be designed</p>
			</div>

			<!-- View Student -->
			<div id="view_student_info" class="col s12 m7 l7 view_student_info">
				<h4 class="Lato_normal_font">[Selected Student Name]</h4>
				<div class="row">
					<div class="col s12 m5 l5">
						<div class="row form_view_row">
							<div class="col s6 m4 l4 form_view_info_label">
								<label class="Lato_normal_font label_font">Name:</label>
							</div>
							<div class="col s6 m8 l8">
								<input class="form_view_info_input Lato_normal_font" disabled value="Ali Abu">
							</div>
						</div>
						<div class="row form_view_row">
							<div class="col s6 m4 l4 form_view_info_label">
								<label class="Lato_normal_font label_font">Date of birth:</label>
							</div>
							<div class="col s6 m8 l8">
								<input class="form_view_info_input Lato_normal_font" disabled value="1919-09-19">
							</div>
						</div>
						<div class="row form_view_row">
							<div class="col s6 m4 l4 form_view_info_label">
								<label class="Lato_normal_font label_font">Peditrician Name:</label>
							</div>
							<div class="col s6 m8 l8">
								<input class="form_view_info_input Lato_normal_font" disabled value="Ahmad">
							</div>
						</div>
						<div class="row form_view_row">
							<div class="col s6 m4 l4 form_view_info_label">
								<label class="Lato_normal_font label_font">Medication:</label>
							</div>
							<div class="col s6 m8 l8">
								<input class="form_view_info_input Lato_normal_font" disabled value="none">
							</div>
						</div>
					</div>
					<div class="col s12 m5 l5">
						<div class="row form_view_row">
							<div class="col s6 m4 l4 form_view_info_label">
								<label class="Lato_normal_font label_font">Name(TBC):</label>
							</div>
							<div class="col s6 m8 l8">
								<input class="form_view_info_input Lato_normal_font" disabled value="Ali">
							</div>
						</div>
						<div class="row form_view_row">
							<div class="col s6 m4 l4 form_view_info_label">
								<label class="Lato_normal_font label_font">Gender:</label>
							</div>
							<div class="col s6 m8 l8">
								<input class="form_view_info_input Lato_normal_font" disabled value="Male">
							</div>
						</div>
						<div class="row form_view_row">
							<div class="col s6 m4 l4 form_view_info_label">
								<label class="Lato_normal_font label_font">Peditrician Contact:</label>
							</div>
							<div class="col s6 m8 l8">
								<input class="form_view_info_input Lato_normal_font" disabled value="0312345678">
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col m2 l5"></div>
					<div class="col s12 m5 l3">
						<div class="center">
							<a class="waves-effect waves-light blue darken-4 btn center login_button Lato_normal_font"
								href="javascript:void(0)" onclick="switchStuInfoDiv(1);">Edit</a>
						</div>
					</div>
					<div class="col s12 m5 l3">
						<script type="text/javascript">
							function alertDelete(){
								confirm('Are you sure you want to remove this student?');
							}
						</script>
						<a class="waves-effect waves-red red btn center login_button Lato_normal_font"
							href="javascript:void(0)" onclick="alertDelete();">Delete</a>
					</div>
				</div>

				<div class="row contact_table">
					<div class="col s12 m12 l12">
						<table class="bordered highlight responsive-table">
							<thead>
								<tr>
									<th data-field="name">Contact Name</th>
									<th>Role</th>
									<th data-field="price">Emergency Contact</th>
									<th data-field="datetime">Phone</th>
								</tr>
							</thead>

							<tbody>
								<%-- <c:forEach items="${contactsForStudent}" var="contact">
									<tr>
										<td><img
											src="<%=request.getContextPath()%>/cms/contactimages?id=${contact.contactId}"
											width="40px" height="40px" class="circle li_student_img" /> ${contact.firstName}</td>
										<td><c:choose>
												<c:when test="${contact.relationType=='1'}">
													<img src="<%=request.getContextPath()%>/images/father.png" width="40px" height="40px"
														class="circle li_student_img" />
												</c:when>
												<c:otherwise>
													<img src="<%=request.getContextPath()%>/images/mother.png" width="40px" height="40px"
														class="circle li_student_img" />
												</c:otherwise>
											</c:choose></td>
										<td class="center"><input type="checkbox" class="filled-in" id="fi12"
											checked="${(studentEdit.gender eq '1') ? 'checked' : ''}" disabled /> <label for="fi12"></label>
										</td>
										<td><img src="<%=request.getContextPath()%>/images/phone-call.png" width="40px"
											height="40px" class="circle li_student_img" />${contact.mobilePhone }</td>
									</tr>

								</c:forEach> --%>
								<tr>
									<td><img src="<%=request.getContextPath()%>/images/brad.jpg" width="50px"
										height="50px" class="circle icon_beside_text"/> <span class="Lato_normal_font contact_students_name icon_beside_text">John</span></td>
									<td><img src="<%=request.getContextPath()%>/images/father.png" width="40px"
										height="40px" class="circle li_student_img" /></td>
									<td><div class="stu_con_cb"><input type="checkbox" class="filled-in" id="filled-in-box"
										checked="checked" disabled /><label for="filled-in-box"></label></div></td>
									<td><img src="<%=request.getContextPath()%>/images/phone-call.png" width="40px"
										height="40px" class="circle li_student_img" /></td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="col l1"></div>
				</div>
			</div>

			<!-- Student Edit Info -->
			<div id="student_info" class="col s12 m7 l7 student_info">
				<%
					String formAction = request.getContextPath() + "/cms/updateStudent";
				%>
				<form:form commandName="studentEdit" method="post" action="<%=formAction%>" id="editForm"
					enctype="multipart/form-data">
					<input type="hidden" name="studentId" id="studentEdit.studentId"
						value="${studentEdit.studentId }">
					<input type="hidden" name="path" id="path" value="${id}">

					<div class="row">
						<div class="col s12 m12 l12">
							<h5 class="Lato_normal_font">[Selected Student Name]</h5>
						</div>
					</div>

					<div class="row">
						<div class="col s12 m5 l5">
							<label class="Lato_normal_font label_font">First Name</label>
							<form:input type="text" path="firstName" id="studentFirstName" />
						</div>
						<div class="col s12 m5 l5">
							<label class="Lato_normal_font label_font">Last Name</label>
							<form:input type="text" path="lastName" id="studentLastName" />
						</div>
					</div>
					<div class="row">
						<div class="col s12 m5 l5">
							<label class="Lato_normal_font label_font">Preferred Name To Be Called</label>
							<form:input type="text" path="preferedNameToBeCalled" />

						</div>

						<div class="col s12 m5 l5">
							<label class="Lato_normal_font label_font">Date of Birth</label>
							<form:input path="dateOfBirthString" id="dateOfBirthString" />
						</div>
					</div>
					<div class="row">
						<div class="input-field col s12 m5 l5 edit_gender_select">
							<form:select path="gender">
								<form:option value="" label="Select gender" disabled="disabled" selected="selected" />
								<form:option value="1" label="Male"
									selected="${(studentEdit.gender eq '1') ? 'selected' : ''}" />
								<form:option value="2" label="Female"
									selected="${(studentEdit.gender eq '1') ? 'selected' : ''}" />
							</form:select>
							<label class="Lato_normal_font label_font">Gender</label>
						</div>
						<div class="col s12 m5 l5">
							<label class="Lato_normal_font label_font">Medication</label>
							<form:input type="text" path="medication" />
						</div>
					</div>
					<div class="row">
						<div class="input-field col s12 m5 l5">
							<label class="Lato_normal_font label_font">Peditrician Name</label>
							<form:input type="text" path="pediatricianName" />
						</div>
						<div class="input-field col s12 m5 l5">
							<label class="Lato_normal_font label_font">Peditrician Contact No</label>
							<form:input type="text" path="pediatricianPhone" />
						</div>
					</div>
					<div class="row">
						<div class="input-field col s12 m5 l5">
							<c:if test="${ not empty studentEdit.photoUrl }">
								<div>
									<a href="<%=request.getContextPath()%>/cms/studentimages?id=${studentEdit.studentId}"
										target="_blank">Image</a>
								</div>
							</c:if>
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
					<div class="row">
						<div class="col l1"></div>
						<div class="col s12 m4 l4">
							<div class="center">
								<a class="waves-effect waves-light blue darken-4 btn center login_button Lato_normal_font"
									onclick="$(this).closest('form').submit();">Update</a>
							</div>
						</div>
						<div class="col s12 m4 l4">
							<div class="center">
								<a href="javascript:void(0)" onclick="switchStuInfoDiv(2);"
									class="waves-effect waves-light blue darken-4 btn center login_button Lato_normal_font">Cancel</a>

							</div>
						</div>
						<div class="col s12 m4 l4"></div>
					</div>
				</form:form>
			</div>

			<div id="student_func" class="col s12 m4 l1 student_func">
				<div class="row">
					<div class="col s3 m12 l12">
						<a class="modal-trigger" href="#add_bill"><img class="tooltipped"
							src="<%=request.getContextPath()%>/images/bill_icon.png" width="50px" height="50px"
							data-position="left" data-delay="300" data-tooltip="Bills" /></a>
					</div>
					<div class="col s3 m12 l12">
						<a class="modal-trigger" href="#student_reports"><img class="tooltipped"
							src="<%=request.getContextPath()%>/images/progress_report.png" width="50px" height="50px"
							data-position="left" data-delay="300" data-tooltip="Reports" /></a>
					</div>
					<div class="col s3 m12 l12">
						<a class="modal-trigger" href="#add_student_contact"><img class="tooltipped"
							src="<%=request.getContextPath()%>/images/contact_icon.png" width="50px" height="50px"
							data-position="left" data-delay="300" data-tooltip="Add Contact" /></a>
					</div>
					<div class="col s3 m12 l12">
						<a class="modal-trigger" href="#add_student_photo"><img class="tooltipped"
							src="<%=request.getContextPath()%>/images/photo_icon.png" width="50px" height="50px"
							data-position="left" data-delay="300" data-tooltip="Add Photo" /></a>
					</div>
				</div>
			</div>
		</div>

		<%@include file="shortcut_div.jsp"%>
	</div>

	<!-- Modal Divs -->
	<div id="add_student_contact" class="modal" style="width: 80%; max-height: 80%;">
		<div class="modal-content">
			<div class="container container_margin_top">
				<ul class="collapsible" data-collapsible="accordion">
					<li>
						<div class="collapsible-header">
							<i class="material-icons">supervisor_account</i>Contact Information
						</div>
						<div class="collapsible-body">
							<div class="container container_margin_top">
								<div class="row">
									<div class="col s12 m6 l6">
										<label class="Lato_normal_font label_font">First Name</label> <input type="text"
											name="contactFn" id="contactFn" />
									</div>
									<div class="col s12 m6 l6">
										<label class="Lato_normal_font label_font">Last Name</label> <input type="text"
											name="contactLn" id="contactLn" />
									</div>
								</div>
								<div class="row">
									<div class="col s12 m6 l6">
										<label class="Lato_normal_font label_font">Email</label> <input type="text"
											name="contactEm" id="contactEm" />
									</div>
									<div class="col s12 m6 l6">
										<label class="Lato_normal_font label_font">Mobile Phone</label> <input type="text"
											name="contactMp" id="contactMp" />
									</div>
								</div>
								<div class="row">
									<div class="col s12 m6 l6">
										<div class="input-field role_select">
											<select id="contactR">
												<option value="" disabled selected>Select role</option>
												<option value="1">Father</option>
												<option value="2">Mother</option>
												<option value="3">Guardian</option>
											</select> <label class="Lato_normal_font label_font">Role</label>
										</div>
									</div>
									<div class="col s12 m6 l6">
										<div class="input-field role_select">
											<select id="contactMs">
												<option value="" disabled selected>Select status</option>
												<option value="1">Single</option>
												<option value="2">Married</option>
												<option value="3">Separated</option>
												<option value="4">Divorced</option>
												<option value="5">Widowed</option>
											</select> <label class="Lato_normal_font label_font">Marital Status</label>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col s12 m6 l6">
										<label class="Lato_normal_font label_font">Identification No</label> <input type="text"
											name="contactIn" id="contactIn" />
									</div>
									<div class="col s12 m6 l6">
										<label class="Lato_normal_font label_font">Car Plate No</label> <input type="text"
											name="contactCpn" id="contactCpn" />
									</div>
								</div>
								<div class="row">
									<div class="col s12 m6 l6">
										<label class="Lato_normal_font label_font">Home Phone</label> <input type="text"
											name="contactHp" id="contactHp" />
									</div>
									<div class="col s12 m6 l6">
										<div class="file-field input-field photo_upload">
											<div class="btn">
												<span>Photo</span> <input type="file" name="primaryContactPhoto"
													id="primaryContactPhoto">
											</div>
											<div class="file-path-wrapper">
												<input class="file-path validate" type="text">
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col s12 m6 l6">
										<label class="Lato_normal_font label_font">Address 1</label> <input type="text"
											name="contactAd1" id="contactAd1" />
									</div>
									<div class="col s12 m6 l6">
										<label class="Lato_normal_font label_font">Address 2</label> <input type="text"
											name="contactAd2" id="contactAd2" />
									</div>
								</div>
								<div class="row">
									<div class="col s12 m6 l6">
										<label class="Lato_normal_font label_font">City</label> <input type="text"
											name="contactCity" id="contactCity" />
									</div>
									<div class="col s12 m6 l6">
										<label class="Lato_normal_font label_font">Poscode</label> <input type="text"
											name="contactPos" id="contactPos" />
									</div>
								</div>
								<div class="row">
									<div class="col s12 m6 l6">
										<label class="Lato_normal_font label_font">State</label> <input type="text"
											name="contactSt" id="contactSt" />
									</div>
									<div class="col s12 m6 l6">
										<label class="Lato_normal_font label_font">Country</label> <input type="text"
											name="contactCo" id="contactCo" />
									</div>
								</div>
							</div>
						</div>
					</li>
					<li>
						<div class="collapsible-header">
							<i class="material-icons">list</i>Work Information
						</div>
						<div class="collapsible-body">
							<div class="container container_margin_top">
								<div class="row">
									<div class="col s12 m6 l6">
										<label class="Lato_normal_font label_font">Employer</label> <input type="text"
											name="contactEmp" id="contactEmp" />
									</div>
									<div class="col s12 m6 l6">
										<label class="Lato_normal_font label_font">Occupation</label> <input type="text"
											name="contactOc" id="contactOc" />
									</div>
								</div>
								<div class="row">
									<div class="col s12 m6 l6">
										<label class="Lato_normal_font label_font">Office Phone</label> <input type="text"
											name="contactOp" id="contactOp" />
									</div>
									<div class="col s12 m6 l6">
										<label class="Lato_normal_font label_font">Work Hours</label> <input type="text"
											name="contactWh" id="contactWh" />
									</div>
								</div>
								<div class="row">
									<div class="col s12 m6 l6">
										<label class="Lato_normal_font label_font">Work Address 1</label> <input type="text"
											name="contactWa1" id="contactWa1" />
									</div>
									<div class="col s12 m6 l6">
										<label class="Lato_normal_font label_font">Work Address 2</label> <input type="text"
											name="contactWa2" id="contactWa2" />
									</div>
								</div>
								<div class="row">
									<div class="col s12 m6 l6">
										<label class="Lato_normal_font label_font">City</label> <input type="text"
											name="contactWc" id="contactWc" />
									</div>
									<div class="col s12 m6 l6">
										<label class="Lato_normal_font label_font">Poscode</label> <input type="text"
											name="contactWpos" id="contactWpos" />
									</div>
								</div>
								<div class="row">
									<div class="col s12 m6 l6">
										<label class="Lato_normal_font label_font">State</label> <input type="text"
											name="contactWst" id="contactWst" />
									</div>
									<div class="col s12 m6 l6">
										<label class="Lato_normal_font label_font">Country</label> <input type="text"
											name="contactWco" id="contactWco" />
									</div>
								</div>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</div>
		<div class="modal-footer">
			<a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Cancel</a> <a
				href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat" onclick="">Add</a>
		</div>
	</div>
	<div id="add_student_photo" class="modal" style="width: 70%; max-height: 80%;">
		<div class="modal-content">
			<div class="">
				<div class="row">
					<div class="col s12 m12 l12">
						<h5>[Selected Student Name]</h5>
					</div>
				</div>
				<div class="row">
					<div class="col s12 m7 l7">
						<div class="row">
							<div class="col s12 m7 l7">
								<select>
									<option value="" disabled selected>Select Album</option>
									<option value="1">Album A</option>
								</select>
							</div>
						</div>
						<div class="row">
							<div class="col s12 m9 l9">
								<div class="file-field input-field">
									<div class="btn">
										<span>Photo</span> <input type="file">
									</div>
									<div class="file-path-wrapper">
										<input class="file-path validate" type="text">
									</div>
								</div>
								<div>
									<p class="photo_upload_msg">*Maximum file size: 3 mb</p>
								</div>
							</div>
							<div class="col s12 m3 l3 public_chkbtn">
								<input type="checkbox" class="filled-in" id="isPublic" name="isPublic" value="true"
									checked="checked" /> <label for="isPublic">Public</label>
							</div>
						</div>
					</div>
					<div class="col s12 m5 l5">
						<div class="row">
							<div class="col s12 m12 l12">Tag Other Students</div>
						</div>
						<div class="row">
							<div class="col s9 m10 l10 input-field">
								<input id="other_name" type="text" class="validate"> <label for="other_name">Student
									Name</label>
							</div>
							<div class="col s3 m2 l2">
								<a href="javascript:void(0)" onclick=""> <img
									src="<%=request.getContextPath()%>/images/add.png" width="30px" height="30px"
									style="margin-top: 30px;" />
								</a>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
		<div class="modal-footer">
			<a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Cancel</a> <a
				href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat" onclick="">Add</a>
		</div>
	</div>
	<div id="student_reports" class="modal" style="width: 80%;">
		<div id="student_reports_content" class="modal-content">
			<div class="row">
				<div class="col s12 m12 l12">[Selected Student Name] Reports</div>
			</div>
			<div class="row">
				<div class="col s12 m2 l2 center">
					<div class="row">
						<a href=""><img src="<%=request.getContextPath()%>/images/report.png" width="100px" /><br />
							<span style="font-size: 0.8em;">Progress Report</span></a>
					</div>
					<div class="row">
						<div class="col s6 l6 m6">
							<a href="" class="tooltipped" data-position="bottom" data-delay="300" data-tooltip="Download"><img src="<%=request.getContextPath()%>/images/download.png" width="30px" height="30px"/></a>
						</div>
						<div class="col s6 l6 m6">
							<a href="" class="tooltipped" data-position="bottom" data-delay="300" data-tooltip="Delete"><img src="<%=request.getContextPath()%>/images/delete.png" width="30px" height="30px"/></a>
						</div>
					</div>
				</div>
				<div class="col s12 m2 l2 center">
					<a href=""><img src="<%=request.getContextPath()%>/images/report.png" width="100px" /><br />
						<span style="font-size: 0.8em;">Progress Report</span></a>
				</div>
				<div class="col s12 m2 l2 center">
					<a href=""><img src="<%=request.getContextPath()%>/images/report.png" width="100px" /><br />
						<span style="font-size: 0.8em;">Progress Report</span></a>
				</div>
			</div>
		</div>
		<div class="modal-footer">
			<a href="javascript:void(0);" class=" modal-action modal-close waves-effect waves-green btn-flat">Cancel</a>
			<a href="javascript:void(0);" class=" modal-action modal-close waves-effect waves-green btn-flat"
				onclick="$(this).closest('form').submit();">Add</a>
		</div>
	</div>
	<div id="add_bill" class="modal" style="width: 50%">
		<div id="bill_content" class="modal-content">
			<div class="row">
				<div class="col s12 m12 l12">[Selected Student Name]</div>
			</div>
			<div class="row old_row">
				<div class="input-field col s6 m6 l6">
					<select>
						<option value="" selected disabled>Select item</option>
						<option value="1">Pre Scholar Program</option>
						<option value="2">Infant Program</option>
					</select> <label>Select Billing Item</label>
				</div>
				<div class="input-field col s4 m4 l4">
					<select size="5">
						<option value="" selected disabled>Select quantity</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
						<option value="9">9</option>
						<option value="10">10</option>
					</select> <label>Select Quantity</label>
				</div>
				<div class="input-field col s2 m2 l2">
					<a href="javascript:void(0)" onclick="createNewItemRow();"><img
						src="<%=request.getContextPath()%>/images/add.png" width="25px" height="25px" /></a>
				</div>
			</div>
		</div>
		<div class="modal-footer">
			<a href="javascript:void(0);" class=" modal-action modal-close waves-effect waves-green btn-flat">Cancel</a>
			<a href="javascript:void(0);" class=" modal-action modal-close waves-effect waves-green btn-flat"
				onclick="$(this).closest('form').submit();">Add</a>
		</div>
	</div>
	</main>
	<%@include file="footer.jsp"%>