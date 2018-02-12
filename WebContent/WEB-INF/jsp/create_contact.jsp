<%@include file="header.jsp"%>
<script>
function isDeleteMethod(isDelete) {
	var form = document.getElementById('editForm');
    if (isDelete){
        window.location.href="<%=request.getContextPath()%>/cms/list_contact/${id}";
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
	<main> <%@include file="school_main_menu.jsp"%>
	<form method="post" action="<%=request.getContextPath()%>/cms/createContactPost" id="editForm"
		enctype="multipart/form-data">
		<input type="hidden" name="path" id="path" value="${id}">
		<div class="container login_margin_top">
			<div class="row">
				<div class="col s12 m1 l1"></div>
				<div class="col s12 m10 l10">
					<div class="icon_beside_text">
						<i class="medium material-icons icon_beside_text">supervisor_account</i>
					</div>
					<div class="icon_beside_text">
						<h5 class="Lato_normal_font icon_beside_text">New Contact</h5>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col s12 m1 l1"></div>
				<div class="col s12 m10 l10">
					<ul class="collapsible" data-collapsible="accordion">
						<li>
							<div class="collapsible-header">
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
										<div class="col s12 m6 l6">
											<div class="input-field role_select">
												<spring:bind path="primaryContact.relationType">
													<select name="${status.expression}" id="${status.expression}">
														<option value="" disabled selected>Select role</option>
														<option value="1">Father</option>
														<option value="2">Mother</option>
														<option value="3">Guardian</option>
													</select>
												</spring:bind>
												<label class="Lato_normal_font label_font">Role</label>
											</div>
										</div>
										<div class="col s12 m6 l6">
											<div class="input-field role_select">
												<spring:bind path="primaryContact.martialStatus">
													<select name="${status.expression}" id="${status.expression}">
														<option value="" disabled selected>Select status</option>
														<option value="1">Single</option>
														<option value="2">Married</option>
														<option value="3">Separated</option>
														<option value="4">Divorced</option>
														<option value="5">Widowed</option>
													</select>
												</spring:bind>
												<label class="Lato_normal_font label_font">Marital Status</label>
											</div>
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
										<div class="col s12 m6 l6">
											<label class="Lato_normal_font label_font">Home Phone</label>
											<spring:bind path="primaryContact.homePhone">
												<input type="text" name="${status.expression}" value="${status.value}"
													id="${status.expression}" />
											</spring:bind>
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
											<label class="Lato_normal_font label_font">City</label>
											<spring:bind path="primaryContact.homeAddressCity">
												<input type="text" name="${status.expression}" value="${status.value}"
													id="${status.expression}" />
											</spring:bind>
										</div>
										<div class="col s12 m6 l6">
											<label class="Lato_normal_font label_font">Poscode</label>
											<spring:bind path="primaryContact.homeAddressPostCode">
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
									<div class="row">
										<div class="col s12 m6 l6"></div>
										<div class="col s12 m6 l6"></div>
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
										<div class="col s12 m6 l6"><label class="Lato_normal_font label_font">Occupation</label>
						<spring:bind path="primaryContact.occupation">
							<input type="text" name="${status.expression}" value="${status.value}"
								id="${status.expression}" />
						</spring:bind></div>
									</div>
									<div class="row">
										<div class="col s12 m6 l6">
											<label class="Lato_normal_font label_font">Office Phone</label>
											<spring:bind path="primaryContact.officePhone">
												<input type="text" name="${status.expression}" value="${status.value}"
													id="${status.expression}" />
											</spring:bind>
										</div>
										<div class="col s12 m6 l6"><label class="Lato_normal_font label_font">Work Hours</label>
						<spring:bind path="primaryContact.workingHours">
							<input type="text" name="${status.expression}" value="${status.value}"
								id="${status.expression}" />
						</spring:bind></div>
									</div>
									<div class="row">
										<div class="col s12 m6 l6">
											<label class="Lato_normal_font label_font">Work Address 1</label>
											<spring:bind path="primaryContact.workAddressStreetOne">
												<input type="text" name="${status.expression}" value="${status.value}"
													id="${status.expression}" />
											</spring:bind>
										</div>
										<div class="col s12 m6 l6"><label class="Lato_normal_font label_font">Work Address 2</label>
						<spring:bind path="primaryContact.workAddressStreetTwo">
							<input type="text" name="${status.expression}" value="${status.value}"
								id="${status.expression}" />
						</spring:bind></div>
									</div>
									<div class="row">
										<div class="col s12 m6 l6">
											<label class="Lato_normal_font label_font">City</label>
											<spring:bind path="primaryContact.workAddressCity">
												<input type="text" name="${status.expression}" value="${status.value}"
													id="${status.expression}" />
											</spring:bind>
										</div>
										<div class="col s12 m6 l6"><label class="Lato_normal_font label_font">Poscode</label>
						<spring:bind path="primaryContact.workAddressPostCode">
							<input type="text" name="${status.expression}" value="${status.value}"
								id="${status.expression}" />
						</spring:bind></div>
									</div>
									<div class="row">
										<div class="col s12 m6 l6">
											<label class="Lato_normal_font label_font">State</label>
											<spring:bind path="primaryContact.workAddressState">
												<input type="text" name="${status.expression}" value="${status.value}"
													id="${status.expression}" />
											</spring:bind>
										</div>
										<div class="col s12 m6 l6"><label class="Lato_normal_font label_font">Country</label>
						<spring:bind path="primaryContact.workAddressCountry">
							<input type="text" name="${status.expression}" value="${status.value}"
								id="${status.expression}" />
						</spring:bind></div>
									</div>
								</div>
							</div>
						</li>
					</ul>
				</div>
				<div class="col s12 m1 l1"></div>
			</div>
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
			</div>


		</div>
	</form>
	</main>
	<%@include file="footer.jsp"%>