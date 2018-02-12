<div id="programTab" ng-controller="programController">
	<div class="row">
		<div class="col s12 m9 l9">
			<ul class="collapsible" data-collapsible="accordion">
				<li ng-repeat="program in programs">
					<div class="collapsible-header">
						<i class="material-icons">filter_drama</i>{{program.programName}}
						<div style="position: relative;top: 5px;" class="col right">
						<a ng-click="editProgram(program)" class="tooltipped" data-position="bottom" data-delay="50"
						data-tooltip="Edit"><img src="<%=request.getContextPath()%>/images/edit.png"
							width="20px" height="20px" /></a>
						<a ng-click="showDeleteProgramConfirm(program)" class="tooltipped" data-position="bottom"
						data-delay="50" data-tooltip="Remove"><img
							src="<%=request.getContextPath()%>/images/delete.png" width="20px" height="20px" /></a>
					</div>
					</div>
					<div class="collapsible-body">
						<div class="sc_pro_container">
							<div class="row">
								<div class="col s6 m6 l6 input-field">
									<input type="text" id="programName" disabled="disabled" ng-value="program.programName"/> <label for="programName">Program
										Name</label>
								</div>
								<div class="col s6 m6 l6 input-field">
									<input type="text" id="programDesc" disabled="disabled" ng-value="program.programDescription"/> <label for="programDesc">Description</label>
								</div>
							</div>
							<div class="row">
								<div class="col s6 m6 l6 input-field">
									<input type="text" id="programStartAge" disabled="disabled" ng-value="program.startAge"/> <label for="programStartAge">Start Age</label>
								</div>
								<div class="col s6 m6 l6 input-field">
									<input type="text" id="programEndAge" disabled="disabled" ng-value="program.endAge"/> <label for="programEndAge">End Age</label>
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
					<a href="#selectProgramModal"
						class="waves-effect waves-teal btn categories_selection modal-trigger"><i
						class="material-icons left">add</i>Select Program</a>
				</div>
			</div>
			<div class="row">
				<div class="col s12 m12 l12">
					<a href="#createProgramModal"
						class="waves-effect waves-teal btn categories_selection modal-trigger"><i
						class="material-icons left">add</i>New Program</a>
				</div>
			</div>
		</div>
	</div>

	<div id="selectProgramModal" class="modal modal-fixed-footer selectProgramModal">
		<div class="modal-content">
			<div class="row">
				<h5 class="Lato_normal_font">Select Programs</h5>
			</div>
			<div class="row">
				<p>
					<input type="checkbox" class="filled-in" id="prog_1" checked="checked" /> <label for="prog_1">Infant
						Program</label>
				</p>
				<p>
					<input type="checkbox" class="filled-in" id="prog_2" checked="checked" /> <label for="prog_2">Toddler
						Program</label>
				</p>
				<p>
					<input type="checkbox" class="filled-in" id="prog_3" checked="checked" /> <label for="prog_3">Daycare</label>
				</p>
				<p>
					<input type="checkbox" class="filled-in" id="prog_4" checked="checked" /> <label for="prog_4">Play
						School</label>
				</p>
				<p>
					<input type="checkbox" class="filled-in" id="prog_5" /> <label for="prog_5">Pre School</label>
				</p>
			</div>
		</div>
		<div class="modal-footer">
			<a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Cancel</a> <a
				href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Save</a>
		</div>
	</div>
	
	<div id="createProgramModal" class="modal modal-fixed-footer createProgramModal">
		<div class="modal-content">
			<div class="row">
				<h5 class="Lato_normal_font">New Program</h5>
			</div>
			<div class="row">
				<div class="col s12 m12 l12 input-field">
					<input type="text" class="validate" id="newProgramName" ng-model="programName"/> <label for="newProgramName">Name</label>
				</div>
				<div class="col s12 m12 l12 input-field">
					<input type="text" class="validate" id="newProgramDesc" ng-model="programDecription"/> <label for="newProgramDesc">Description</label>
				</div>
				<div class="col s12 m12 l12 input-field">
					<input type="number" class="validate" id="newProgramStartAge" ng-model="programStartAge"/> <label for="newProgramStartAge">Start Age</label>
				</div>
				<div class="col s12 m12 l12 input-field">
					<input type="number" class="validate" id="newProgramEndAge" ng-model="programEndAge"/> <label for="newProgramEndAge">End Age</label>
				</div>
				
			</div>
		</div>
		<div class="modal-footer">
			<a class=" modal-action modal-close waves-effect waves-green btn-flat">Cancel</a> <a
				ng-click="createProgram()" class=" modal-action modal-close waves-effect waves-green btn-flat">Create</a>
		</div>
	</div>
	
	<div id="editProgramModal" class="modal modal-fixed-footer createProgramModal">
		<div class="modal-content">
			<div class="row">
				<h5 class="Lato_normal_font">Edit Program</h5>
			</div>
			<div class="row">
				<div class="col s12 m12 l12 input-field">
					<input type="text" class="validate" id="newProgramName" ng-model="editProgramName"/> <label for="newProgramName">Name</label>
				</div>
				<div class="col s12 m12 l12 input-field">
					<input type="text" class="validate" id="newProgramDesc" ng-model="editProgramDecription"/> <label for="newProgramDesc">Description</label>
				</div>
				<div class="col s12 m12 l12 input-field">
					<input type="number" class="validate" id="newProgramStartAge" ng-model="editProgramStartAge"/> <label for="newProgramStartAge">Start Age</label>
				</div>
				<div class="col s12 m12 l12 input-field">
					<input type="number" class="validate" id="newProgramEndAge" ng-model="editProgramEndAge"/> <label for="newProgramEndAge">End Age</label>
				</div>
				
			</div>
		</div>
		<div class="modal-footer">
			<a class=" modal-action modal-close waves-effect waves-green btn-flat">Cancel</a> <a
				ng-click="submitEditProgram()" class=" modal-action modal-close waves-effect waves-green btn-flat">Edit</a>
		</div>
	</div>
	
	<div id="deleteProgramConfirmModal" class="modal modal-fixed-footer deleteSchoolModal">
		<div class="modal-content">
			Are you sure you want to delete <b>{{deleteProgramName}}</b>?
		</div>
		<div class="modal-footer">
			<a href="#!"
				class=" modal-action modal-close waves-effect waves-green btn-flat">Cancel</a>
			<button
				class="btn-flat modal-action modal-close waves-effect waves-light" ng-click="deleteProgram()">Delete
			</button>
		</div>
	</div>

</div>