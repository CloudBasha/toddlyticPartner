<div id="parentTab" class="col s12 m12 l12">
	<div id="parentDashboardDiv" class="studentTabDiv">
		<div class="row">
	       <div class="col s12 m7 l7">
	         	<div class="card">
	          		<div class="card-content">
			           	<div class="center addButtonDiv">
			           		<a class="waves-effect waves-light btn btn-block modal-trigger" href="#addParentsModal"><i class="material-icons left">add</i>Add A Parent</a>
			           	</div>
			           	<div class="center addButtonDiv">
			           		<a class="waves-effect waves-light btn btn-block modal-trigger" href="#uploadParents"><i class="material-icons left">add</i>Upload Parents</a>
			           	</div>
		       		</div>
          		</div>
         </div>
       </div>
       <div class="col s12 m7">
			<div id="parentChart1Container"></div>
       	</div>
       	<div class="col s12 m5">
			<div id="parentChart2Container"></div>
       	</div>
   	</div>
	
	<div id="parentInfoDiv" class="studentTabDiv">
		<div class="row">
	       <div class="col s12 m12">
	         <div class="card darken-1">
	           <div class="card-content">
		       		<div class="row">
			           <div class="col s2"><img src="images/yuna.jpg" alt="" class="circle"></div>
			           <div class="col s5">
							<div class="row noMargin">
						      	<div class="col s2 infoFieldDiv">
						    		<label class="infoFieldLabel" for="name">Name</label>
						      	</div>
						      	<div class="col s10">
						      		<div class="col s11">
						    			<input id="name" type="text" disabled value="James Millian" class="infoFieldInput">
						      		</div>
						      		<!-- <div class="col s1 editFieldsDiv">
						    			<a class="modal-trigger" href="#modal1"><i class="material-icons prefix editFieldIcon">mode_edit</i></a>
						      		</div> -->
						      	</div>
							</div>
							<div class="row noMargin">
						      	<div class="col s2 infoFieldDiv">
						    		<label class="infoFieldLabel" for="email">Email</label>
						      	</div>
						      	<div class="col s10">
						      		<div class="col s11">
						    			<input id="email" type="text" disabled value="james@gmail.com" class="infoFieldInput">
						      		</div>
						      		<!-- <div class="col s1 editFieldsDiv">
						    			<a class="modal-trigger" href="#modal2"><i class="material-icons prefix editFieldIcon">mode_edit</i></a>
						      		</div> -->
						      	</div>
							</div>
							<div class="row noMargin">
						      	<div class="col s2 infoFieldDiv">
						    		<label class="infoFieldLabel" for="phone">Phone</label>
						      	</div>
						      	<div class="col s10">
						      		<div class="col s11">
						    			<input id="phone" type="number" disabled value="0123456789" class="infoFieldInput">
						      		</div>
						      		<!-- <div class="col s1 editFieldsDiv">
						    			<a class="modal-trigger" href="#modal2"><i class="material-icons prefix editFieldIcon">mode_edit</i></a>
						      		</div> -->
						      	</div>
						      	<div class="col s2 infoFieldDiv">
						    		<label class="infoFieldLabel" for="fax">Fax</label>
						      	</div>
						      	<div class="col s10">
						      		<div class="col s11">
						    			<input id="fax" type="number" disabled value="0123456789" class="infoFieldInput">
						      		</div>
						      		<!-- <div class="col s1 editFieldsDiv">
						    			<a class="modal-trigger" href="#modal2"><i class="material-icons prefix editFieldIcon">mode_edit</i></a>
						      		</div> -->
						      	</div>
							</div>
						</div>
						<div class="col s5">
							<div class="row noMargin">
						      	<div class="col s3 infoFieldDiv">
						    		<label class="infoFieldLabel" for="fax">Employer</label>
						      	</div>
						      	<div class="col s9">
						      		<div class="col s10">
						    			<input id="fax" type="text" disabled value="Cloud Basha Sdn Bhd" class="infoFieldInput">
						      		</div>
						      		<!-- <div class="col s1 editFieldsDiv">
						    			<a class="modal-trigger" href="#modal2"><i class="material-icons prefix editFieldIcon">mode_edit</i></a>
						      		</div> -->
						      	</div>
						      	<div class="col s3 infoFieldDiv">
						    		<label class="infoFieldLabel" for="fax">Position</label>
						      	</div>
						      	<div class="col s9">
						      		<div class="col s10">
						    			<input id="fax" type="text" disabled value="CTO" class="infoFieldInput">
						      		</div>
						      		<!-- <div class="col s1 editFieldsDiv">
						    			<a class="modal-trigger" href="#modal2"><i class="material-icons prefix editFieldIcon">mode_edit</i></a>
						      		</div> -->
						      	</div>
						      	<div class="col s3 infoFieldDiv">
						    		<label class="infoFieldLabel" for="phone">Phone</label>
						      	</div>
						      	<div class="col s9">
						      		<div class="col s10">
						    			<input id="phone" type="number" disabled value="0123456789" class="infoFieldInput">
						      		</div>
						      		<!-- <div class="col s1 editFieldsDiv">
						    			<a class="modal-trigger" href="#modal2"><i class="material-icons prefix editFieldIcon">mode_edit</i></a>
						      		</div> -->
						      	</div>
						      	<div class="col s3 infoFieldDiv">
						    		<label class="infoFieldLabel" for="fax">Fax</label>
						      	</div>
						      	<div class="col s9">
						      		<div class="col s10">
						    			<input id="fax" type="number" disabled value="0123456789" class="infoFieldInput">
						      		</div>
						      		<!-- <div class="col s1 editFieldsDiv">
						    			<a class="modal-trigger" href="#modal2"><i class="material-icons prefix editFieldIcon">mode_edit</i></a>
						      		</div> -->
						      	</div>
							</div>
			   			</div>
					</div>
					<div class="row">
						<div class="col editParentButton">
			   				<a class="waves-effect waves-light btn modal-trigger" href="#editParentModal">Edit</a>	
		   			  	</div>
					</div>
					<div class="row">
						<div class="col s12 m4">
						  <div class="input-field col s12">
						    <textarea disabled id="textarea1" class="materialize-textarea">No 20, Jalan SS 14/48, Petaling Jaya, 47123, Selangor</textarea>
						    <label for="textarea1" class="black-text activityLabel">Home Address</label>
						  </div>
						</div>
						<div class="col s12 m4">
						  <div class="input-field col s12">
						    <textarea disabled id="textarea1" class="materialize-textarea">No 20, Jalan SS 14/48, Petaling Jaya, 47123, Selangor</textarea>
						    <label for="textarea1" class="black-text activityLabel">Work Address</label>
						  </div>
						</div>
				       	<div class="col s12 m4">
				         <div class="card white darken-1">
				           <div class="card-content">
				           	<div class="center addButtonDiv">
				           		<a class="waves-effect waves-light btn btn-block"><i class="material-icons left">add</i>Message</a>
				           	</div>
				           	<div class="center addButtonDiv">
				           		<a class="waves-effect waves-light btn btn-block"><i class="material-icons left">add</i>Photo</a>
				           	</div>
				           	<div class="center addButtonDiv">
				           		<a class="waves-effect waves-light btn btn-block"><i class="material-icons left">add</i>Note</a>
				           	</div>
				           </div>
				         </div>
				       	</div>
					</div>
					<div class="row">
						<h5 class="black-text col s12">Children</h5>
			           	<div class="col s2"><img style="width:80px;height:80px;" src="images/yuna.jpg" alt="" class="circle"></div>
			           	<div class="col s2"><img style="width:80px;height:80px;" src="images/yuna.jpg" alt="" class="circle"></div>			           	
			           	<div class="col s2"><img style="width:80px;height:80px;" src="images/yuna.jpg" alt="" class="circle"></div>		           	
			           	<div class="col s2"><img style="width:80px;height:80px;" src="images/yuna.jpg" alt="" class="circle"></div>
			           	<div class="col s2">
			           		<a class="btn-floating btn-large waves-effect waves-light red modal-trigger"><i class="material-icons">add</i></a>
		           		</div>
					</div>
					<div class="row appActivityDiv">
						<span class="col s6">Android App User on 17/10/16</span>
						<span class="col s6">Invited: 17/9/16 9:01am</span>
					</div>
					<div class="row appActivityDiv">
						<span class="col s6 offset-s6">Accepted: 17/9/16 11:01am</span>
					</div>
					<div class="row" style="padding: 10px;">
						<div class="col s8 card darken-1">
				            <div class="card-content black-text">
								<h5 class="col s12 noPaddingLeft">Additional Fields</h5>
				            	<div class="row">
					            	<label class="col s3 black-text activityLabel">
					            		Alternate Email:
					            	</label> 	
					            	<div class="col s8 parentAlternateEmail">
				            		 	<input placeholder="Email Address" type="email" class="validate">
					            	</div> 
					            	<div class="col s1">
										<a onclick=""><img src="<%=request.getContextPath()%>/images/add.png" width="30px" height="30px" /></a>
					            	</div>
				            	</div> 
				            	<div class="row">
				            		<label class="col s3 black-text healthCheckSelect activityLabel">
					            		<select>
									      <option value="" disabled selected>Field Name</option>
									      <option value="1">Option 1</option>
									      <option value="2">Option 2</option>
									      <option value="3">Option 3</option>
									    </select>
					            	</label> 	
					            	<div class="col s8 parentAlternateEmail">
				            		 	<input placeholder="" type="text" class="validate">
					            	</div> 
								    <div class="col s1">
										<a onclick=""><img src="<%=request.getContextPath()%>/images/add.png" width="30px" height="30px" /></a>
					            	</div>
				            	</div>
				            	<div class="row">
				            		<label class="col s3 black-text activityLabel">
					            		Nickname:
					            	</label> 	
					            	<div class="col s8 parentAlternateEmail">
				            		 	<input placeholder="" type="text" class="validate" value="Trax">
					            	</div> 
				            	</div>
				            	<div class="row">
				            		<label class="col s3 activityLabel left-20">Sex</label>
									<div class="healthCheckSelect col s8">
									    <select>
									      <option value="" disabled selected>Choose your gender</option>
									      <option value="1">Male</option>
									      <option value="2">Female</option>
									    </select>
								  	</div>
				            	</div>
				            	<div class="row">
				            		<div class="col offset-s6">
					            		<a class="waves-effect waves-light btn" href="">Save</a>
		           						<a class="waves-effect waves-light btn" href="">Cancel</a>
				            		</div>
				            	</div>
				            </div>
			          	</div>
			          	<div class="col s3 offset-s1 card darken-1">
				            <div class="card-content black-text noPaddingLeft" style="padding-bottom: 5px;">
				            	<div class="row">
					            	<div class="col s10">
					            		<span># of Logins: </span>
					            	</div>
					            	<div class="col s2">
					            		<span>10</span>
					            	</div>
				            	</div>
				            	<div class="row">
					            	<div class="col s10">
					            		<span># of Photo Views: </span>
					            	</div>
					            	<div class="col s2">
					            		<span>20</span>
					            	</div>
				            	</div>
				            </div>
			            </div>
					</div>
					<div class="row">
						<div class="parentTableDiv col s12">
				   			<h5 class="black-text col s12">Payment History</h5>
				   			<div class="col s12">
				   				<table class="bordered">
							        <thead>
							          <tr>
							              <th data-field="id">Bill Id</th>
							              <th data-field="name">Month</th>
							              <th data-field="price">Due Date</th>
							              <th data-field="price">Amount</th>
							              <th data-field="price">Payment Date</th>
							              <th data-field="price">Paid Amount</th>
							              <th data-field="price">Outstanding</th>
							          </tr>
							        </thead>
							
							        <tbody>
							          <tr>
							            <td>123</td>
							            <td>August</td>
							            <td>28/09/2016</td>
							            <td>Rm. 1000</td>
							            <td>25/09/2016</td>
							            <td>Rm. 1000</td>
							            <td>Rm. 0</td>
							          </tr>
							          <tr>
							             <td>124</td>
							            <td>September</td>
							            <td>28/10/2016</td>
							            <td>Rm. 2000</td>
							            <td>25/10/2016</td>
							            <td>Rm. 1000</td>
							            <td>Rm. 1000</td>
							          </tr>
							          <tr>
							             <td>125</td>
							            <td>October</td>
							            <td>28/11/2016</td>
							            <td>Rm. 1000</td>
							            <td>25/11/2016</td>
							            <td>Rm. 500</td>
							            <td>Rm. 1500</td>
							          </tr>
							        </tbody>
							      </table>
					  		</div>
			       		</div>
			  		</div>
	       		</div>
	      	</div>
		</div>
	  </div>
	</div>
</div>

<div id="editParentModal" class="modal">
   <div class="modal-content">
     <h4>Edit Parent</h4>
     <div class="row">
	     <div class="input-field col s6">
		     <input placeholder="Full Name" id="name" type="text" value="Max Millian" class="validate infoFieldInput registrationInput">
		     <label for="name" class="activityLabel">Full Name</label>
	     </div>
	     <div class="input-field col s6">
		     <input placeholder="Email" id="dob" type="text" value="12 Jan 2011" class="validate infoFieldInput registrationInput">
		     <label for="dob" class="activityLabel">Email</label>
	     </div>
     </div>
     <div class="row">
	     <div class="input-field col s6">
		     <input placeholder="Phone" id="phone" type="number" value="0123456789" class="validate infoFieldInput registrationInput">
		     <label for="phone" class="activityLabel">Phone</label>
	     </div>
	     <div class="input-field col s6">
		     <input placeholder="Fax" id="fax" type="number" value="03561234567" class="validate infoFieldInput registrationInput">
		     <label for="fax" class="activityLabel">Fax</label>
	     </div>
     </div>
     <div class="row">
     	 <div class="input-field col s6">
		  <textarea id="textarea1" class="materialize-textarea">No 20, Jalan SS 14/48, Petaling Jaya, 47123, Selangor</textarea>
		  <label for="textarea1" class="black-text activityLabel">Work Address</label>
		 </div>
	     <div class="input-field col s6">
		  <textarea id="textarea1" class="materialize-textarea">No 20, Jalan SS 14/48, Petaling Jaya, 47123, Selangor</textarea>
		  <label for="textarea1" class="black-text activityLabel">Home Address</label>
		 </div>
     </div>
     <div class="row">
	     <div class="input-field col s6">
		     <input placeholder="Employer Name" id="empName" type="text" value="Cloud Basha Sdn Bhd" class="validate infoFieldInput registrationInput">
		     <label for="empName" class="activityLabel">Employer Name</label>
	     </div>
	     <div class="input-field col s6">
		     <input placeholder="Position" id="position" type="text" value="12 Jan 2011" class="validate infoFieldInput registrationInput">
		     <label for="position" class="activityLabel">Position</label>
	     </div>
     </div>
     <div class="row">
	     <div class="input-field col s6">
		     <input placeholder="Employer Phone Number" id="empphone" type="number" value="0123456789" class="validate infoFieldInput registrationInput">
		     <label for="empphone" class="activityLabel">Employer Phone Number</label>
	     </div>
	     <div class="input-field col s6">
		     <input placeholder="Employer Fax" id="empfax" type="number" value="03561234567" class="validate infoFieldInput registrationInput">
		     <label for="empfax" class="activityLabel">Employer Fax</label>
	     </div>
     </div>
   </div>
   <div class="modal-footer">
		<a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat ">Cancel</a>
     	<a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Save</a>
   </div>
</div>

<div id="addParentsModal" class="modal">
   <div class="modal-content">
		<h4>Add Parent</h4>
		<div class="row">
			<div class="input-field col s6">
			 <input placeholder="Full Name" id="name" type="text" class="validate infoFieldInput registrationInput">
			 <label for="name" class="activityLabel">Full Name</label>
			</div>
			<div class="input-field col s6">
			 <input placeholder="Email" id="email" type="email" class="validate infoFieldInput registrationInput">
			 <label for="email" class="activityLabel">Email</label>
			</div>
		</div>
		<div class="modal-footer">
			<a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat ">Cancel</a>
		   	<a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Save</a>
		</div>
	</div>
</div>

<div id="uploadParents" class="modal">
    <div class="modal-content">
		<h4>Upload Parents</h4>
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

<script type="text/javascript">
	$(document).ready(function(){
		/* $('#studentInfoDiv').css('display', 'none'); */
		$('.carousel').carousel();
		window.setInterval(function(){$('.carousel').carousel('next')},3000);
		
		$('.collapsible').collapsible({
	      accordion : false
	    });
    });
</script>