<div id="school_rooms_div" class="school_rooms_div" ng-controller="roomController">
	<div class="col s12 m12 l12">
		<div class="col s2">
			<label class="activityLabel">School Name</label>
		</div>
		<div class="input-field col s7 schoolSelect">
		  <select ng-model="roomSchoolDef" ng-options="school.schoolId as school.schoolName for school in schools" >
		    <option value="" disabled>Choose your option</option>
		  </select>
		</div>
		<div class="col s2 offset-s1">
          	<div class="center addButtonDiv">
          		<a class="waves-effect waves-light btn btn-block modal-trigger" href="#addRoomModal"><i class="material-icons left">add</i>Room</a>
          	</div>
		</div>
		
		<div class="row">
		  <div class="col s12 m9">
		  	<h4>Room/Area</h4>
	      	<ul class="collapsible" data-collapsible="accordion">
			    <li ng-repeat="room in rooms | filter : {schoolId : roomSchoolDef}">
			      <div class="collapsible-header"><i class="material-icons">filter_drama</i>{{room.roomName}}
			      	<div style="position: relative;top: 5px;" class="col right">
						<a ng-click="editRoom(room)" class="tooltipped" data-position="bottom" data-delay="50"
						data-tooltip="Edit"><img src="<%=request.getContextPath()%>/images/edit.png"
							width="20px" height="20px" /></a>
						<a ng-click="showDeleteRoomConfirm(room)" class="tooltipped" data-position="bottom"
						data-delay="50" data-tooltip="Remove"><img
							src="<%=request.getContextPath()%>/images/delete.png" width="20px" height="20px" /></a>
					</div>
			      </div>
			      <div class="collapsible-body roomAccordionDiv">
			      	<p>
			      		<span class="col s2 noPadding">Description:</span>
			      		<span class="col s10 noPadding">{{room.roomDescription}}</span>
			      	</p>
			      	<p>
			      		<span class="col s2 noPadding">Square Area:</span>
			      		<span class="col s10 noPadding">{{room.squareArea}} m<sup>2</sup></span>
			      	</p>
			      	<div>
				      	<p >
					      	<div class="col s6">
						      	<p>
						      		<input type="checkbox" id="scale" disabled="disabled" ng-model="room.weightingScale" />
			   						<label for="scale" class="black-text">Weighing Scale</label>
						      	</p>
					      	</div>
					      	<div class="col s6">
						      	<p>
						      		<input type="checkbox" id="sensor" disabled="disabled" ng-model="room.motionSensor"/>
			   						<label for="sensor" class="black-text">Motion Sensor</label>
						      	</p>
					      	</div>	
			    		<p>
					      	<div class="col s6">
						      	<p>
						      		<input type="checkbox" id="cam" disabled="disabled" ng-model="room.webCam"/>
			   						<label for="cam" class="black-text">Web Cam</label>
						      	</p>
					      	</div>
					      	<div class="col s6">
						      	<p>
						      		<input type="checkbox" id="openarea" disabled="disabled" ng-model="room.openArea"/>
			   						<label for="openarea" class="black-text">Open Area</label>
						      	</p>
					      	</div>
					    </p>
					    <p>
					      	<div class="col s6">
						      	<p>
						      		<input type="checkbox" id="classroom" disabled="disabled" ng-model="room.classroom"/>
			   						<label for="classroom" class="black-text">Classroom</label>
						      	</p>
					      	</div>
					      	<div class="col s6">
						      	<p>
						      		<input type="checkbox" id="wifi" disabled="disabled" ng-model="room.wifi"/>
			   						<label for="wifi" class="black-text">Wifi</label>
						      	</p>
					      	</div>
				      	</p>	
			     	</div>
			     	<div>
				      	<div class="col s4 offset-s8">
					      	<div class="center addButtonDiv">
				           		<a class="waves-effect waves-light btn btn-block">Make Copy</a>
				           	</div>
				      	</div>
			      	</div>		      	
			      </div>
			    </li>
		  	</ul>
		</div>
	  </div>
	</div>

	<div id="addRoomModal" class="modal">
	   <div class="modal-content">
		    <h4>Add Room</h4>
		    <div class="row">
			    <div class="input-field col s12">
			     <input id="room_name" type="text" class="validate" ng-model="addRoom.name">
			     <label for="room_name">Room Name</label>
			    </div>
			    <div class="input-field col s12">
			     <input id="description" type="text" class="validate" ng-model="addRoom.description">
			     <label for="description">Description</label>
			    </div>
			   	<div class="input-field col s6">
				  <select ng-model="roomSchool" ng-options="school.schoolId as school.schoolName for school in schools" >
				    <option value="" disabled selected>Choose your option</option>
				  </select>
				  <label>School</label>
				</div>
				<div class="input-field col s6">
				     <input id="area" type="number" class="validate" ng-model="addRoom.area">
				     <label for="area">Square Area</label>
			    </div>
			</div>
			<div class="row">
			   	<div class="col s6">
			  		<input type="checkbox" id="addscale" ng-model="facilities.ws"/>
					<label for="addscale" class="black-text">Weighing Scale</label>
			   	</div>
			   	<div class="col s6">
			   		<input type="checkbox" id="addsensor" ng-model="facilities.ms"/>
					<label for="addsensor" class="black-text">Motion Sensor</label>
			   	</div>
		   	</div>
			<div class="row">
			   	<div class="col s6">
			   		<input type="checkbox" id="addcam" ng-model="facilities.wc"/>
					<label for="addcam" class="black-text">Web Cam</label>
			   	</div>
			   	<div class="col s6">
			   		<input type="checkbox" id="addopenarea" ng-model="facilities.oa"/>
					<label for="addopenarea" class="black-text">Open Area</label>
			   	</div>
		   	</div>
			<div class="row">
			   	<div class="col s6">
			   		<input type="checkbox" id="addclassroom" ng-model="facilities.cr"/>
					<label for="addclassroom" class="black-text">Classroom</label>
			   	</div>
			   	<div class="col s6">
					<input type="checkbox" id="addwifi" ng-model="facilities.wf"/>
					<label for="addwifi" class="black-text">Wifi</label>
			   	</div>
		   	</div>
	   </div>
	   <div class="modal-footer">
			<a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat ">Cancel</a>
	     	<a ng-click="createRoom()" class=" modal-action modal-close waves-effect waves-green btn-flat">Save</a>
	   </div>
	</div>
	
	<div id="editRoomModal" class="modal">
	   <div class="modal-content">
		    <h4>Edit Room</h4>
		    <div class="row">
			    <div class="input-field col s12">
			     <input id="room_name" type="text" class="validate" ng-model="editRoomName">
			     <label for="room_name">Room Name</label>
			    </div>
			    <div class="input-field col s12">
			     <input id="description" type="text" class="validate" ng-model="editRoomDescription">
			     <label for="description">Description</label>
			    </div>
			   	<div class="input-field col s6">
				  <select ng-model="editRoomSchool" ng-options="school.schoolId as school.schoolName for school in schools" >
				    <option value="" disabled selected>Choose your option</option>
				  </select>
				  <label>School</label>
				</div>
				<div class="input-field col s6">
				     <input id="area" type="number" class="validate" ng-model="editRoomArea">
				     <label for="area">Square Area</label>
			    </div>
			</div>
			<div class="row">
			   	<div class="col s6">
			  		<input type="checkbox" id="editAddScale" ng-model="editFacilities.ws"/>
					<label for="editAddScale" class="black-text">Weighing Scale</label>
			   	</div>
			   	<div class="col s6">
			   		<input type="checkbox" id="editAddSensor" ng-model="editFacilities.ms"/>
					<label for="editAddSensor" class="black-text">Motion Sensor</label>
			   	</div>
		   	</div>
			<div class="row">
			   	<div class="col s6">
			   		<input type="checkbox" id="editAddCam" ng-model="editFacilities.wc"/>
					<label for="editAddCam" class="black-text">Web Cam</label>
			   	</div>
			   	<div class="col s6">
			   		<input type="checkbox" id="addOpenArea" ng-model="editFacilities.oa"/>
					<label for="addOpenArea" class="black-text">Open Area</label>
			   	</div>
		   	</div>
			<div class="row">
			   	<div class="col s6">
			   		<input type="checkbox" id="addClassroom" ng-model="editFacilities.cr"/>
					<label for="addClassroom" class="black-text">Classroom</label>
			   	</div>
			   	<div class="col s6">
					<input type="checkbox" id="addWifi" ng-model="editFacilities.wf"/>
					<label for="addWifi" class="black-text">Wifi</label>
			   	</div>
		   	</div>
	   </div>
	   <div class="modal-footer">
			<a class="modal-action modal-close waves-effect waves-green btn-flat ">Cancel</a>
	     	<a ng-click="submitEditRoom()" class=" modal-action modal-close waves-effect waves-green btn-flat">Save</a>
	   </div>
	</div>
	
	<div id="deleteRoomConfirmModal" class="modal modal-fixed-footer deleteSchoolModal">
		<div class="modal-content">
			Are you sure you want to delete <b>{{deleteRoomName}}</b>?
		</div>
		<div class="modal-footer">
			<a href="#!"
				class=" modal-action modal-close waves-effect waves-green btn-flat">Cancel</a>
			<button
				class="btn-flat modal-action modal-close waves-effect waves-light" ng-click="deleteRoom()">Delete
			</button>
		</div>
	</div>
</div>