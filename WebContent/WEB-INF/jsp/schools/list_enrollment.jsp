<div id="school_enrollment_div" class="school_enrollment_div" ng-controller="enrollmentController">
	<div class="row">
		<div class="col s12 m9 l9">
			<ul class="collapsible" data-collapsible="accordion">
				<li ng-repeat="enrollment in enrollments track by $index">
					<div class="collapsible-header">
						<div class="row noMargin">
							<div class="col">
								<i class="material-icons">filter_drama</i>{{enrollment.enrollmentName}}
							</div>
							<%-- <div style="position: relative;top: 5px;" class="col right">
								<a ng-click="editMenu(menu)" class="tooltipped" data-position="bottom" data-delay="50"
								data-tooltip="Edit"><img src="<%=request.getContextPath()%>/images/edit.png"
									width="20px" height="20px" /></a> 
								<a ng-click="showDeleteMenuConfirm(menu)" class="tooltipped" data-position="bottom"
								data-delay="50" data-tooltip="Remove"><img
									src="<%=request.getContextPath()%>/images/delete.png" width="20px" height="20px" /></a>
							</div> --%>
						</div>
					</div>
					<div class="collapsible-body">
						<div class="sc_pro_container">
							<div class="row">
								<div class="col s6 m6 l6 input-field">
									<input type="text" id="enrollmentName" disabled="disabled" ng-value="enrollment.enrollmentName"/> <label for="enrollmentName">Enrollment
										Name</label>
								</div>
								<div class="col s6 m6 l6 input-field">
									<input type="text" id="calendarName" disabled="disabled" ng-value="enrollment.calendar.calendarName"/> <label for="calendarName">Calendar Name</label>
								</div>
							</div>
							<div class="row">
								<div class="col s6 m6 l6 input-field">
									<input type="text" id="schoolName" disabled="disabled" ng-value="enrollment.school.schoolName"/> <label for="schoolName">School Name</label>
								</div>
								<div class="col s6 m6 l6 input-field">
									<input type="text" id="programName" disabled="disabled" ng-value="enrollment.program.programName"/> <label for="programName">Program Name</label>
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
					<a href="#createEnrollmentModal"
						class="waves-effect waves-teal btn categories_selection modal-trigger"><i
						class="material-icons left">add</i>Create Enrollment</a>
				</div>
			</div>
			<div class="row sc_prog_right_options">
				<div class="col s12 m12 l12">
					<a href="#createEnrollmentStudentModal"
						class="waves-effect waves-teal btn categories_selection modal-trigger"><i
						class="material-icons left">add</i>Enroll Student</a>
				</div>
			</div>
		</div>
	</div>

	<div id="createEnrollmentModal" class="modal modal-fixed-footer createMealModal">
		<div class="modal-content">
			<div class="row">
				<h5 class="Lato_normal_font">New Enrollment</h5>
			</div>
			<div class="col s12 m6 l6 input-field">
				<input type="text" id="c_enrollmentName" empty-input ng-model="enrollmentName" /> <label for="c_enrollmentName">Enrollment Name</label>
			</div>
			<div class="col s12 m6 l6 input-field">
				<select ng-model="programId" ng-options="program.programId as program.programName for program in programs" >
					<option value="" disabled selected>Select Program</option>
				</select> <label>Programs</label>
			</div>
			<div class="col s12 m6 l6 input-field">
				<select ng-model="schoolId" ng-options="school.schoolId as school.schoolName for school in schools" >
					<option value="" disabled selected>Select School</option>
				</select> <label>School</label>
			</div>
			<div class="col s12 m6 l6 input-field">
				<select ng-model="calendarId" ng-options="calendar.calendarId as calendar.calendarName for calendar in calendars" >
					<option value="" disabled selected>Select Calendar</option>
				</select> <label>Calendars</label>
			</div>
		</div>
		<div class="modal-footer">
			<a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Cancel</a> 
			<a class=" modal-action modal-close waves-effect waves-green btn-flat" ng-click="createEnrollment()">Create</a>
		</div>
	</div>
	
	<div id="createEnrollmentStudentModal" class="modal modal-fixed-footer createMealModal">
		<div class="modal-content">
			<div class="row">
				<h5 class="Lato_normal_font">Enroll Student</h5>
			</div>
			<div class="col s12 m6 l6 input-field">
				<select ng-model="enrollmentId" ng-options="enrollment.enrollmentId as enrollment.enrollmentName for enrollment in enrollments" >
					<option value="" disabled selected>Select Enrollment</option>
				</select> <label>Enrollments</label>
			</div>
			<div class="col s12 m6 l6 input-field">
				<i class="material-icons prefix">textsms</i>
				<input type="text" id="autocomplete-input" class="autocompleteInput" ng-model="searchParams" ng-focus="showAutocompleteList()">
				<label for="autocomplete-input">Search Students</label>
				<ul ng-show="showResults" class="col s10 offset-s2 autoCompleteList">
			        <li class="autoCompleteItem" ng-repeat="student in students | myFilter:searchParams" ng-click="selectStudent(student)">
			          {{student.name}}
			        </li>
			    </ul>
			</div>
		</div>
		<div class="modal-footer">
			<a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Cancel</a> 
			<a class=" modal-action modal-close waves-effect waves-green btn-flat" ng-click="createEnrollmentStudent()">Enroll</a>
		</div>
	</div>
</div>