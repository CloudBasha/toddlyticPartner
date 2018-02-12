<div id="school_services_div" class="school_services_div" ng-controller="servicesController">
	<div class="col s12 m12 l12">
		<div class="col s2">
			<label class="activityLabel">School Name</label>
		</div>
		<div class="input-field col s7 schoolSelect">
		  <select ng-model="servicesSchoolDef" ng-options="school.schoolId as school.schoolName for school in schools" >
		    <option value="" disabled>Choose your option</option>
		  </select>
		</div>
		<div class="col s2 offset-s1">
          	<div class="center addButtonDiv">
          		<a class="waves-effect waves-light btn btn-block modal-trigger" href="#addServicesModal"><i class="material-icons left">add</i>Services</a>
          	</div>
		</div>
		
		<div class="row">
		  <div class="col s12 m6">
	      	<ul class="collapsible" data-collapsible="accordion">
			    <li ng-repeat="service in services | filter : {schoolId : servicesSchoolDef}">
			      <div class="collapsible-header"><i class="material-icons">filter_drama</i>{{service.serviceType}}
			      	<div style="position: relative;top: 5px;" class="col right">
						<a ng-click="editService(service)" class="tooltipped" data-position="bottom" data-delay="50"
						data-tooltip="Edit"><img src="<%=request.getContextPath()%>/images/edit.png"
							width="20px" height="20px" /></a> 
						<a ng-click="showDeleteServiceConfirm(service)" class="tooltipped" data-position="bottom"
						data-delay="50" data-tooltip="Remove"><img
							src="<%=request.getContextPath()%>/images/delete.png" width="20px" height="20px" /></a>
					</div>
			      </div>
			      <div class="collapsible-body serviceAccordionDiv">
			      	<p>
			      		<span class="col s3 noPadding">Name:</span>
			      		<span class="col s9 noPadding">{{service.personName}}</span>
			      	</p>
			      	<p>
			      		<span class="col s3 noPadding">Email:</span>
			      		<span class="col s9 noPadding">{{service.personName}}</span>
			      	</p>
			      	<p>
			      		<span class="col s3 noPadding">Mobile:</span>
			      		<span class="col s9 noPadding">{{service.personMobile}}</span>
			      	</p>
			      	<p>
			      		<span class="col s3 noPadding">Vehicle:</span>
			      		<span class="col s9 noPadding">{{service.vehicle}}</span>
			      	</p>
			      	<p>
			      		<span class="col s3 noPadding">Model:</span>
			      		<span class="col s9 noPadding">{{service.model}}</span>
			      	</p>
			      	<p>
			      		<span class="col s3 noPadding">Make:</span>
			      		<span class="col s9 noPadding">{{service.make}}</span>
			      	</p>
			      	<p>
			      		<span class="col s3 noPadding">Capacity:</span>
			      		<span class="col s9 noPadding">{{service.capacity}}</span>
			      	</p>
			      	<p>
			      		<span class="col s3 noPadding">Color:</span>
			      		<span class="col s9 noPadding">{{service.color}}</span>
			      	</p>		      	
			      </div>
			    </li>
		  	</ul>
		</div>
	  </div>
	</div>

	<div id="addServicesModal" class="modal">
	   <div class="modal-content">
	    <h4>Add Services</h4>
	    <div class="col s12 noPadding">
		   	<div class="col s12">
		   		<div class="col s3 noPadding">
					<label class="activityLabel" for="serviceType" class="black-text">Service Type:</label>
				</div>
		   		<div class="input-field col s9 schoolSelect noPadding">
				  <select ng-model="serviceType">
				    <option value="" disabled>Choose your option</option>
					<option value="Driver" selected>Driver</option>
					<option value="Doctor">Doctor</option>
					<option value="Plumber">Plumber</option>
					<option value="Technician">Technician</option>
				  </select>
				</div>
		   	</div>
	      	<div class="col s12">
	      		<div class="col s3 noPadding">
					<label class="activityLabel" for="serviceType" class="black-text">School:</label>
				</div>
				<div class="input-field col s9 schoolSelect noPadding">
					<select ng-model="schoolId" ng-options="school.schoolId as school.schoolName for school in schools" >
					    <option value="" disabled>Choose your option</option>
					</select>
				</div>
			</div>
		   	<div class="col s12">
				<span class="col s3 noPadding">Name:</span>
				<input class="col s9 noPadding registrationInput alignTextInput" ng-model="personName"/>
			</div>
			<div class="col s12">
				<span class="col s3 noPadding">Email:</span>
				<input class="col s9 noPadding registrationInput alignTextInput" ng-model="personEmail"/>
			</div>
			<div class="col s12">
				<span class="col s3 noPadding">Mobile:</span>
				<input class="col s9 noPadding registrationInput alignTextInput" ng-model="personMobile"/>
			</div>
			<div class="col s12">
				<span class="col s3 noPadding">Office:</span>
				<input class="col s9 noPadding registrationInput alignTextInput" ng-model="officeTel"/>
			</div>
			<div class="col s12">
				<span class="col s3 noPadding">Vehicle:</span>
				<input class="col s9 noPadding registrationInput alignTextInput" ng-model="vehicle"/>
			</div>
			<div class="col s12">
				<span class="col s3 noPadding">Model:</span>
				<input class="col s9 noPadding registrationInput alignTextInput" ng-model="model"/>
			</div>
			<div class="col s12">
				<span class="col s3 noPadding">Make:</span>
				<input class="col s9 noPadding registrationInput alignTextInput" ng-model="make"/>
			</div>
			<div class="col s12">
				<span class="col s3 noPadding">Capacity:</span>
				<input type="number" class="col s9 noPadding registrationInput alignTextInput" ng-model="capacity"/>
			</div>
			<div class="col s12">
				<span class="col s3 noPadding">Color:</span>
				<input class="col s9 noPadding registrationInput alignTextInput" ng-model="color"/>
			</div>
		</div>
	   </div>
	   <div class="modal-footer">
			<a class="modal-action modal-close waves-effect waves-green btn-flat ">Cancel</a>
	     	<a ng-click="addNewService()" class=" modal-action modal-close waves-effect waves-green btn-flat">Save</a>
	   </div>
	</div>
	
	<div id="editServicesModal" class="modal">
	   <div class="modal-content">
	    	<h4>Edit Services</h4>
		    <div class="col s12 noPadding">
			   	<div class="col s12">
			   		<div class="col s3 noPadding">
						<label class="activityLabel" for="editServiceType" class="black-text">Service Type:</label>
					</div>
			   		<div class="input-field col s9 schoolSelect noPadding">
					  <select ng-model="editServiceType">
					    <option value="" disabled>Choose your option</option>
						<option value="Driver" selected>Driver</option>
						<option value="Doctor">Doctor</option>
						<option value="Plumber">Plumber</option>
						<option value="Technician">Technician</option>
					  </select>
					</div>
			   	</div>
		      	<div class="col s12">
		      		<div class="col s3 noPadding">
						<label class="activityLabel" for="editServiceType" class="black-text">School:</label>
					</div>
					<div class="input-field col s9 schoolSelect noPadding">
						<select ng-model="editSchoolId" ng-options="school.schoolId as school.schoolName for school in schools" >
						    <option value="" disabled>Choose your option</option>
						</select>
					</div>
				</div>
			   	<div class="col s12">
					<span class="col s3 noPadding">Name:</span>
					<input class="col s9 noPadding registrationInput alignTextInput" ng-model="editName"/>
				</div>
				<div class="col s12">
					<span class="col s3 noPadding">Email:</span>
					<input class="col s9 noPadding registrationInput alignTextInput" ng-model="editEmail"/>
				</div>
				<div class="col s12">
					<span class="col s3 noPadding">Mobile:</span>
					<input class="col s9 noPadding registrationInput alignTextInput" ng-model="editMobile"/>
				</div>
				<div class="col s12">
					<span class="col s3 noPadding">Office:</span>
					<input class="col s9 noPadding registrationInput alignTextInput" ng-model="editOfficeTel"/>
				</div>
				<div class="col s12">
					<span class="col s3 noPadding">Vehicle:</span>
					<input class="col s9 noPadding registrationInput alignTextInput" ng-model="editVehicle"/>
				</div>
				<div class="col s12">
					<span class="col s3 noPadding">Model:</span>
					<input class="col s9 noPadding registrationInput alignTextInput" ng-model="editModel"/>
				</div>
				<div class="col s12">
					<span class="col s3 noPadding">Make:</span>
					<input class="col s9 noPadding registrationInput alignTextInput" ng-model="editMake"/>
				</div>
				<div class="col s12">
					<span class="col s3 noPadding">Capacity:</span>
					<input type="number" class="col s9 noPadding registrationInput alignTextInput" ng-model="editCapacity"/>
				</div>
				<div class="col s12">
					<span class="col s3 noPadding">Color:</span>
					<input class="col s9 noPadding registrationInput alignTextInput" ng-model="editColor"/>
				</div>
			</div>
	   	</div>
		<div class="modal-footer">
			<a class="modal-action modal-close waves-effect waves-green btn-flat ">Cancel</a>
		   	<a ng-click="submitEditService()" class=" modal-action modal-close waves-effect waves-green btn-flat">Edit</a>
		</div>
	</div>
	
	<div id="deleteServiceConfirmModal" class="modal modal-fixed-footer deleteSchoolModal">
		<div class="modal-content">
			Are you sure you want to delete <b>{{deleteServiceName}}</b>?
		</div>
		<div class="modal-footer">
			<a href="#!"
				class=" modal-action modal-close waves-effect waves-green btn-flat">Cancel</a>
			<button
				class="btn-flat modal-action modal-close waves-effect waves-light" ng-click="deleteService()">Delete
			</button>
		</div>
	</div>
</div>