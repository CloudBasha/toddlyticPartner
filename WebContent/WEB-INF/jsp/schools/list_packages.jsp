<div id="school_packages_div" class="school_packages_div" ng-controller="packagesController">
	<div class="row">
		<div class="col s12 m9 l9">
			<ul class="collapsible" data-collapsible="accordion">
				<li ng-repeat="package in packages track by $index">
					<div id="packageCollapse_{{$index}}" class="collapsible-header">
						<div class="row noMargin">
							<div class="col">
								<i class="material-icons">filter_drama</i>{{package._package.packageName}}
							</div>
							<div style="position: relative;top: 5px;" class="col right">
								<a ng-click="editPackage(package)" class="tooltipped" data-position="bottom" data-delay="50"
								data-tooltip="Edit"><img src="<%=request.getContextPath()%>/images/edit.png"
									width="20px" height="20px" /></a> 
								<a ng-click="showDeletePackageConfirm(package)" class="tooltipped" data-position="bottom"
								data-delay="50" data-tooltip="Remove"><img
									src="<%=request.getContextPath()%>/images/delete.png" width="20px" height="20px" /></a>
							</div>
						</div>
					</div>
					<div class="collapsible-body">
						<div class="row">
							<div class="col s12 m12 l12">
								<table class="highlight">
									<thead>
										<tr>
											<th>Description</th>
											<th>Schools</th>
											<th>Options</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>{{package._package.packageDescription}}</td>
											<td><div class="row" ng-repeat="school in package.schoolList">{{school.schoolName}}</div></td>
											<td><div class="row" ng-repeat="option in package.optionList">{{option.optionName}}</div></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</li>
			</ul>
		</div>
		<div class="col s12 m3 l3">
			<div class="row sc_prog_right_options">
				<div class="col s12 m12 l12">
					<a href="#createPackageModal"
						class="waves-effect waves-teal btn categories_selection modal-trigger"><i
						class="material-icons left">add</i>New Package</a>
				</div>
			</div>
		</div>
	</div>

	<div id="createPackageModal" class="modal modal-fixed-footer createPackageModal">
		<div class="modal-content">
			<div class="row">
				<h5 class="Lato_normal_font">New Package</h5>
			</div>
			<div class="row sc_pro_row form_view_row">
				<div class="col s12 m6 l6 input-field">
					<input type="text" id="c_programName" ng-model="packageObj.name"/> <label for="c_programName">Package
						Name</label>
				</div>
				<div class="col s12 m6 l6 input-field">
					<select ng-model="packageSchools" ng-options="school.schoolId as school.schoolName for school in schools" multiple>
						<option value="" disabled selected>Select School</option>
					</select> <label>Schools</label>
				</div>
			</div>
			<div class="row">
				<div class="col s12 m6 l6 input-field">
					<textarea id="c_packageDesc" class="materialize-textarea" ng-model="packageObj.description"></textarea>
					<label for="c_packageDesc">Description</label>
				</div>
				<div class="col s10 m5 l5 input-field">
					<input type="text" class="validate" id="c_packageOptions" ng-model="optionInfo[0]" /> <label for="c_packageOptions">Options</label>
				</div>
				<div class="col s2 m1 l1 package_add_btn" id="optionDiv">
					<a ng-click="addPackageOption()" class="noPadding waves-effect btn-flat tooltipped"
						data-position="bottom" data-delay="50" data-tooltip="Add Option Row"><i
						class="material-icons">add</i></a>
				</div>
			</div>
		</div>
		<div class="modal-footer">
			<a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Cancel</a> 
			<a ng-click="createPackage()" class=" modal-action modal-close waves-effect waves-green btn-flat">Create</a>
		</div>
	</div>
	
	<div id="editPackageModal" class="modal modal-fixed-footer createPackageModal">
		<div class="modal-content">
			<div class="row">
				<h5 class="Lato_normal_font">Edit Package</h5>
			</div>
			<div class="row sc_pro_row form_view_row">
				<div class="col s12 m6 l6 input-field">
					<input type="text" id="c_programName" ng-model="editPackageName"/> <label for="c_programName">Package
						Name</label>
				</div>
				<div class="col s12 m6 l6 input-field">
					<select ng-model="editPackageSchool" ng-options="school.schoolId as school.schoolName for school in schools" multiple>
						<option value="" disabled selected>Select School</option>
					</select> <label>Schools</label>
				</div>
			</div>
			<div class="row">
				<div class="col s12 m6 l6 input-field">
					<textarea id="c_packageDesc" class="materialize-textarea" ng-model="editPackageDescription"></textarea>
					<label for="c_packageDesc">Description</label>
				</div>
				<div class="col s10 m5 l5 input-field">
					<input type="text" class="validate" id="c_packageOptions" ng-model="optionInfo[0]" /> <label for="c_packageOptions">Options</label>
				</div>
				<div class="col s2 m1 l1 package_add_btn" id="editOptionDiv">
					<a ng-click="addEditPackageOption()" class="noPadding waves-effect btn-flat tooltipped"
						data-position="bottom" data-delay="50" data-tooltip="Add Option Row"><i
						class="material-icons">add</i></a>
				</div>
				<div ng-repeat="editOption in editOptions" id="editOptionDiv_{{$index}}" class="row">
					<div class="col s5 offset-s6 input-field">
						<input placeholder="Options" ng-model="editOption.optionName" type="text" class="validate col s9" id="editOptionItem_{{$index}}"/>
					 	<label for="editOptionItem_{{$index}}">Options</label><img class="activityModalsDeleteButton" ng-click="deleteServerPackageOptionItemEntryRow($index, editOptions)" src="./images/remove.png" width="30px" height="30px" />
				 	</div>
			 	</div>
			</div>
		</div>
		<div class="modal-footer">
			<a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Cancel</a> 
			<a ng-click="submitEditPackage()" class=" modal-action modal-close waves-effect waves-green btn-flat">Edit</a>
		</div>
	</div>
	
	<div id="deletePackageConfirmModal" class="modal modal-fixed-footer deleteSchoolModal">
		<div class="modal-content">
			Are you sure you want to delete <b>{{deletePackageName}}</b>?
		</div>
		<div class="modal-footer">
			<a href="#!"
				class=" modal-action modal-close waves-effect waves-green btn-flat">Cancel</a>
			<button
				class="btn-flat modal-action modal-close waves-effect waves-light" ng-click="deletePackage()">Delete
			</button>
		</div>
	</div>
</div>