<div id="othersTab" class="col s12 m12 l12">
	<div id="othersInfoDiv" class="studentTabDiv">
		<div class="row">
	       <div class="col s12 m12">
	         <div class="card darken-1">
	           	<div class="card-content">
		       		<div class="row noMargin">
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
						    		<label class="infoFieldLabel" for="phone">Mobile</label>
						      	</div>
						      	<div class="col s10">
						      		<div class="col s11">
						    			<input id="phone" type="number" disabled value="0123456789" class="infoFieldInput">
						      		</div>
						      		<!-- <div class="col s1 editFieldsDiv">
						    			<a class="modal-trigger" href="#modal2"><i class="material-icons prefix editFieldIcon">mode_edit</i></a>
						      		</div> -->
						      	</div>
					      	</div>
						</div>
						<div class="col s5">
							<div class="col s12 m12 noPadding">
							  <div class="input-field col s12">
							    <textarea disabled id="textarea1" class="materialize-textarea">No 20, Jalan SS 14/48, Petaling Jaya, 47123, Selangor</textarea>
							    <label for="textarea1" class="black-text activityLabel infoFieldLabel">Home Address</label>
							  </div>
							</div>
			   			</div>
			   			<div class="col s5">
							<div class="col s12 infoFieldDiv">
					    		<label class="infoFieldLabel" for="servType">Service Type</label>
					      	</div>
					      	<div style="padding-top:10px;" class="col s12">
				    			<span id="servType" class="infoFieldInput activityLabel">Driver, Plumber, Cleaner</span>
					      	</div>
			   			</div>
					</div>
					<div class="row">
						<div class="col editParentButton">
			   				<a class="waves-effect waves-light btn modal-trigger" href="#editOthersModal">Edit</a>	
		   			  	</div>
					</div>
					<div class="row">
						<div class="col editParentButton">
			   				<a class="waves-effect waves-light btn modal-trigger" href="#addOthersModal"><i class="material-icons left">add</i>Others</a>	
		   			  	</div>
					</div>
					<div class="row">
						<div class="parentTableDiv col s8">
				   			<h5 class="black-text col s12">Activity History</h5>
				   			<div class="col s12">
				   				<table class="bordered">
							        <thead>
							          <tr>
							              <th data-field="id">Month</th>
							              <th data-field="name">Working Days</th>
							              <th data-field="price">Late</th>
							              <th data-field="price">Early</th>
							              <th data-field="price">Cum. Mins</th>
							          </tr>
							        </thead>
							
							        <tbody>
							          <tr>
							            <td>Oct 16</td>
							            <td>3</td>
							            <td>0</td>
							            <td>3</td>
							            <td>0.0</td>
							          </tr>
							          <tr>
							            <td>Sep 16</td>
							            <td>27</td>
							            <td>1</td>
							            <td>26</td>
							            <td>3.1</td>
							          </tr>
							          <tr>
							            <td>Aug 16</td>
							            <td>21</td>
							            <td>2</td>
							            <td>19</td>
							            <td>145.3</td>
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

<div id="addOthersModal" class="modal">
   <div class="modal-content">
	     <h4>Edit Others</h4>
	     <div class="row">
		     <div class="input-field col s6">
			     <input placeholder="Full Name" id="name" type="text" class="validate infoFieldInput registrationInput">
			     <label for="name" class="activityLabel">Full Name</label>
		     </div>
		     <div class="input-field col s6">
			     <input placeholder="Email" id="dob" type="text" class="validate infoFieldInput registrationInput">
			     <label for="dob" class="activityLabel">Email</label>
		     </div>
	     </div>
	     <div class="row">
		     <div class="input-field col s6">
			     <input placeholder="Mobile" id="name" type="text" class="validate infoFieldInput registrationInput">
			     <label for="name" class="activityLabel">Mobile</label>
		     </div>
		     <div class="input-field col s6">
			  <textarea id="textarea1" class="materialize-textarea"></textarea>
			  <label for="textarea1" class="black-text activityLabel">Home Address</label>
			 </div>
	     </div>
	     <div class="row">
	     	<div class="input-field col s12">
			    <select multiple>
			      <option value="" disabled selected>Choose your option</option>
			      <option value="1">Driver</option>
			      <option value="2">Caterer</option>
			      <option value="3">Plumber</option>
			      <option value="4">Carpenter</option>
			      <option value="5">Contractor</option>
			      <option value="4">Dispatch</option>
			      <option value="5">Cook</option>
			      <option value="5">Cleaner</option>
			    </select>
			    <label class="activityLabel">Service Type</label>
		  	</div>
	   </div>
	   <div class="modal-footer">
			<a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat ">Cancel</a>
	     	<a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Save</a>
	   </div>
	</div>
</div>

<div id="editOthersModal" class="modal">
   <div class="modal-content">
	     <h4>Edit Others</h4>
	     <div class="row">
		     <div class="input-field col s6">
			     <input placeholder="Full Name" id="name" type="text" value="James Millian" class="validate infoFieldInput registrationInput">
			     <label for="name" class="activityLabel">Full Name</label>
		     </div>
		     <div class="input-field col s6">
			     <input placeholder="Email" id="dob" type="text" value="james@gmail.com" class="validate infoFieldInput registrationInput">
			     <label for="dob" class="activityLabel">Email</label>
		     </div>
	     </div>
	     <div class="row">
		     <div class="input-field col s6">
			     <input placeholder="Mobile" id="name" type="text" value="012345678" class="validate infoFieldInput registrationInput">
			     <label for="name" class="activityLabel">Mobile</label>
		     </div>
		     <div class="input-field col s6">
			  <textarea id="textarea1" class="materialize-textarea">No 20, Jalan SS 14/48, Petaling Jaya, 47123, Selangor</textarea>
			  <label for="textarea1" class="black-text activityLabel">Home Address</label>
			 </div>
	     </div>
	     <div class="row">
	     	<div class="input-field col s12">
			    <select multiple>
			      <option value="" disabled selected>Choose your option</option>
			      <option value="1">Driver</option>
			      <option value="2">Caterer</option>
			      <option value="3">Plumber</option>
			      <option value="4">Carpenter</option>
			      <option value="5">Contractor</option>
			      <option value="4">Dispatch</option>
			      <option value="5">Cook</option>
			      <option value="5">Cleaner</option>
			    </select>
			    <label class="activityLabel">Service Type</label>
		  	</div>
	   </div>
	   <div class="modal-footer">
			<a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat ">Cancel</a>
	     	<a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Save</a>
	   </div>
	</div>
</div>