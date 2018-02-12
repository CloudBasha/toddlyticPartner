<div id="school_home_div" class="school_home_div" ng-controller="schoolController" ng-cloak>
	<div class="row">
		<div class="col s12 m9 l9">
			<ul class="collapsible" data-collapsible="accordion">
				<li ng-repeat="school in schools track by $index">
					<div id="schoolCollapse_{{$index}}" class="collapsible-header">
						<i class="material-icons">filter_drama</i>{{school.schoolName}}
					</div>
					<div class="collapsible-body">
						<div class="schoolInfoDiv" id="schoolInfoDiv">
							<div class="row">
								<div class="col s12 m7 l8">
									<div class="row form_view_row">
										<div class="col s6 m4 l4 form_view_info_label">
											<label class="Lato_normal_font label_font">Company
												Name:</label>
										</div>
										<div class="col s6 m8 l8">
											<input class="form_view_info_input Lato_normal_font" disabled value="{{school.companyName}}">
										</div>
									</div>
									<div class="row form_view_row">
										<div class="col s6 m4 l4 form_view_info_label">
											<label class="Lato_normal_font label_font">Company
												No:</label>
										</div>
										<div class="col s6 m8 l8">
											<input class="form_view_info_input Lato_normal_font" disabled value="{{school.companyNo}}">
										</div>
									</div>
									<div class="row form_view_row">
										<div class="col s6 m4 l4 form_view_info_label">
											<label class="Lato_normal_font label_font">Address:</label>
										</div>
										<div class="col s6 m8 l8">
											 <textarea class="materialize-textarea Lato_normal_font form_view_info_input" disabled>{{school.contactStreetAddressOne}} {{ school.contactStreetAddressTwo}} {{school.contactAddressPostCode}} {{school.contactAddressCity}} {{school.contactAddressState}} {{school.contactAddressCountry}}</textarea>
										</div>
									</div>
									<div class="row form_view_row">
										<div class="col s6 m4 l4 form_view_info_label">
											<label class="Lato_normal_font label_font">Phone:</label>
										</div>
										<div class="col s6 m8 l8">
											<input class="form_view_info_input Lato_normal_font" disabled
												value="{{school.contactNumber}}">
										</div>
									</div>
									<div class="row form_view_row">
										<div class="col s6 m4 l4 form_view_info_label">
											<label class="Lato_normal_font label_font">Email:</label>
										</div>
										<div class="col s6 m8 l8">
											<input class="form_view_info_input Lato_normal_font" disabled
												value="{{school.email}}">
										</div>
									</div>
								</div>
								<div class="col s12 m5 l4 center">
									<img src="<%=request.getContextPath()%>/images/default_img.png"
										width="100%" />
								</div>
							</div>
							<div class="row">
								<div class="col s12 m12 l12">
									<h5 class="Lato_normal_font">Billing Contact</h5>
								</div>
							</div>
							<div class="row">
								<div class="col s12 m5 l5">
									<div class="row">
										<div class="col s6 m5 l5 form_view_info_label">
											<label class="Lato_normal_font label_font">Contact
												Name:</label>
										</div>
										<div class="col s6 m7 l7">
											<input class="form_view_info_input Lato_normal_font" disabled
												value="{{school.billingContactName}}">
										</div>
									</div>
								</div>
								<div class="col s12 m5 l5">
									<div class="row">
										<div class="col s6 m5 l5 form_view_info_label">
											<label class="Lato_normal_font label_font">Contact
												No:</label>
										</div>
										<div class="col s6 m7 l7">
											<input class="form_view_info_input Lato_normal_font" disabled
												value="{{school.billingContactNumber}}">
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col s12 m12 l12">
									<h5 class="Lato_normal_font">Administrative Contact</h5>
								</div>
							</div>
							<div class="row">
								<div class="col s12 m5 l5">
									<div class="row">
										<div class="col s6 m5 l5 form_view_info_label">
											<label class="Lato_normal_font label_font">Contact
												Name:</label>
										</div>
										<div class="col s6 m7 l7">
											<input class="form_view_info_input Lato_normal_font" disabled
												value="{{school.adminContactName}}">
										</div>
									</div>
								</div>
								<div class="col s12 m5 l5">
									<div class="row">
										<div class="col s6 m5 l5 form_view_info_label">
											<label class="Lato_normal_font label_font">Contact
												No:</label>
										</div>
										<div class="col s6 m7 l7">
											<input class="form_view_info_input Lato_normal_font" disabled
												value="{{school.adminContactNumber}}">
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="container">
									<div class="row">
										<div class="col s12 m3 l3">
											<span class="Lato_bold_font">Total</span>
										</div>
										<div class="col s12 m2 l2">
											<span class="Lato_bold_font">Admin</span>
										</div>
										<div class="col s12 m2 l2">
											<span class="Lato_bold_font">3</span>
										</div>
										<div class="col s12 m2 l2">
											<span class="Lato_bold_font">Parents</span>
										</div>
										<div class="col s12 m2 l2">
											<span class="Lato_bold_font">35</span>
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="container">
									<div class="row">
										<div class="col s12 m3 l3">
											<span class="Lato_bold_font">Total</span>
										</div>
										<div class="col s12 m2 l2">
											<span class="Lato_bold_font">Staff</span>
										</div>
										<div class="col s12 m2 l2">
											<span class="Lato_bold_font">7</span>
										</div>
										<div class="col s12 m2 l2">
											<span class="Lato_bold_font">Students</span>
										</div>
										<div class="col s12 m2 l2">
											<span class="Lato_bold_font">21</span>
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="container">
									<div class="row">
										<div class="col s12 m3 l3">
											<span class="Lato_bold_font">Total</span>
										</div>
										<div class="col s12 m2 l2">
											<span class="Lato_bold_font">Users</span>
										</div>
										<div class="col s12 m2 l2">
											<span class="Lato_bold_font">10</span>
										</div>
										<div class="col s12 m2 l2">
											<span class="Lato_bold_font">Others</span>
										</div>
										<div class="col s12 m2 l2">
											<span class="Lato_bold_font">16</span>
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col s12 m12 l12 right-align">
									<a class="waves-effect btn modal-trigger" ng-click="editSchool(school)">Edit</a>
									<a class="waves-effect btn modal-trigger" ng-click="showDeleteSchoolConfirm(school)">Delete</a>
								</div>
							</div>
							
						</div>
					</div>
				</li>
			</ul>
		</div>
		<div class="col s12 m3 l3">
			<div class="row sc_prog_right_options">
				<div class="col s12 m12 l12">
					<a href="#createSchoolModal"
						class="waves-effect waves-teal btn categories_selection modal-trigger"><i
						class="material-icons left">add</i>School</a>
				</div>
			</div>
			<div class="row">
				<div class="col s12 m12 l12">
					<a href="#reqMaintenanceModal"
						class="waves-effect waves-teal btn categories_selection modal-trigger"><i
						class="material-icons left">add</i>Maintenance</a>
				</div>
			</div>
			<div class="row ">
				<div class="col s12 m12 l12">
					<a href="#reqPurchasingModal"
						class="waves-effect waves-teal btn categories_selection modal-trigger"><i
						class="material-icons left">add</i>Purchasing</a>
				</div>
			</div>
			<div class="row ">
				<div class="col s12 m12 l12">
					<a href="#schoolHolidayModal"
						class="waves-effect waves-teal btn categories_selection modal-trigger"><i
						class="material-icons left">add</i>School Holiday</a>
				</div>
			</div>
			<div class="row ">
				<div class="col s12 m12 l12">
					<a href="#adhocPackageModal"
						class="waves-effect waves-teal btn categories_selection modal-trigger"><i
						class="material-icons left">add</i>Adhoc Packages</a>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal modal-fixed-footer" id="editSchoolModal">
		<form ng-submit="submitEditSchool()" id="editSchoolForm" novalidate>
			<div class="modal-content">
				<div class="row">
					<div class="col s12 offset-m3 m6 offset-l4 l4 center">
						<img
							src="<%=request.getContextPath()%>/images/default_img.png"
							width="100%" />
					</div>
				</div>
				<div class="row">
					<div class="col s12 m12 l12">
						<div class="row form_view_row">
							<div class="col s6 m2 l2 form_view_info_label">
								<label class="Lato_normal_font label_font">Company
									Name:</label>
							</div>
							<div class="col s6 m4 l4">
								<input class="Lato_normal_font" type="text" name="companyName" empty-input ng-model="e_schoolObj.companyName">
							</div>
							<div class="col s6 m2 l2 form_view_info_label">
								<label class="Lato_normal_font label_font">Company
									No:</label>
							</div>
							<div class="col s6 m4 l4">
								<input class="Lato_normal_font" type="text" name="companyNo" empty-input ng-model="e_schoolObj.companyNo">
							</div>
						</div>
						<div class="row form_view_row">
							<div class="col s6 m2 l2 form_view_info_label">
								<label class="Lato_normal_font label_font">Address
									1:</label>
							</div>
							<div class="col s6 m4 l4">
								<input class="Lato_normal_font"
									name="contactStreetAddressOne" type="text" empty-input ng-model="e_schoolObj.contactStreetAddressOne">
							</div>
							<div class="col s6 m2 l2 form_view_info_label">
								<label class="Lato_normal_font label_font">Address
									2:</label>
							</div>
							<div class="col s6 m4 l4">
								<input class="Lato_normal_font"
									name="contactStreetAddressTwo" type="text" empty-input ng-model="e_schoolObj.contactStreetAddressTwo">
							</div>
						</div>
						<div class="row form_view_row">
							<div class="col s6 m2 l2 form_view_info_label">
								<label class="Lato_normal_font label_font">City:</label>
							</div>
							<div class="col s6 m4 l4">
								<input class="Lato_normal_font" type="text" name="contactAddressCity" empty-input ng-model="e_schoolObj.contactAddressCity">
							</div>
							<div class="col s6 m2 l2 form_view_info_label">
								<label class="Lato_normal_font label_font">PosCode:</label>
							</div>
							<div class="col s6 m4 l4">
								<input class="Lato_normal_font"
									name="contactAddressPostCode" type="text" empty-input ng-model="e_schoolObj.contactAddressPostCode">
							</div>
						</div>
						<div class="row form_view_row">
							<div class="col s6 m2 l2 form_view_info_label">
								<label class="Lato_normal_font label_font">State:</label>
							</div>
							<div class="col s6 m4 l4">
								<input class="Lato_normal_font" name="contactAddressState" type="text" empty-input ng-model="e_schoolObj.contactAddressState">
							</div>
							<div class="col s6 m2 l2 form_view_info_label">
								<label class="Lato_normal_font label_font">Country:</label>
							</div>
							<div class="col s6 m4 l4">
								<input class="Lato_normal_font" type="text" name="contactAddressCountry" empty-input ng-model="e_schoolObj.contactAddressCountry">
							</div>
						</div>
						<div class="row form_view_row">
							<div class="col s6 m2 l2 form_view_info_label">
								<label class="Lato_normal_font label_font">Phone:</label>
							</div>
							<div class="col s6 m4 l4">
								<input class="Lato_normal_font" type="number" name="contactNumber" empty-input ng-model="e_schoolObj.contactNumber">
							</div>
							<div class="col s6 m2 l2 form_view_info_label">
								<label class="Lato_normal_font label_font">Email:</label>
							</div>
							<div class="col s6 m4 l4">
								<input class="Lato_normal_font" type="text" name="email" empty-input ng-model="e_schoolObj.email">
							</div>
						</div>
					</div>
		
				</div>
				<div class="row">
					<div class="col s12 m12 l12">
						<h5 class="Lato_normal_font">Billing Contact</h5>
					</div>
				</div>
				<div class="row">
					<div class="col s12 m12 l12">
						<div class="row">
							<div class="col s6 m2 l2 form_view_info_label">
								<label class="Lato_normal_font label_font">Contact
									Name:</label>
							</div>
							<div class="col s6 m4 l4">
								<input class="Lato_normal_font" name="billingContactName" type="text" empty-input ng-model="e_schoolObj.billingContactName">
							</div>
							<div class="col s6 m2 l2 form_view_info_label">
								<label class="Lato_normal_font label_font">Contact
									No:</label>
							</div>
							<div class="col s6 m4 l4">
								<input class="Lato_normal_font" type="number" name="billingContactNumber" empty-input ng-model="e_schoolObj.billingContactNumber">
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col s12 m12 l12">
						<h5 class="Lato_normal_font">Administrative Contact</h5>
					</div>
				</div>
				<div class="row">
					<div class="col s12 m12 l12">
						<div class="row">
							<div class="col s6 m2 l2 form_view_info_label">
								<label class="Lato_normal_font label_font">Contact
									Name:</label>
							</div>
							<div class="col s6 m4 l4">
								<input class="Lato_normal_font" type="text" name="adminContactName" empty-input ng-model="e_schoolObj.adminContactName">
							</div>
							<div class="col s6 m2 l2 form_view_info_label">
								<label class="Lato_normal_font label_font">Contact
									No:</label>
							</div>
							<div class="col s6 m4 l4">
								<input class="Lato_normal_font" type="number" name="adminContactNumber" empty-input ng-model="e_schoolObj.adminContactNumber">
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<a href="#!"
					class=" modal-action modal-close waves-effect waves-green btn-flat">Cancel
				</a>
				<button
					class="btn-flat modal-action modal-close waves-effect waves-light" type="submit">Update
				</button>
			</div>
		</form>
	</div>
	
	<div id="createSchoolModal" class="modal modal-fixed-footer createSchoolModal">
		<form ng-submit="createSchool()" id="newSchoolForm">
			<div class="modal-content">
				<div class="row">
					<h5 class="Lato_normal_font">New School</h5>
				</div>
				<div class="row">
					<div class="col s12 m12 l12 input-field">
						<input type="text" class="validate" id="newSchoolName" ng-model="c_schoolObj.schoolName"/>
						<label for="newSchoolName">Name</label>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<a href="#!"
					class=" modal-action modal-close waves-effect waves-green btn-flat">Cancel</a>
				<button
					class="btn-flat modal-action modal-close waves-effect waves-light" type="submit">Create
				</button>
			</div>
		</form>
	</div>
	
	<div id="deleteSchoolConfirmModal" class="modal modal-fixed-footer deleteSchoolModal">
		<div class="modal-content">
			Are you sure you want to delete <b>{{deleteSchoolName}}</b>?
		</div>
		<div class="modal-footer">
			<a href="#!"
				class=" modal-action modal-close waves-effect waves-green btn-flat">Cancel</a>
			<button
				class="btn-flat modal-action modal-close waves-effect waves-light" ng-click="deleteSchool()">Delete
			</button>
		</div>
	</div>
	
</div>

<%-- <div id="editSchoolModal" class="modal modal-fixed-footer createSchoolModal">
	<%
		String editAction = request.getContextPath() + "/updateSchool";
	%>
	<form:form commandName="editSchool" method="post" action="<%=editAction%>" id="editSchoolForm">
		<div class="modal-content">
			<div class="row">
				<div class="col s12 m6 l6 input-field">
					<input type="text" value="" id="e_sc_name" /> <label for="e_sc_name">School Name</label>
				</div>
			</div>
		</div>
		<div class="modal-footer">
			<a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Cancel</a>
			<!-- <a
				href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat"
				onclick="return submitSchoolForm();">Create</a> -->
			<button class="btn-flat modal-action modal-close waves-effect waves-light"
				onclick="return editScSubmit();" name="action">Update</button>
		</div>
	</form:form>
</div>
 --%>

<script type="text/javascript">
	function swapSchoolViewEdit(sce){
		switch (sce){
		case 0:
			document.getElementById('schoolInfoDiv').style.display = 'block';
			document.getElementById('editSchoolDiv').style.display = 'none';
			break;
		case 1:
			document.getElementById('schoolInfoDiv').style.display = 'none';
			document.getElementById('editSchoolDiv').style.display = 'block';
			break;
		}
	}
</script>


<script type="text/javascript">

<%-- function sub(){
	var form = document.getElementById('newSchoolForm');
	var action = form.getAttribute("action");
	action = "<%=request.getContextPath()%>/createSchool";
    //form.setAttribute("action", action);
    form.submit(); 
}

function editScSubmit(){
	var form = document.getElementById('editSchoolForm');
    form.submit(); 
} --%>

if("${status}" != ''){
	Materialize.toast("${status}", 4000);
} else {
	//Materialize.toast("Nothing comes", 1000);
}

<%-- function submitSchoolForm() {
	$("#newSchoolForm").submit(function(e) {
		console.log('Ajax triggered');
		$.ajax({
			url : '<%=request.getContextPath()%>/createSchool',
				type : 'post',
				data : $("#newSchoolForm").serialize(),
				success : function(data) {
					alert("${status}");
					console.log(data);
					Materialize.toast('New school created!', 4000);
				},
				fail : function() {
					alert("Fail");
					console.log("ajax fail");
				}
			})
		});
	} --%>
</script>

<div id="reqMaintenanceModal"
	class="modal modal-fixed-footer reqMaintenanceModal">
	<div class="modal-content">
		<div class="row form_view_row">
			<h5 class="Lato_normal_font">Request Maintenance</h5>
		</div>
		<div class="row form_view_row">
			<div class="col s12 m12 l12 input-field">
				<input type="date" class="datepicker" id="rmDue" /> <label
					for="rmDue">Due</label>
			</div>
		</div>
		<div class="row form_view_row">
			<div class="col s12 m12 l12 input-field">
				<textarea id="rmDesc" class="materialize-textarea"></textarea>
				<label for="rmDesc">Description</label>
			</div>
		</div>
		<div class="row form_view_row">
			<div class="col s12 m8 l8 input-field">
				<select>
					<option value="" disabled selected>Select Type</option>
					<option value="1">Type 1</option>
					<option value="2">Type 2</option>
					<option value="3">Type 3</option>
				</select> <label>Type</label>
			</div>
			<div class="col s12 m4 l4 input-field">
				<select>
					<option value="" disabled selected>Select Quantity</option>
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
				</select> <label>Quantity</label>
			</div>
		</div>
		<div class="row form_view_row">
			<div class="col s3 m3 l3 rm_importance">
				<span class="Lato_normal_font">Importance:</span>
			</div>
			<div class="col s3 m3 l3 input-field">
				<input name="group1" type="radio" id="lowRadio" checked /> <label
					for="lowRadio">Low</label>
			</div>
			<div class="col s3 m3 l3 input-field">
				<input name="group1" type="radio" id="highRadio" /> <label
					for="highRadio">High</label>
			</div>
			<div class="col s3 m3 l3 input-field">
				<input name="group1" type="radio" id="criticalRadio" /> <label
					for="criticalRadio">Critical</label>
			</div>
		</div>
		<div class="row form_view_row">
			<div class="col s3 m3 l3 rm_importance">
				<span class="Lato_normal_font">Status</span>
			</div>
			<div class="col s3 m3 l3 input-field">
				<input name="group1" type="checkbox" id="status" /> <label
					for="status">Closed</label>
			</div>
		</div>
	</div>
	<div class="modal-footer">
		<a href="#!"
			class=" modal-action modal-close waves-effect waves-green btn-flat">Cancel</a>
		<a href="#!"
			class=" modal-action modal-close waves-effect waves-green btn-flat">Create</a>
	</div>
</div>

<div id="reqPurchasingModal"
	class="modal modal-fixed-footer reqPurchasingModal">
	<div class="modal-content">
		<div class="row form_view_row">
			<h5 class="Lato_normal_font">Request Purchasing</h5>
		</div>
		<div class="row form_view_row">
			<div class="col s12 m12 l12 input-field">
				<input type="date" class="datepicker" id="rpDue" /> <label
					for="rpDue">Due</label>
			</div>
		</div>
		<div class="row form_view_row">
			<div class="col s12 m12 l12 input-field">
				<textarea id="rpDesc" class="materialize-textarea"></textarea>
				<label for="rpDesc">Description</label>
			</div>
		</div>
		<div class="row form_view_row">
			<div class="col s12 m8 l8 input-field">
				<select>
					<option value="" disabled selected>Select Type</option>
					<option value="1">Type 1</option>
					<option value="2">Type 2</option>
					<option value="3">Type 3</option>
				</select> <label>Type</label>
			</div>
			<div class="col s12 m4 l4 input-field">
				<select>
					<option value="" disabled selected>Select Quantity</option>
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
				</select> <label>Quantity</label>
			</div>
		</div>
		<div class="row form_view_row">
			<div class="col s3 m3 l3 rm_importance">
				<span class="Lato_normal_font">Importance:</span>
			</div>
			<div class="col s3 m3 l3 input-field">
				<input name="group1" type="radio" id="rp_lowRadio" checked /> <label
					for="rp_lowRadio">Low</label>
			</div>
			<div class="col s3 m3 l3 input-field">
				<input name="group1" type="radio" id="rp_highRadio" /> <label
					for="rp_highRadio">High</label>
			</div>
			<div class="col s3 m3 l3 input-field">
				<input name="group1" type="radio" id="rp_criticalRadio" /> <label
					for="rp_criticalRadio">Critical</label>
			</div>
		</div>
		<div class="row form_view_row">
			<div class="col s3 m3 l3 rm_importance">
				<span class="Lato_normal_font">Status</span>
			</div>
			<div class="col s3 m3 l3 input-field">
				<input name="group1" type="checkbox" id="status" /> <label
					for="status">Closed</label>
			</div>
		</div>
	</div>
	<div class="modal-footer">
		<a href="#!"
			class=" modal-action modal-close waves-effect waves-green btn-flat">Cancel</a>
		<a href="#!"
			class=" modal-action modal-close waves-effect waves-green btn-flat">Create</a>
	</div>
</div>