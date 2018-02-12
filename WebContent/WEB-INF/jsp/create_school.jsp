<%@include file="header.jsp"%>
<%@include file="login_nav.jsp"%>
<script>
function isDeleteMethod(isDelete) {
	var form = document.getElementById('editForm');
    if (isDelete){
        window.location.href="<%=request.getContextPath()%>/cms/school_dashboard";
			return false;
		} else {
			form.submit();
			return true;
		}
	}
</script>
<main>
<form method="post" action="<%=request.getContextPath()%>/cms/createSchool" id="editForm"
	enctype="multipart/form-data">
	<div class="container login_margin_top">
		<div class="row">
			<div class="col s12 m1 l1"></div>
			<div class="col s12 m4 l4">
				<div class="icon_beside_text">
					<i class="medium material-icons icon_beside_text">store</i>
				</div>
				<div class="icon_beside_text">
					<h5 class="Lato_normal_font icon_beside_text">Add School</h5>
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
							<i class="material-icons">store</i>School Information
						</div>
						<div class="collapsible-body">
							<div class="container container_margin_top">
								<div class="row">
									<div class="col s12 m6 l6">
										<!-- <label class="Lato_normal_font label_font">Calendar ID</label> <input type="text"
											name="calendarId" id="calendarId"> -->
										<label for="schoolName" class="Lato_normal_font label_font">School Name</label> <input
											type="text" name="schoolName" id="schoolName">
									</div>
									<div class="col s12 m6 l6">
										<label for="schCompanyNo" class="Lato_normal_font label_font">Company No</label> <input
											type="text" name="schCompanyNo" id="schCompanyNo">
									</div>
								</div>
								<div class="row">
									<div class="col s12 m6 l6">
										<label class="Lato_normal_font label_font">Contact no</label> <input type="text"
											name="contactNumber" id="contactNumber">
									</div>
									<div class="col s12 m6 l6">
										<label class="Lato_normal_font label_font">Fax no</label> <input type="text"
											name="faxNumber" id="faxNumber">
									</div>
								</div>
								<!-- <div class="row">
									<div class="col s12 m6 l6">
										<label class="Lato_normal_font label_font">Bill Threshold Due</label> <input type="text"
											name="billThresholdDue" id="billThresholdDue">
									</div>
									<div class="col s12 m6 l6">
										<label class="Lato_normal_font label_font">Currency</label> <input type="text"
											name="currency" id="currency">
									</div>
								</div> -->
								<div class="row">
									<div class="col s12 m6 l6">
										<label class="Lato_normal_font label_font">Website</label> <input type="text"
											name="website" id="website">
									</div>
									<div class="col s12 m6 l6">
										<div class="file-field input-field sc_reg_logo">
											<div class="btn">
												<span>Logo</span> <input type="file" name="logo" id="logo">
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
							<i class="material-icons">store</i>Address
						</div>
						<div class="collapsible-body">
							<div class="container container_margin_top">
								<div class="row">
									<div class="col s12 m6 l6">
										<label class="Lato_normal_font label_font">Address 1</label> <input type="text"
											name="address" id="address">
									</div>
									<div class="col s12 m6 l6">
										<label class="Lato_normal_font label_font">Address 2</label> <input type="text"
											name="addressTwo" id="addressTwo">
									</div>
								</div>
								<div class="row">
									<div class="col s12 m6 l6">
										<label class="Lato_normal_font label_font">Post Code</label> <input type="text"
											name="postCode" id="postCode">
									</div>
									<div class="col s12 m6 l6">
										<label class="Lato_normal_font label_font">City</label> <input type="text" name="city"
											id="city">
									</div>
								</div>
								<div class="row">
									<div class="col s12 m6 l6">
										<label class="Lato_normal_font label_font">State</label> <input type="text" name="state"
											id="state">
									</div>
									<div class="col s12 m6 l6">
										<label class="Lato_normal_font label_font">Country</label> <input type="text"
											name="country" id="country">
									</div>
								</div>
							</div>
						</div>
					</li>
					<li>
						<div class="collapsible-header">
							<i class="material-icons">store</i>Billing Address
						</div>
						<div class="collapsible-body">
							<div class="container container_margin_top">
								<div class="row">
									<div class="col s12 m6 l6">
										<label class="Lato_normal_font label_font">Billing Address 1</label> <input type="text"
											name="billingAddress" id="billingAddress">
									</div>
									<div class="col s12 m6 l6">
										<label class="Lato_normal_font label_font">Billing Address 2</label> <input type="text"
											name="billingAddressTwo" id="billingAddressTwo">
									</div>
								</div>
								<div class="row">
									<div class="col s12 m6 l6">
										<label class="Lato_normal_font label_font">Post Code</label> <input type="text"
											name="billingAddressPostCode" id="billingAddressPostCode">
									</div>
									<div class="col s12 m6 l6">
										<label class="Lato_normal_font label_font">City</label> <input type="text"
											name="billingAddressCity" id="billingAddressCity">
									</div>
								</div>
								<div class="row">
									<div class="col s12 m6 l6">
										<label class="Lato_normal_font label_font">State</label> <input type="text"
											name="billingAddressState" id="billingAddressState">
									</div>
									<div class="col s12 m6 l6">
										<label class="Lato_normal_font label_font">Country</label> <input type="text"
											name="billingAddressCountry" id="billingAddressCountry">
									</div>
								</div>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</div>

		<div class="row">
			<div class="col s12 m3 l3"></div>
			<div class="col s12 m3 l3">
				<div class="center">
					<a onclick="return isDeleteMethod(false);"
						class="waves-effect waves-light blue darken-4 btn center login_button Lato_normal_font">Submit</a>
				</div>
			</div>
			<div class="col s12 m3 l3">
				<div class="center">
					<a onclick="return isDeleteMethod(true);"
						class="waves-effect waves-light blue darken-4 btn center login_button Lato_normal_font">Cancel</a>
				</div>
			</div>
			<div class="col s12 m3 l3"></div>
		</div>


	</div>
</form>
</main>
<%@include file="footer.jsp"%>