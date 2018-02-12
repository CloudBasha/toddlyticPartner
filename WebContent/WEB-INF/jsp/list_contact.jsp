<%@include file="header.jsp"%>
<%
	String action = (String) request.getAttribute("action");
%>
<script>
var action ='<%=action%>';

<%-- $(document).ready(function(){
	
	$('.listContact').click(function(event){
		   var schoolId = $('#schoolId').val();	
		   var title = $(this).attr('title');
		   window.location.href="<%=request.getContextPath()%>/cms/editContact/"+schoolId+"?contactId="+title;
	    });
	if(action=='editContact'){
		showContactDiv();
	}
	else{
		document.getElementById('c_landing_div').style.display = 'block';
		document.getElementById('contact_info').style.display = 'none';
	}
});	 --%>

</script>
</head>
<body>
	<%@include file="login_nav.jsp"%>
	<script type="text/javascript">
	document.getElementById("login_title_logo").src = "<%=request.getContextPath()%>/images/pre_school_logo.jpg";
	</script>
	<main> <%@include file="school_main_menu.jsp"%> <input type="hidden"
		name="schoolId" value="${id }" id="schoolId">
	<div style="margin-top: 30px;">
		<div class="row">
			<div class="col s12 m4 l3">
				<div class="row">
					<div class="col s12 m12 l12">
						<div class="row">
							<div class="input-field col s12">
								<i class="material-icons prefix">textsms</i> <input type="text" id="autocomplete-input"
									class="autocomplete"> <label for="autocomplete-input">Search Contact</label>
							</div>
						</div>
					</div>
				</div>
				<div class="" id="slider" style="height: 574px !important;">
					<div class="slider-content">
						<ul>
							<%-- <c:set var="startsWith" value="" />
							<c:forEach items="${contactTransientsList}" var="contact">
								<c:set var="firstName" value="${contact.firstName}" />
								<c:set var="startsWith" value="${fn:substring(firstName, 0, 1)}" />
								<c:if test="${lastStartsWith=='' || lastStartsWith ne startsWith }">
									<li id="${startsWith}"><a class="title">${startsWith}</a>
										<ul>
								</c:if>

								<li><a href="javascript:void(0)" class="listContact" title="${contact.contactId}">
										<img src="<%=request.getContextPath()%>/cms/contactimages?id=${contact.contactId}"
										width="40px" height="40px" class="circle li_student_img" /> ${contact.firstName}
								</a></li>


								<c:if test="${not empty lastStartsWith  && lastStartsWith ne startsWith }">
						</ul>
						</li>
						</c:if>
						<c:set var="lastStartsWith" value="${startsWith}" />
						</c:forEach> --%>
							<li><a href="javascript:void(0)" onclick="switchConInfoDiv(2);"> <img
									src="<%=request.getContextPath()%>/images/yuna.jpg" width="40px" height="40px"
									class="circle li_student_img" /> John Smith
							</a></li>

						</ul>
					</div>
				</div>
			</div>
			<div class="col s12 m1 l1"></div>

			<div id="c_landing_div" class="col s12 m7 l7 c_landing_div center">
				<div class="row">
					<div class="col s12 m4 l4">
						<a href="<%=request.getContextPath()%>/cms/create_contact/${id}"
							class="waves-effect waves-light btn">New Contact</a>
					</div>
				</div>
				<p>To be designed</p>
			</div>

			<!-- View Contact Info -->
			<div id="view_contact_info" class="col s12 m7 l7 view_contact_info">
				<h4 class="Lato_normal_font">[Selected Contact Name]</h4>
				<div class="row form_view_row">
					<div class="col s12 m5 l5">
						<div class="row form_view_row">
							<div class="col s6 m4 l4 form_view_info_label">
								<label class="Lato_normal_font label_font">Name:</label>
							</div>
							<div class="col s6 m8 l8">
								<input class="form_view_info_input Lato_normal_font" disabled value="John Smith">
							</div>
						</div>
						<div class="row form_view_row">
							<div class="col s6 m4 l4 form_view_info_label">
								<label class="Lato_normal_font label_font">Email:</label>
							</div>
							<div class="col s6 m8 l8">
								<input class="form_view_info_input Lato_normal_font" disabled value="john@gmail.com">
							</div>
						</div>
						<div class="row form_view_row">
							<div class="col s6 m4 l4 form_view_info_label">
								<label class="Lato_normal_font label_font">Contact No:</label>
							</div>
							<div class="col s6 m8 l8">
								<input class="form_view_info_input Lato_normal_font" disabled value="0123456789">
							</div>
						</div>
						<div class="row form_view_row">
							<div class="col s6 m4 l4 form_view_info_label">
								<label class="Lato_normal_font label_font">Home Phone:</label>
							</div>
							<div class="col s6 m8 l8">
								<input class="form_view_info_input Lato_normal_font" disabled value="0312345678">
							</div>
						</div>
					</div>
					<div class="col s12 m5 l5">
						<div class="row form_view_row">
							<div class="col s6 m4 l4 form_view_info_label">
								<label class="Lato_normal_font label_font">Id No:</label>
							</div>
							<div class="col s6 m8 l8">
								<input class="form_view_info_input Lato_normal_font" disabled value="123456121234">
							</div>
						</div>
						<div class="row form_view_row">
							<div class="col s6 m4 l4 form_view_info_label">
								<label class="Lato_normal_font label_font">Role:</label>
							</div>
							<div class="col s6 m8 l8">
								<input class="form_view_info_input Lato_normal_font" disabled value="Father">
							</div>
						</div>
						<div class="row form_view_row">
							<div class="col s6 m4 l4 form_view_info_label">
								<label class="Lato_normal_font label_font">Marital Status:</label>
							</div>
							<div class="col s6 m8 l8">
								<input class="form_view_info_input Lato_normal_font" disabled value="Married">
							</div>
						</div>
						<div class="row form_view_row">
							<div class="col s6 m4 l4 form_view_info_label">
								<label class="Lato_normal_font label_font">Car Plate:</label>
							</div>
							<div class="col s6 m8 l8">
								<input class="form_view_info_input Lato_normal_font" disabled value="WWW1234">
							</div>
						</div>
					</div>
				</div>
				<div class="row form_view_row">
					<div class="col s12 m3 l2" style="max-width: 110px;">
						<div class="form_view_info_label">
							<label class="Lato_normal_font label_font">Address:</label>
						</div>
					</div>
					<div class="col s12 m9 l10">
						<input class="form_view_info_input Lato_normal_font" disabled
							value="A1234 Jalan 12, Taman Jaya, Selangor, Malaysia"></input>
					</div>
				</div>

				<div class="row work_info_row">
					<div class="col s12 m12 l12 work_info_col">
						<div class="icon_beside_text">
							<i class="work_info_icon material-icons icon_beside_text">list</i>
						</div>
						<div class="icon_beside_text">
							<h5 class="Lato_normal_font icon_beside_text">Work Information</h5>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col s12 m5 l5">
						<div class="row form_view_row">
							<div class="col s6 m4 l4 form_view_info_label">
								<label class="Lato_normal_font label_font">Employer:</label>
							</div>
							<div class="col s6 m8 l8">
								<input class="form_view_info_input Lato_normal_font" disabled value="Jane Cooperation">
							</div>
						</div>
						<div class="row form_view_row">
							<div class="col s6 m4 l4 form_view_info_label">
								<label class="Lato_normal_font label_font">Office Phone:</label>
							</div>
							<div class="col s6 m8 l8">
								<input class="form_view_info_input Lato_normal_font" disabled value="03601234567">
							</div>
						</div>
					</div>
					<div class="col s12 m5 l5">
						<div class="row form_view_row">
							<div class="col s6 m4 l4 form_view_info_label">
								<label class="Lato_normal_font label_font">Occupation:</label>
							</div>
							<div class="col s6 m8 l8">
								<input class="form_view_info_input Lato_normal_font" disabled value="Engineer">
							</div>
						</div>
						<div class="row form_view_row">
							<div class="col s6 m4 l4 form_view_info_label">
								<label class="Lato_normal_font label_font">Work Hours:</label>
							</div>
							<div class="col s6 m8 l8">
								<input class="form_view_info_input Lato_normal_font" disabled value="8.30 to 5.30">
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col s12 m3 l2" style="max-width: 110px;">
						<div class="form_view_info_label">
							<label class="Lato_normal_font label_font">Work Address:</label>
						</div>
					</div>
					<div class="col s12 m9 l10">
						<input class="form_view_info_input" disabled
							value="A1234 Jalan 12, Taman Jaya, Selangor, Malaysia"></input>
					</div>
				</div>

				<div class="row">
					<div class="col m2 m2 l6"></div>
					<div class="col s12 m5 l3">
						<div class="center">
							<a class="waves-effect waves-light blue darken-4 btn center login_button Lato_normal_font"
								href="javascript:void(0)" onclick="switchConInfoDiv(1);">Edit</a>
						</div>
					</div>
					<div class="col s12 m5 l3">
						<script type="text/javascript">
							function alertDelete(){
								confirm('Are you sure you want to remove this contact?');
							}
						</script>
						<a class="waves-effect waves-red red btn center login_button Lato_normal_font"
							href="javascript:void(0)" onclick="alertDelete();">Delete</a>
					</div>
				</div>

				<div class="row student_table">
					<div class="col s12 m12 l12">
						<table class="bordered highlight responsive-table">
							<thead>
								<tr>
									<th data-field="name">Name</th>
									<th>Edit Profile</th>
									<th>Upload Photo</th>
									<th>Add Bill Item</th>
									<th>Upload Progress Report</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><img src="<%=request.getContextPath()%>/images/brad.jpg" width="50px"
										height="50px" class="circle icon_beside_text" /> <span
										class="Lato_normal_font contact_students_name icon_beside_text">John</span></td>
									<td class="center"><a href=""><img
											src="<%=request.getContextPath()%>/images/edit.png" width="30px" height="30px" /></a></td>
									<td class="center"><a href=""><img
											src="<%=request.getContextPath()%>/images/add_image.png" width="30px" height="30px" /></a></td>
									<td class="center"><a href=""><img
											src="<%=request.getContextPath()%>/images/bill.png" width="30px" height="30px" /></a></td>
									<td class="center"><a href=""><img
											src="<%=request.getContextPath()%>/images/add_report.png" width="30px" height="30px" /></a></td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="col l1"></div>
				</div>
			</div>

			<div id="contact_info" class="col s12 m8 l8 contact_info">
				<form method="post" action="<%=request.getContextPath()%>/cms/updateContactPost" id="editForm"
					enctype="multipart/form-data">
					<input type="hidden" name="path" id="path" value="${id}">
					<spring:bind path="primaryContact.contactId">
						<input type="hidden" name="${status.expression}" id="${status.expression}"
							value="${status.value}">
					</spring:bind>

					<div class="login_margin_top">
						<div class="row">
							<div class="col s12 m12 l12">
								<h5 class="Lato_normal_font">[Selected Contact Name]</h5>
							</div>
						</div>
						<div class="row">
							<div class="col s12 m10 l10">
								<ul class="collapsible" data-collapsible="accordion">
									<li>
										<div class="collapsible-header active">
											<i class="material-icons">supervisor_account</i>Contact Information
										</div>
										<div class="collapsible-body">
											<div class="container container_margin_top">
												<div class="row">
													<div class="col s12 m6 l6">
														<label class="Lato_normal_font label_font">First Name</label>
														<spring:bind path="primaryContact.firstName">
															<input type="text" name="${status.expression}" value="${status.value}"
																id="primaryContact.firstName" />
														</spring:bind>
													</div>
													<div class="col s12 m6 l6">
														<label class="Lato_normal_font label_font">Last Name</label>
														<spring:bind path="primaryContact.lastName">
															<input type="text" name="${status.expression}" value="${status.value}"
																id="primaryContact.lastName" />
														</spring:bind>
													</div>
												</div>
												<div class="row">
													<div class="col s12 m6 l6">
														<label class="Lato_normal_font label_font">Email</label>
														<spring:bind path="primaryContact.email">
															<input type="text" name="${status.expression}" value="${status.value}"
																id="${status.expression}" />
														</spring:bind>
													</div>
													<div class="col s12 m6 l6">
														<label class="Lato_normal_font label_font">Mobile Phone</label>
														<spring:bind path="primaryContact.mobilePhone">
															<input type="text" name="${status.expression}" value="${status.value}"
																id="${status.expression}" />
														</spring:bind>
													</div>
												</div>
												<div class="row">
													<div class="col s12 m6 l6 input-field edit_role_select">
														<spring:bind path="primaryContact.relationType">
															<select name="${status.expression}" id="${status.expression}">
																<option value="" disabled selected>Select role</option>
																<option value="1"
																	selected="${(primaryContact.relationType eq '1') ? 'selected' : ''}">Father</option>
																<option value="2"
																	selected="${(primaryContact.relationType eq '2') ? 'selected' : ''}">Mother</option>
																<option value="3"
																	selected="${(primaryContact.relationType eq '3') ? 'selected' : ''}">Guardian</option>
															</select>
														</spring:bind>
														<label class="Lato_normal_font label_font">Role</label>
													</div>
													<div class="col s12 m6 l6 input-field edit_role_select">
														<spring:bind path="primaryContact.martialStatus">
															<select name="${status.expression}" id="${status.expression}">
																<option value="" disabled selected>Select status</option>
																<option value="1"
																	selected="${(primaryContact.relationType eq '1') ? 'selected' : ''}">Single</option>
																<option value="2"
																	selected="${(primaryContact.relationType eq '2') ? 'selected' : ''}">Married</option>
																<option value="3"
																	selected="${(primaryContact.relationType eq '3') ? 'selected' : ''}">Separated</option>
																<option value="4"
																	selected="${(primaryContact.relationType eq '4') ? 'selected' : ''}">Divorced</option>
																<option value="5"
																	selected="${(primaryContact.relationType eq '5') ? 'selected' : ''}">Widowed</option>
															</select>
														</spring:bind>
														<label class="Lato_normal_font label_font">Marital Status</label>
													</div>
												</div>

												<div class="row">
													<div class="col s12 m6 l6">
														<label class="Lato_normal_font label_font">Identification No</label>
														<spring:bind path="primaryContact.identificationNo">
															<input type="text" name="${status.expression}" value="${status.value}"
																id="${status.expression}" />
														</spring:bind>
													</div>
													<div class="col s12 m6 l6">
														<label class="Lato_normal_font label_font">Car Plate No</label>
														<spring:bind path="primaryContact.carNumber">
															<input type="text" name="${status.expression}" value="${status.value}"
																id="${status.expression}" />
														</spring:bind>
													</div>
												</div>
												<div class="row">
													<div class="col s12 m6 l6 input-field edit_role_select">
														<select name="staffRole" id="staffRole">
															<option value="" selected>Select staff role</option>
															<option value="1"
																selected="${(primaryContact.relationType eq '1') ? 'selected' : ''}">Teacher</option>
															<option value="2"
																selected="${(primaryContact.relationType eq '2') ? 'selected' : ''}">Admin</option>
														</select> <label class="Lato_normal_font label_font">Staff Role</label>
													</div>
													<div class="col s12 m6 l6">
														<label class="Lato_normal_font label_font">Home Phone</label>
														<spring:bind path="primaryContact.homePhone">
															<input type="text" name="${status.expression}" value="${status.value}"
																id="${status.expression}" />
														</spring:bind>
													</div>
												</div>
												<div class="row">
													<div class="col s12 m6 l6">
														<c:if test="${ not empty primaryContact.photoUrl }">
															<div>
																<a
																	href="<%=request.getContextPath()%>/cms/contactimages?id=${primaryContact.contactId}"
																	target="_blank">Image</a>
															</div>
														</c:if>
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
												</div>
												<div class="row">
													<div class="col s12 m6 l6">
														<label class="Lato_normal_font label_font">Address 1</label>
														<spring:bind path="primaryContact.homeAddressStreetOne">
															<input type="text" name="${status.expression}" value="${status.value}"
																id="${status.expression}" />
														</spring:bind>
													</div>
													<div class="col s12 m6 l6">
														<label class="Lato_normal_font label_font">Address 2</label>
														<spring:bind path="primaryContact.homeAddressStreetTwo">
															<input type="text" name="${status.expression}" value="${status.value}"
																id="${status.expression}" />
														</spring:bind>
													</div>
												</div>
												<div class="row">
													<div class="col s12 m6 l6">
														<label class="Lato_normal_font label_font">Poscode</label>
														<spring:bind path="primaryContact.homeAddressPostCode">
															<input type="text" name="${status.expression}" value="${status.value}"
																id="${status.expression}" />
														</spring:bind>
													</div>
													<div class="col s12 m6 l6">
														<label class="Lato_normal_font label_font">City</label>
														<spring:bind path="primaryContact.homeAddressCity">
															<input type="text" name="${status.expression}" value="${status.value}"
																id="${status.expression}" />
														</spring:bind>
													</div>
												</div>
												<div class="row">
													<div class="col s12 m6 l6">
														<label class="Lato_normal_font label_font">State</label>
														<spring:bind path="primaryContact.homeAddressState">
															<input type="text" name="${status.expression}" value="${status.value}"
																id="${status.expression}" />
														</spring:bind>
													</div>
													<div class="col s12 m6 l6">
														<label class="Lato_normal_font label_font">Country</label>
														<spring:bind path="primaryContact.homeAddressCountry">
															<input type="text" name="${status.expression}" value="${status.value}"
																id="${status.expression}" />
														</spring:bind>
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
														<label class="Lato_normal_font label_font">Employer</label>
														<spring:bind path="primaryContact.employedBy">
															<input type="text" name="${status.expression}" value="${status.value}"
																id="${status.expression}" />
														</spring:bind>
													</div>
													<div class="col s12 m6 l6">
														<label class="Lato_normal_font label_font">Occupation</label>
														<spring:bind path="primaryContact.occupation">
															<input type="text" name="${status.expression}" value="${status.value}"
																id="${status.expression}" />
														</spring:bind>
													</div>
												</div>
												<div class="row">
													<div class="col s12 m6 l6">
														<label class="Lato_normal_font label_font">Office Phone</label>
														<spring:bind path="primaryContact.officePhone">
															<input type="text" name="${status.expression}" value="${status.value}"
																id="${status.expression}" />
														</spring:bind>

													</div>
													<div class="col s12 m6 l6">
														<label class="Lato_normal_font label_font">Work Hours</label>
														<spring:bind path="primaryContact.workingHours">
															<input type="text" name="${status.expression}" value="${status.value}"
																id="${status.expression}" />
														</spring:bind>
													</div>
												</div>

												<div class="row">
													<div class="col s12 m6 l6">
														<label class="Lato_normal_font label_font">Work Address 1</label>
														<spring:bind path="primaryContact.workAddressStreetOne">
															<input type="text" name="${status.expression}" value="${status.value}"
																id="${status.expression}" />
														</spring:bind>
													</div>
													<div class="col s12 m6 l6">
														<label class="Lato_normal_font label_font">Work Address 2</label>
														<spring:bind path="primaryContact.workAddressStreetTwo">
															<input type="text" name="${status.expression}" value="${status.value}"
																id="${status.expression}" />
														</spring:bind>
													</div>
												</div>
												<div class="row">
													<div class="col s12 m6 l6">
														<label class="Lato_normal_font label_font">Poscode</label>
														<spring:bind path="primaryContact.workAddressPostCode">
															<input type="text" name="${status.expression}" value="${status.value}"
																id="${status.expression}" />
														</spring:bind>

													</div>
													<div class="col s12 m6 l6">
														<label class="Lato_normal_font label_font">City</label>
														<spring:bind path="primaryContact.workAddressCity">
															<input type="text" name="${status.expression}" value="${status.value}"
																id="${status.expression}" />
														</spring:bind>
													</div>
												</div>
												<div class="row">
													<div class="col s12 m6 l6">
														<label class="Lato_normal_font label_font">State</label>
														<spring:bind path="primaryContact.workAddressState">
															<input type="text" name="${status.expression}" value="${status.value}"
																id="${status.expression}" />
														</spring:bind>
													</div>
													<div class="col s12 m6 l6">
														<label class="Lato_normal_font label_font">Country</label>
														<spring:bind path="primaryContact.workAddressCountry">
															<input type="text" name="${status.expression}" value="${status.value}"
																id="${status.expression}" />
														</spring:bind>
													</div>
												</div>
											</div>
										</div>
									</li>
								</ul>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col l1"></div>
						<div class="col s12 m4 l4">
							<a class="waves-effect waves-light blue darken-4 btn center login_button Lato_normal_font"
								onclick="$(this).closest('form').submit();">Submit</a>
						</div>
						<div class="col s12 m4 l4">
							<div class="center">
								<a href="javascript:void(0)" onclick="switchConInfoDiv(2);"
									class="waves-effect waves-light blue darken-4 btn center login_button Lato_normal_font">Cancel</a>

							</div>
						</div>
						<div class="col s12 m4 l4"></div>
					</div>
				</form>
			</div>

		</div>
		<div class="col s12 m4 l1"></div>
		<%-- <div class="col s12 m4 l2 right_column">
				<div class="row">
					<div class="col s12 m12 l12">Recent Items</div>
				</div>
				<%@include file="recent_item.jsp"%>
			</div> --%>
	</div>

	<%@include file="shortcut_div.jsp"%> </main>
	<%@include file="footer.jsp"%>