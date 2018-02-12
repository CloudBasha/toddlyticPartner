<div id="enable_billing_div" class="enable_billing_div">
	<div class="row enable_billing_row">
		<div class="col s12 m12 l12">
			<form id="example-form">
				<div>
					<h3>Edition</h3>
					<section>
						<!-- <div class="row">
							<div class="input-field col s12 m6 l6">
								<input placeholder="Bill Plan" id="title" type="text" class="validate"> <label
									for="title">Bill Plan Name</label>
							</div>
							<div class="input-field col s12 m6 l6">
								<input placeholder="Registration" id="registration" type="text" class="validate"> <label
									for="registration">Registration</label>
							</div>
						</div> -->
						<div class="row plan_row">
							<div class="col s12 m3 l2 card center-align center">
								<h5 class="Lato_normal_font">Free</h5>
								<p class="Lato_normal_font">Trans Fee RM 1.00</p>
								<p class="Lato_normal_font">SMS Fee RM 0.50</p>
								<p class="Lato_normal_font">Students: 50</p>
								<p class="center plan_p">
									<a href="javascript:void(0)" class="waves-effect btn">Select</a>
								</p>
							</div>
							<div class="col s12 m3 offset-l1 l2 card center-align center">
								<h5 class="Lato_normal_font">Free</h5>
								<p class="Lato_normal_font">Trans Fee RM 1.00</p>
								<p class="Lato_normal_font">SMS Fee RM 0.50</p>
								<p class="Lato_normal_font">Students: 50</p>
								<p class="center plan_p">
									<a href="javascript:void(0)" class="waves-effect btn">Select</a>
								</p>
							</div>
							<div class="col s12 m3 offset-l1 l2 card center-align center">
								<h5 class="Lato_normal_font">Free</h5>
								<p class="Lato_normal_font">Trans Fee RM 1.00</p>
								<p class="Lato_normal_font">SMS Fee RM 0.50</p>
								<p class="Lato_normal_font">Students: 50</p>
								<p class="center plan_p">
									<a href="javascript:void(0)" class="waves-effect btn">Select</a>
								</p>
							</div>
							<div class="col s12 m3 offset-l1 l2 card center-align center">
								<h5 class="Lato_normal_font">Free</h5>
								<p class="Lato_normal_font">Trans Fee RM 1.00</p>
								<p class="Lato_normal_font">SMS Fee RM 0.50</p>
								<p class="Lato_normal_font">Students: 50</p>
								<p class="center plan_p">
									<a href="javascript:void(0)" class="waves-effect btn">Select</a>
								</p>
							</div>
						</div>
						<div class="row">
							<div class="col s12 m9 l9">
								<span class="Lato_normal_font"># for First Admin Only</span>
							</div>
							<div class="col s12 m3 l3 input-field">
								<input type="text" class="validate" id="discountCode" /> <label for="discountCode">Discount
									Code</label>
							</div>
						</div>
					</section>
					<h3>Billing Information</h3>
					<section>
						<ul class="collapsible" data-collapsible="expandable">
							<li>
								<div class="collapsible-header active">
									<i class="material-icons">filter_drama</i>School Info
								</div>
								<div class="collapsible-body">
									<div class="container">
										<div class="row form_view_row">
											<div class="col s12 offset-m1 m5 offset-l1 l5 input-field">
												<input type="text" class="validate" id="schoolName" /> <label for="schoolName">School
													Name</label>
											</div>
											<div class="col s12 m5 l5 input-field">
												<input type="text" class="validate" id="billingPeriod" /> <label for="billingPeriod">Billing
													Period</label>
											</div>
										</div>
										<div class="row form_view_row">
											<div class="col s12 offset-m1 m5 offset-l1 l5 input-field">
												<input type="text" class="validate" id="companyName" /> <label for="companyName">Company
													Name</label>
											</div>
											<div class="col s12 m5 l5 input-field">
												<input type="text" class="validate" id="companyNo" /> <label for="companyNo">Company
													No</label>
											</div>
										</div>
										<div class="row form_view_row">
											<div class="col s12 offset-m1 m5 offset-l1 l5 input-field">
												<input type="text" class="validate" id="adminContact" /> <label for="adminContact">Admin
													Contact</label>
											</div>
											<div class="col s12 m5 l5 input-field">
												<input type="text" class="validate" id="billingContact" /> <label for="billingContact">Billing
													Contact</label>
											</div>
										</div>
										<div class="row">
											<div class="col s6 offset-m1 m5 offset-l1 l5 ">Payment Method:</div>
											<div class="col s6 m6 l6">
												<input name="pm_group" type="radio" id="onlinePay" checked="checked"/> <label for="onlinePay">Online</label>
												<input name="pm_group" type="radio" id="directPay" /> <label for="directPay">Direct</label>
											</div>
										</div>
										<div class="row">
											<div class="col s6 offset-m1 m5 offset-l1 l5 ">Invoicing:</div>
											<div class="col s1 m1 l1">
												<input type="number" class="input_count" />
											</div>
											<div class="col s5 m5 l5">day of every month</div>
										</div>
										<div class="row">
											<div class="col s6 offset-m1 m5 offset-l1 l5 ">Collection due after:</div>
											<div class="col s1 m1 l1">
												<input type="number" class="input_count" />
											</div>
											<div class="col s5 m5 l5">days of Invoice</div>
										</div>
									</div>
								</div>
							</li>
							<li>
								<div class="collapsible-header active">
									<i class="material-icons">place</i>Program
								</div>
								<div class="collapsible-body">
									<div class="table_container">
										<div class="row">
											<div class="col s12 m9 l9">
												<table class="bordered highlight">
													<tr>
														<th>Items</th>
														<th>Type</th>
														<th>Fee</th>
														<th>Due</th>
														<th>Option</th>
													</tr>
													<tr>
														<td>Registration fee</td>
														<td>One off</td>
														<td>RM 850.00</td>
														<td>End of month</td>
														<td>Required</td>
													</tr>
												</table>
											</div>
											<div class="col s12 m3 l3">
												<a href=""
													class="waves-effect waves-teal btn categories_selection modal-trigger add_program_btn"><i
													class="material-icons left">add</i>Add Program</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							<li>
								<div class="collapsible-header active">
									<i class="material-icons">whatshot</i>Activity
								</div>
								<div class="collapsible-body">
									<div class="table_container">
										<div class="row">
											<div class="col s12 m9 l9">
												<table class="bordered highlight">
													<tr>
														<th>Activity Name</th>
														<th>Fee</th>
														<th>Unit</th>
														<th>Quantity</th>
														<th>Start</th>
														<th>End</th>
													</tr>
													<tr>
														<td>Transport</td>
														<td>10</td>
														<td>Pick up</td>
														<td>1</td>
														<td>08:00am</td>
														<td>13:00pm</td>
													</tr>
												</table>
											</div>
											<div class="col s12 m3 l3">
												<a href=""
													class="waves-effect waves-teal btn categories_selection modal-trigger add_program_btn"><i
													class="material-icons left">add</i>Add Activity</a>
											</div>
										</div>
									</div>
								</div>
							</li>
							<li>
								<div class="collapsible-header active">
									<i class="material-icons">whatshot</i>Adhoc Packages
								</div>
								<div class="collapsible-body">
									<div class="table_container">
										<div class="row">
											<div class="col s12 m9 l9">
												<table class="bordered highlight">
													<tr>
														<th>Package</th>
														<th>Fee</th>
														<th>Unit</th>
														<th>Quantity</th>
														<th>Payment</th>
													</tr>
													<tr>
														<td>Birthday normal</td>
														<td>100</td>
														<td>Per day</td>
														<td>1</td>
														<td>30 days before</td>
													</tr>
												</table>
											</div>
											<div class="col s12 m3 l3">
												<a href=""
													class="waves-effect waves-teal btn categories_selection modal-trigger add_program_btn"><i
													class="material-icons left">add</i>Add Package</a>
											</div>
										</div>
									</div>
								</div>
							</li>
						</ul>
					</section>
					<h3>Contract</h3>
					<section>
						<div class="container">
							<div class="row form_view_row">
								<div class="col s12 m12 l12">
									<h5 class="Lato_normal_font">Payable to Cloud Basha Sdn Bhd (117373-P)</h5>
								</div>
							</div>
							<div class="row form_view_row">
								<div class="col s12 m12 l12">
									<h5 class="Lato_normal_font">Terms: 30 days of invoice</h5>
								</div>
							</div>
							<div class="row form_view_row">
								<div class="col s12 m6 l6 input-field">
									<input type="text" class="validate" id="address" /> <label for="address">Address</label>
								</div>
								<div class="col s12 m6 l6 input-field">
									<p class="Lato_normal_font acc_details">Account Details</p>
									<p class="Lato_normal_font">
										MBB<br />514123123123<br />Cloud Basha Sdn Bhd
									</p>
								</div>
							</div>
							<div class="row form_view_row">
								<div class="col s12 m6 l6 input-field">
									<input type="text" class="validate" id="conPerson" /> <label for="conPerson">Contact
										Person</label>
								</div>
							</div>
							<div class="row form_view_row">
								<div class="col s12 m6 l6 input-field">
									<input type="text" class="validate" id="conPhone" /> <label for="conPhone">Contact
										Phone</label>
								</div>
								<div class="col s12 m6 l6 input-field">
									<input type="text" class="validate" id="conFax" /> <label for="conFax">Fax</label>
								</div>
							</div>
							<div class="row">
								<div class="col s12 m6 l6 input-field">
									<input type="text" class="validate" id="conEmail" /> <label for="conEmail">Contact
										Email</label>
								</div>
								<div class="col s12 m6 l6 input-field">
									<input type="text" class="validate" id="conWhats" /> <label for="conWhats">Whatsapp</label>
								</div>
							</div>
							<div class="row">
								<div class="col s12 m12 l12">
									<h5 class="Lato_normal_font">Q Dees Subang Sdn Bhd</h5>
								</div>
							</div>
							<div class="row form_view_row input-field">
								<div class="col s12 m6 l6">
									<input type="text" class="validate" id="accNo" /> <label for="accNo">Account No</label>
								</div>
								<div class="col s12 m6 l6">
									<input type="text" class="validate" id="accName" /> <label for="accName">Account
										Name</label>
								</div>
							</div>
							<div class="row form_view_row input-field">
								<div class="col s12 m6 l6">
									<input type="text" class="validate" id="bankName" /> <label for="bankName">Name of
										Bank</label>
								</div>
								<div class="col s12 m6 l6">
									<input type="text" class="validate" id="branch" /> <label for="branch">Branch</label>
								</div>
							</div>
							<div class="row form_view_row input-field">
								<div class="col s12 m6 l6">
									<input type="text" class="validate" id="swiftCode" /> <label for="swiftCode">Swift
										Code</label>
								</div>
							</div>
						</div>
					</section>
					<h3>Summary</h3>
					<section>
						<div class="container">
							<div class="row form_view_row">
								<div class="col s12 m6 l6 input-field">
									<input type="text" class="validate" id="rev_planName" value="Plan B" disabled /> <label
										for="rev_planName">Bill Plan Name</label>
								</div>
								<div class="col s12 m6 l6 input-field">
									<input type="text" class="validate" id="rev_planName" value="Enrolment A" disabled /> <label
										for="rev_planName">Valid for registration</label>
								</div>
							</div>
							<div class="row form_view_row">
								<div class="col s12 m12 l12">
									<h6 class="Lato_normal_font">Toddlytic Plan: Caring Edition</h6>
								</div>
							</div>
							<div class="row form_view_row">
								<div class="col s12 m6 l6 input-field">
									<input type="text" class="validate" id="rev_txFee" value="RM1.00/transaction" disabled />
									<label for="rev_txFee">Transaction Fee</label>
								</div>
								<div class="col s12 m6 l6 input-field">
									<input type="text" class="validate" id="rev_smsFee" value="RM0.50/sms" disabled /> <label
										for="rev_smsFee">SMS Alert Fee</label>
								</div>
							</div>
							<div class="row form_view_row">
								<div class="col s12 m6 l6 input-field">
									<input type="text" class="validate" id="rev_Fps" value="RM26.50" disabled /> <label
										for="rev_Fps">Fee per Student</label>
								</div>
								<div class="col s12 m6 l6 input-field">
									<input type="text" class="validate" id="rev_Ts" value="50" disabled /> <label for="rev_Ts">Total
										Students</label>
								</div>
							</div>
							<div class="row form_view_row">
								<div class="col s12 m12 l12">
									<h6 class="Lato_normal_font">School Info</h6>
								</div>
							</div>
							<div class="row form_view_row">
								<div class="col s12 m6 l6 input-field">
									<input type="text" class="validate" id="rev_scName" value="Q Dees Bangsar" disabled /> <label
										for="rev_scName">School Name</label>
								</div>
								<div class="col s12 m6 l6 input-field">
									<input type="text" class="validate" id="rev_cNo" value="A12345" disabled /> <label
										for="rev_cNo">Company No</label>
								</div>
							</div>
							<div class="row form_view_row">
								<div class="col s12 m6 l6 input-field">
									<input type="text" class="validate" id="rev_bp" value=" " disabled /> <label for="rev_bp">Billing
										Period</label>
								</div>
								<div class="col s12 m6 l6 input-field">
									<input type="text" class="validate" id="rev_Ac" value="0123456789" disabled /> <label
										for="rev_Ac">Admin Contact</label>
								</div>
							</div>
							<div class="row form_view_row">
								<div class="col s12 m6 l6 input-field">
									<input type="text" class="validate" id="rev_Bc" value="0123456789" disabled /> <label
										for="rev_Bc">Billing Contact</label>
								</div>
								<div class="col s12 m6 l6 input-field ">
									<div class="row">
										<div class="col s6 offset-m1 m5 offset-l1 l5 rev_payment">Payment Method:</div>
										<div class="col s6 m6 l6">
											<input name="group1" type="radio" id="rev_onlinePay" checked disabled /> <label
												for="rev_onlinePay">Online</label> <input name="group1" type="radio" id="rev_directPay"
												disabled /> <label for="rev_directPay">Direct</label>
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col s12 m6 l6">
									<p class="Lato_normal_font">Invoicing 20th day of every month</p>
								</div>
								<div class="col s12 m6 l6">
									<p class="Lato_normal_font">Collection due 7 days after invoicing</p>
								</div>
							</div>
							<div class="row form_view_row">
								<div class="col s12 m12 l12">
									<h5 class="Lato_normal_font">Program</h5>
								</div>
							</div>
							<div class="row">
								<div class="col s12 m12 l12 input-field">
									<table class="bordered highlight">
										<tr>
											<td>Registration fee</td>
											<td>One off</td>
											<td>RM 850.00</td>
											<td>End of month</td>
											<td>Required</td>
										</tr>
									</table>
								</div>
							</div>
							<div class="row form_view_row">
								<div class="col s12 m12 l12">
									<h5 class="Lato_normal_font">Activity</h5>
								</div>
							</div>
							<div class="row">
								<table class="bordered highlight">
									<tr>
										<td>Transport</td>
										<td>10</td>
										<td>Pick up</td>
										<td>1</td>
										<td>08:00am</td>
										<td>13:00pm</td>
									</tr>
								</table>
							</div>
							<div class="row form_view_row">
								<div class="col s12 m12 l12">
									<h5 class="Lato_normal_font">Adhoc Packages</h5>
								</div>
							</div>
							<div class="row">
								<table class="bordered highlight">
									<tr>
										<td>Birthday normal</td>
										<td>100</td>
										<td>Per day</td>
										<td>1</td>
										<td>30 days before</td>
									</tr>
								</table>
							</div>
							<div class="row form_view_row">
								<div class="col s12 m4 l4">
									<p class="Lato_normal_font">Terms pay to Cloud Basha</p>
								</div>
								<div class="col s12 m4 l4 right-align rev_payment">
									<input type="checkbox" class="filled-in" id="tncCheckbox" /> <label for="tncCheckbox">Terms
										and Conditions</label>
								</div>
								<!-- <div class="col s12 m4 l4">
									<a href="javascript:void(0)" class="waves-effect btn">I agree</a>
								</div> -->
							</div>
						</div>
					</section>
				</div>
			</form>
		</div>
	</div>
</div>

<script type="text/javascript">
	/* var form = $("#example-advanced-form").show();

	form.steps({
		headerTag : "h3",
		bodyTag : "fieldset",
		transitionEffect : "slideLeft",
		onStepChanging : function(event, currentIndex, newIndex) {
			// Allways allow previous action even if the current form is not valid!
			if (currentIndex > newIndex) {
				return true;
			}
			// Forbid next action on "Warning" step if the user is to young
			if (newIndex === 3 && Number($("#age-2").val()) < 18) {
				return false;
			}
			// Needed in some cases if the user went back (clean up)
			if (currentIndex < newIndex) {
				// To remove error styles
				form.find(".body:eq(" + newIndex + ") label.error").remove();
				form.find(".body:eq(" + newIndex + ") .error").removeClass("error");
			}
			form.validate().settings.ignore = ":disabled,:hidden";
			return form.valid();
		},
		onStepChanged : function(event, currentIndex, priorIndex) {
			// Used to skip the "Warning" step if the user is old enough.
			if (currentIndex === 2 && Number($("#age-2").val()) >= 18) {
				form.steps("next");
			}
			// Used to skip the "Warning" step if the user is old enough and wants to the previous step.
			if (currentIndex === 2 && priorIndex === 3) {
				form.steps("previous");
			}
		},
		onFinishing : function(event, currentIndex) {
			form.validate().settings.ignore = ":disabled";
			return form.valid();
		},
		onFinished : function(event, currentIndex) {
			alert("Submitted!");
		}
	}).validate({
		errorPlacement : function errorPlacement(error, element) {
			element.before(error);
		},
		rules : {
			confirm : {
				equalTo : "#password-2"
			}
		}
	}); */

	$('.datepicker').pickadate({
		min : new Date(),
		selectMonths : true, // Creates a dropdown to control month
		selectYears : 15, // Creates a dropdown of 15 years to control year
		firstDay : 1
	});

	/* var picker = $('#beginDate').pickadate('picker');
	picker.set('select', new Date());
	var picker = $('#endDate').pickadate('picker');
	picker.set('select', new Date()); */

	$('select').material_select();

	var form = $("#example-form");
	form.children("div").steps({
		headerTag : "h3",
		bodyTag : "section",
		transitionEffect : "slideLeft",

		/* Labels */
		labels : {
			cancel : "Cancel?",
			current : "current step:",
			pagination : "Pagination",
			finish : "I Agree",
			next : "Next >",
			previous : "< Previous",
			loading : "Loading ..."
		},

		onStepChanging : function(event, currentIndex, newIndex) {

			return true;
		},
		onFinishing : function(event, currentIndex) {

			return true;
		},
		onFinished : function(event, currentIndex) {
			alert("Submitted!");
		}
	});
</script>