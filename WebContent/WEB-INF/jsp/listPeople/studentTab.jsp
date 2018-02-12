<div id="studentTab" class="col s12 m12 l12">
	<div id="studentDashboardDiv" class="studentTabDiv">
		<div class="row">
	       <div class="col s12 m7 l7">
	         	<div class="card">
	          		<div class="card-content">
			           	<div class="center addButtonDiv">
			           		<a class="waves-effect waves-light btn btn-block modal-trigger" href="#addStudentsModal"><i class="material-icons left">add</i>Add A Student</a>
			           	</div>
			           	<div class="center addButtonDiv">
			           		<a class="waves-effect waves-light btn btn-block modal-trigger" href="#uploadStudents"><i class="material-icons left">add</i>Upload Students</a>
			           	</div>
		       		</div>
           		</div>
	       </div>
      	</div>
      	<div class="row">
	       <div class="col s12 m9 l9">
	         	<table border="1">
	         		<tr>
	         			<td class="studentDashTable">
	         				Total # Students
	         			</td>
	         			<td class="studentDashTable">
	         				100
	         			</td>
	         			<td class="studentDashTable">
	         				Parents
	         			</td>
	         			<td class="studentDashTable">
	         				50
	         			</td>
	         			<td class="studentDashTable">
	         				Others
	         			</td>
	         			<td class="studentDashTable">
	         				10
	         			</td>
	         		</tr>
	         		
	         		<tr>
	         			<td class="studentDashTable">
	         				Total # Schools
	         			</td>
	         			<td class="studentDashTable">
	         				10
	         			</td>
	         			<td class="studentDashTable">
	         				Programs
	         			</td>
	         			<td class="studentDashTable">
	         				5
	         			</td>
	         			<td class="studentDashTable">
	         				Teachers
	         			</td>
	         			<td class="studentDashTable">
	         				30
	         			</td>
	         		</tr>
	         	</table>
	       </div>
      	</div>
   		<div class="col s12 m7">
			<div id="studentChart1Container"></div>
       	</div>
       	<div class="col s12 m5">
			<div id="studentChart2Container"></div>
       	</div>
	</div>
	
	
	<div id="studentInfoDiv" class="studentTabDiv">
		<div class="row">
	       <div class="col s12 m12">
	         <div class="card darken-1">
	           <div class="card-content">
	           <div class="row">
		           <div class="col s2"><img src="images/yuna.jpg" alt="" class="circle"></div>
		           <div class="col s4">
						<div class="row noMargin">
						      	<div class="col s3 infoFieldDiv">
						    		<label class="infoFieldLabel" for="name">Name</label>
						      	</div>
						      	<div class="col s9">
						      		<div class="col">
						    			<input id="name" type="text" disabled ng-value="studentInfo.name" class="infoFieldInput">
						      		</div>
						      		<!-- <div class="col s1 editFieldsDiv">
						    			<a class="modal-trigger" href="#modal1"><i class="material-icons prefix editFieldIcon">mode_edit</i></a>
						      		</div> -->
						      	</div>
						</div>
						<div class="row noMargin">
						      	<div class="col s3 infoFieldDiv">
						    		<label class="infoFieldLabel" for="age">DOB</label>
						      	</div>
						      	<div class="col s9">
						      		<div class="col s10">
						    			<input id="age" type="text" disabled ng-value="studentInfo.dateOfBirthString" class="infoFieldInput">
						      		</div>
						      		<!-- <div class="col s1 editFieldsDiv">
						    			<a class="modal-trigger" href="#modal2"><i class="material-icons prefix editFieldIcon">mode_edit</i></a>
						      		</div> -->
						      	</div>
						</div>
					</div>
					<div class="col s6">
						<div class="row noMargin">
						      	<div class="col s4 infoFieldDiv">
						    		<label class="infoFieldLabel" for="program">School Name</label>
						      	</div>
						      	<div class="col s8">
						      		<div class="col s10">
						    			<input id="program" type="text" disabled value="Q-Dees Subang" class="infoFieldInput">
						      		</div>
						      		<!-- <div class="col s1 editFieldsDiv">
						    			<a class="modal-trigger" href="#modal3"><i class="material-icons prefix editFieldIcon">mode_edit</i></a>
						      		</div> -->
						      	</div>
						</div>
						<div class="row noMargin">
						      	<div class="col s4 infoFieldDiv">
						    		<label class="infoFieldLabel" for="program">Program</label>
						      	</div>
						      	<div class="col s8">
						      		<div class="col s10">
						    			<input id="program" type="text" disabled value="Infant Program" class="infoFieldInput">
						      		</div>
						      		<!-- <div class="col s1 editFieldsDiv">
						    			<a class="modal-trigger" href="#modal4"><i class="material-icons prefix editFieldIcon">mode_edit</i></a>
						      		</div> -->
						      	</div>
						</div>
		   			</div>
		   			<div class="col contactEditButton">
		   				<a class="waves-effect waves-light btn modal-trigger" href="#editContactModal">Edit</a>	
		   			</div>
					<div class="col s10 offset-s2">
						<a class="waves-effect waves-light btn btn-25">Check-In</a>
						<a class="waves-effect waves-light btn btn-25">Emergency</a>
						<a class="waves-effect waves-light btn btn-25">Doctor</a>
						<a class="waves-effect waves-light btn btn-25">Contacts</a>
					</div>
				</div>
				<div class="row">
					<div class="parentTableDiv col s12">
			   			<h5 class="black-text col s12">Contacts</h5>
			   			<div class="col s8">
			   			<div class="card parentTable">
						    <table class="responsive-table bordered">
						        <thead>
						          <tr>
						              <th data-field="name">Name</th>
						              <th data-field="relationship">Relationship</th>
						              <th data-field=""></th>
						          </tr>
						        </thead>
						
						        <tbody>
						          <tr>
						            <td>Lee Chong Wei</td>
						            <td>Father</td>
						            <td>
						            	<div class="row noMargin right">
							            	<i class="material-icons prefix editFieldIconPadded">mode_edit</i>
							            	<i class="material-icons prefix editFieldIconPadded tooltipped" data-tooltip>call</i>	
							            	<i class="material-icons prefix editFieldIconPadded">delete</i>	
						            	</div>
					            	</td>
						          </tr>
						          <tr>
						            <td>Jeniffer Lopez</td>
						            <td>Mother</td>
						            <td>
						            	<div class="row noMargin right">
							            	<i class="material-icons prefix editFieldIconPadded">mode_edit</i>
							            	<i class="material-icons prefix editFieldIconPadded tooltipped" data-tooltip>call</i>	
							            	<i class="material-icons prefix editFieldIconPadded">delete</i>	
						            	</div>
						            </td>
						          </tr>
						          <tr>
						            <td>Johnnie Walker</td>
						            <td>Uncle</td>
						            <td>
						            	<div class="row noMargin right">
							            	<i class="material-icons prefix editFieldIconPadded">mode_edit</i>
							            	<i class="material-icons prefix editFieldIconPadded tooltipped" data-tooltip>call</i>	
							            	<i class="material-icons prefix editFieldIconPadded">delete</i>	
						            	</div>
						            </td>
						          </tr>
						        </tbody>
						      </table>
					  	</div>
				  	</div>
					  	<div class="col s4 m4 peopleButtonContainer">
				           	<div class="center addButtonDiv">
				           		<a class="waves-effect waves-light btn btn-block"><i class="material-icons left">add</i>Add Photo</a>
				           	</div>
				           	<div class="center addButtonDiv">
				           		<a class="waves-effect waves-light btn btn-block"><i class="material-icons left">add</i>Update Activity</a>
				           	</div>
				           	<div class="center addButtonDiv">
				           		<a class="waves-effect waves-light btn btn-block"><i class="material-icons left">add</i>Add Contact</a>
				           	</div>
				           	<div class="center addButtonDiv">
				           		<a class="waves-effect waves-light btn btn-block"><i class="material-icons left">add</i>Update Progress</a>
				           	</div>
				           	<div class="center">
				           		<a class="waves-effect waves-light btn btn-block"><i class="material-icons left">add</i>Notes</a>
				           	</div>
			       		</div>
			       	</div>
			  	</div>
			  	<div class="row">
				  	<div class="parentTableDiv col s12">
					  	<h5 class="black-text">Photos</h5>
						<div class="carousel studentPhotoCarousel">
						  <a class="carousel-item" href="#one!"><img src="http://lorempixel.com/400/200/food/1"></a>
						  <a class="carousel-item" href="#two!"><img src="http://lorempixel.com/400/200/food/2"></a>
						  <a class="carousel-item" href="#three!"><img src="http://lorempixel.com/400/200/food/3"></a>
						  <a class="carousel-item" href="#four!"><img src="http://lorempixel.com/400/200/food/4"></a>
						</div>
					</div>
				</div>
				</div>
	         </div>
	       </div>
       </div>
		<div class="col s12 m12">
			<ul class="collapsible" data-collapsible="accordion">
			  <li>
			    <div class="collapsible-header active"><i class="material-icons">filter_drama</i>Activities</div>
			    <div class="collapsible-body">
			    	<div class="activityAccordionDiv">
			    		<div class="row">
	           				<a class="waves-effect waves-light btn btn-25" ng-click="startActivity('healthCheck')"><i class="material-icons left">local_hospital</i>Health Check</a>
	           				<a class="waves-effect waves-light btn btn-25" ng-click="startActivity('sleepometer')"><i class="material-icons left">local_hospital</i>Sleepometer</a>
	           				<a class="waves-effect waves-light btn btn-25" ng-click="startActivity('hygiene')"><i class="material-icons left">local_hospital</i>Hygiene</a>
	           				<a class="waves-effect waves-light btn btn-25" ng-click="startActivity('bottleFeeding')"><i class="material-icons left">local_hospital</i>Bottle Feeding</a>
	           			</div>
	           			<div class="row">
	           				<!-- <a class="waves-effect waves-light btn btn-25 modal-trigger"><i class="material-icons left">local_hospital</i>Reading</a>
	           				<a class="waves-effect waves-light btn btn-25 modal-trigger"><i class="material-icons left">local_hospital</i>Play Skill</a> -->
	           				<a class="waves-effect waves-light btn btn-25" ng-click="startActivity('medication')"><i class="material-icons left">local_hospital</i>Medication</a>
	           				<a class="waves-effect waves-light btn btn-25" ng-click="startActivity('emotion')"><i class="material-icons left">local_hospital</i>Emotion</a>
	           				<a class="waves-effect waves-light btn btn-25" ng-click="startActivity('checkList')"><i class="material-icons left">local_hospital</i>Checklist</a>
	           			</div>
	           			<!-- <div class="row">
	           				<a class="waves-effect waves-light btn btn-25 modal-trigger"><i class="material-icons left">local_hospital</i>Checklist</a>
	           				<a class="waves-effect waves-light btn btn-25 modal-trigger"><i class="material-icons left">local_hospital</i>Progress</a>
	           				<a class="waves-effect waves-light btn btn-25 modal-trigger"><i class="material-icons left">local_hospital</i>Adhoc Package</a>
	           				<a class="waves-effect waves-light btn btn-25 modal-trigger"><i class="material-icons left">local_hospital</i>Transport Pickup</a>
	           			</div> -->
	           		</div>
			    </div>
			  </li>
			</ul>
		</div>
     </div>
</div>

<div id="editContactModal" class="modal">
   <div class="modal-content">
     <h4>Edit Student</h4>
     <div class="row">
	     <div class="input-field col s6">
		     <input placeholder="Full Name" id="name" type="text" ng-model="editStudentName" class="validate infoFieldInput registrationInput">
		     <label for="name">Full Name</label>
	     </div>
	     <div class="input-field col s6">
		     <input placeholder="YYYY-MM-DD" id="dob" type="text" ng-model="editStudentDob" class="validate infoFieldInput registrationInput">
		     <label for="dob">Date of Birth</label>
	     </div>
     </div>
   </div>
   <div class="modal-footer">
		<a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat ">Cancel</a>
     	<a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Save</a>
   </div>
</div>

<div id="healthCheck" class="modal">
    <div class="modal-content">
		<h4>Health Check</h4>
		<div class="healthCheckContentDiv">
			<div class="col s12">
				<div class="row">
					<label class="col s1 activityLabel">Temp</label>
					<label class="col s4 range-field">
				      <input type="range" id="test5" min="35" max="43" ng-model="healthCheck.temp"/>
				    </label>
				    <div class="col">
						<input type="checkbox" class="filled-in" id="rnweyes" ng-model="healthCheck.wateryEyes"/>
						<label for="rnweyes" class="black-text">Red & Watery Eyes</label>
					</div>
					<div class="col">
						<input type="checkbox" class="filled-in" id="runnynose" ng-model="healthCheck.runnyNose"/>
						<label for="runnynose" class="black-text">Runny Nose</label>
					</div>
			    </div>
			    <div class="row noBottomMargin">
				    <div class="col">
						<input type="checkbox" class="filled-in" id="cough" ng-model="healthCheck.cough"/>
						<label for="cough" class="black-text">Cough</label>
					</div>
					<div class="col">
						<input type="checkbox" class="filled-in" id="virus" ng-model="healthCheck.virus"/>
						<label for="virus" class="black-text">Virus</label>
					</div>
					<div class="col">
						<input type="checkbox" class="filled-in" id="rashes" ng-model="healthCheck.rashes"/>
						<label for="rashes" class="black-text">Rashes</label>
					</div>
					<div class="col s6">
					    <label class="col s5 activityLabel left-20">Blister Eruption</label>
						<div class="healthCheckSelect col s7">
						    <select ng-model="healthCheck.blisters">
						      <option value="" disabled selected>Choose your option</option>
						      <option value="Palms">Palms</option>
						      <option value="Soles">Soles</option>
						      <option value="Buttocks">Buttocks</option>
						    </select>
					  	</div>
				  	</div>
			    </div>
			    <div class="row">
				    <div class="col">
						<input type="checkbox" class="filled-in" id="mouthulcer" ng-model="healthCheck.mouthUlcer"/>
						<label for="mouthulcer" class="black-text">Mouth Ulcer</label>
					</div>
					<div class="col">
						<input type="checkbox" class="filled-in" id="drooling" ng-model="healthCheck.drooling"/>
						<label for="drooling" class="black-text">Drooling Saliva</label>
					</div>
				</div>
				<div class="row">
				  <div class="input-field col s12">
				    <textarea id="textarea1" class="materialize-textarea" ng-model="healthCheck.remarks"></textarea>
				    <label for="textarea1" class="black-text">Remarks</label>
				  </div>
				</div>
		    </div>
		</div>
    </div>
    <div class="modal-footer">
    	<a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat ">Cancel</a>
      	<a ng-click="submitActivity('healthCheck', studentInfo)" class="modal-action modal-close waves-effect waves-green btn-flat ">Save</a>
    </div>
</div>

<div id="sleepometer" class="modal">
    <div class="modal-content">
		<h4>Sleepometer</h4>
		<div class="sleepometerContentDiv">
			<div class="col s6">
				<div class="row">
					<img class="sleepoMeterIcon" src="<%=request.getContextPath()%>/images/sleepMeter.png"></img>
					
			    </div>
		    </div>
		    <div class="col s6" id="napStartEndButtons">
				<div class="row">
					<div class="col s6">
						<a class="waves-effect waves-light btn" ng-click="startNapTime()" id="startNapButton">Start Nap</a>
					</div>
					<div class="col s6">
						<a class="waves-effect waves-light btn" ng-click="endNapTime()" id="endNapButton">End Nap</a>
					</div>
			    </div>
		    </div>
		</div>
    </div>
    <div class="modal-footer">
    	<a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat ">Cancel</a>
      	<a ng-click="submitActivity('sleepometer', studentInfo)" class="modal-action modal-close waves-effect waves-green btn-flat ">Save</a>
    </div>
</div>

<div id="hygiene" class="modal" style="width: 65%;">
    <div class="modal-content">
		<h4>Hygiene</h4>
		<div class="sleepometerContentDiv">
			<div class="col s6">
				<div class="row">
					<img class="sleepoMeterIcon" src="<%=request.getContextPath()%>/images/sleepMeter.png"></img>
					
			    </div>
		    </div>
		    <div class="col s6" id="hygieneButtons">
				<div class="row">
					<div class="col s4">
						<a class="col s12 waves-effect waves-light btn" ng-click="recordBath()" id="bathButton">Bath</a>
					</div>
					<div class="col s4">
						<a class="col s12 waves-effect waves-light btn" ng-click="recordPotty1()" id="potty1Button">Potty 1</a>
					</div>
					<div class="col s4">
						<a class="col s12 waves-effect waves-light btn" ng-click="recordPotty2()" id="potty2Button">Potty 2</a>
					</div>
			    </div>
		    </div>
		</div>
    </div>
    <div class="modal-footer">
    	<a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat ">Cancel</a>
      	<a ng-click="submitActivity('hygiene', studentInfo)" class="modal-action modal-close waves-effect waves-green btn-flat ">Save</a>
    </div>
</div>

<div id="bottleFeeding" class="modal">
    <div class="modal-content">
		<h4>Bottle Feeding</h4>
		<div class="sleepometerContentDiv">
			<div class="col s6">
				<div class="row">
					<img class="sleepoMeterIcon" src="<%=request.getContextPath()%>/images/sleepMeter.png"></img>
			    </div>
		    </div>
		    <div class="col s6" id="bottleFeedingButtons">
				<div class="row">
					<div class="col s4">
						<a class="col s12 waves-effect waves-light btn" ng-click="recordBottleFeeding()" id="bottleFeedingButton">Feeding</a>
					</div>
			    </div>
		    </div>
		</div>
    </div>
    <div class="modal-footer">
    	<a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat ">Cancel</a>
      	<a ng-click="submitActivity('bottleFeeding', studentInfo)" class="modal-action modal-close waves-effect waves-green btn-flat ">Save</a>
    </div>
</div>

<div id="medication" class="modal">
    <div class="modal-content">
		<h4>Medication</h4>
		<div class="sleepometerContentDiv">
			<div class="col s6">
				<div class="row">
					<img class="sleepoMeterIcon" src="<%=request.getContextPath()%>/images/sleepMeter.png"></img>
			    </div>
		    </div>
		    <div class="col s6" id="medicationButtons">
				<div class="row">
					<div class="col s5">
						<a class="col s12 waves-effect waves-light btn" ng-click="recordMedication()" id="medicationButton">Medication</a>
					</div>
			    </div>
		    </div>
		</div>
    </div>
    <div class="modal-footer">
    	<a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat ">Cancel</a>
      	<a ng-click="submitActivity('medication', studentInfo)" class="modal-action modal-close waves-effect waves-green btn-flat ">Save</a>
    </div>
</div>

<div id="emotion" class="modal">
    <div class="modal-content">
		<h4>Emotion</h4>
		<div class="sleepometerContentDiv">
			<div class="col s6">
				<div class="row">
					<img class="sleepoMeterIcon" src="<%=request.getContextPath()%>/images/sleepMeter.png"></img>
			    </div>
		    </div>
		    <div class="col s6" id="emotionButtons">
				<div class="row">
					<div class="col s2">
						<a class="col s12 waves-effect waves-light" ng-click="recordEmotion('veryUnhappy')"><i style="font-size:23px;" class="material-icons">sentiment_very_dissatisfied</i></a>
					</div>
					<div class="col s2">
						<a class="col s12 waves-effect waves-light" ng-click="recordEmotion('unHappy')"><i style="font-size:23px;" class="material-icons">sentiment_dissatisfied</i></a>
					</div>
					<div class="col s2">
						<a class="col s12 waves-effect waves-light" ng-click="recordEmotion('neutral')"><i style="font-size:23px;" class="material-icons">sentiment_neutral</i></a>
					</div>
					<div class="col s2">
						<a class="col s12 waves-effect waves-light" ng-click="recordEmotion('happy')"><i style="font-size:23px;" class="material-icons">sentiment_satisfied</i></a>
					</div>
					<div class="col s2">
						<a class="col s12 waves-effect waves-light" ng-click="recordEmotion('veryHappy')"><i style="font-size:23px;" class="material-icons">sentiment_very_satisfied</i></a>
					</div>
			    </div>
		    </div>
		</div>
    </div>
    <div class="modal-footer">
    	<a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat ">Cancel</a>
      	<a ng-click="submitActivity('emotion', studentInfo)" class="modal-action modal-close waves-effect waves-green btn-flat ">Save</a>
    </div>
</div>

<div id="uploadStudents" class="modal">
    <div class="modal-content">
		<h4>Upload Students</h4>
		<p>Please download this template and fill in the new students</p>
		<a class="waves-effect waves-light btn fileButton"><i class="material-icons left">system_update_alt</i>Download</a>
		<div class="divider customDivider"></div>
		<div class="uploadTemplateDiv">
			<p>Upload complete template:</p>
			<div class="file-field input-field">
		      <div class="btn">
		        <span>File</span>
		        <input type="file">
		      </div>
		      <div class="file-path-wrapper">
		        <input class="file-path validate" type="text">
		      </div>
		    </div>
		</div>
    </div>
    <div class="modal-footer">
    	<a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat ">Cancel</a>
      	<a href="#fileUploadSuccess" class="modal-trigger modal-close waves-effect waves-green btn-flat ">Save</a>
    </div>
</div>

<div id="fileUploadSuccess" class="modal">
    <div class="modal-content">
		<h3>Results</h3>
		<p>Success : 90 records</p>
		<p>Fail : 10 records</p>
		<a class="waves-effect waves-light btn downloadSheetButton"><i class="material-icons left">system_update_alt</i>Download Sheet</a>
    </div>
    <div class="modal-footer">
      	<a class="modal-close waves-effect waves-green btn-flat ">Ok</a>
    </div>
</div>

<div id="addStudentsModal" class="modal">
   <div class="modal-content">
		<h4>Add Student</h4>
		<div class="row">
			<div class="input-field col s6">
			 <input placeholder="Full Name" id="name" type="text" ng-model="addStudentName" class="validate infoFieldInput registrationInput">
			 <label for="name" class="activityLabel">Full Name</label>
			</div>
			<div class="input-field col s6">
			 <input placeholder="YYYY-MM-DD" id="dob" ng-model="addStudentDob" type="text" class="validate infoFieldInput registrationInput">
			 <label for="dob" class="activityLabel">Date of Birth</label>
			</div>
		</div>
		<div class="modal-footer">
			<a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat ">Cancel</a>
		   	<a ng-click="addStudent()" class=" modal-action modal-close waves-effect waves-green btn-flat">Save</a>
		</div>
	</div>
</div>

<script type="text/javascript">
	$(document).ready(function(){
		$('.tooltipped').tooltip({delay: 50, html : true, position: 'top', tooltip : '<span class="col">Home Phone :</span><span class="col">0356789124</span><br><span class="col">Mobile :</span><span class="col">0123456789</span>'});
		/* $('#studentInfoDiv').css('display', 'none'); */
		$('.carousel').carousel();
		window.setInterval(function(){$('.carousel').carousel('next')},2000);
		
		$('.collapsible').collapsible({
	      accordion : false
	    });
    });
</script>