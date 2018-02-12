<div id="school_calendar_div" class="school_calendar_div" ng-controller="calendarController">
	<div class="col s12 m3 l3 right">
		<div class="row sc_prog_right_options">
			<div class="col s12 m12 l12">
				<a href="#createCalendarModal"
					class="waves-effect waves-teal btn categories_selection modal-trigger"><i
					class="material-icons left">add</i>Create Calendar</a>
			</div>
		</div>
	</div>
	<div class="col s12">
		<div class="row container_margin">
		
			<ul class="collapsible" data-collapsible="accordion">
			    <li ng-repeat="calendar in calendars">
			      <div class="collapsible-header" ng-click="initializeCalendar($index)"><i class="material-icons">filter_drama</i>{{calendar.calendar.calendarName}}</div>
			      <div class="collapsible-body calendarCollapsible">
					<div class="col s12 m12 offset-l1 l10" ng-click="getCalendarId($index)">
						<div id="calendar_{{$index}}" style="padding-top: 20px;"></div>
					</div>
			      </div>
			    </li>
			</ul>
		</div>
	</div>
	
	<div id="createCalendarModal" class="modal modal-fixed-footer createMenuModal">
		<div class="modal-content">
			<div class="row">
				<h5 class="Lato_normal_font">New Calendar</h5>
			</div>
			<div class="row sc_pro_row form_view_row">
				<div class="col s12 m12 l12 input-field">
					<input type="text" id="c_calendarName" empty-input ng-model="calendarName" /> <label for="c_calendarName">Calendar Name</label>
				</div>
			</div>
		</div>
		<div class="modal-footer">
			<a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Cancel</a> <a
				href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat" ng-click="createCalendar()">Create</a>
		</div>
	</div>
	
	function eventTrigger(ev) {
		console.log('Event trigged: ' + ev._id);
		$('#emTitle').attr('value', ev.title + ev.description);
		//$('#emStartTime').attr('value', ev.start._i);
		$('#eventModal').openModal();
		initiateEventTimePicker();

	}

	<div id="createEventModal" class="modal modal-fixed-footer createEventModal">
		<div class="modal-content createEventModalContent">
			<div class="row">
				<div class="col s12 m12 l12 input-field">
					<input id="cemTitle" type="text" ng-model="calendarName" disabled> 
					<label for="cemTitle">Calendar Name</label>
				</div>
			</div>
			<div class="row">
				<div class="col s12 m12 l12 input-field">
					<input id="cemEventName" type="text" ng-model="event.eventName"> 
					<label for="cemEventName">Event Name</label>
				</div>
			</div>
			<div class="row">
				<div class="col s12 m6 l6 input-field">
					<input input-date type="text" id="startDate" format="dd/mm/yyyy" ng-model="event.selectedStartDate">
					<label for="startDate">Start Date</label>
				</div>
				<div class="col s12 m6 l6 input-field">
					<input input-date type="text" id="endDate" format="dd/mm/yyyy" ng-model="event.selectedEndDate">
					<label for="endDate">End Date</label>
				</div>
			</div>
			<div class="row">
				<div class="col s12 m6 l6 input-field">
					<input id="input_starttime" input-clock data-twelvehour="false" type="text" ng-model="event.selectedStartTime">
					<label for="input_starttime">Start Time</label>
				</div>
				<div class="col s12 m6 l6 input-field">
					<input id="input_endtime" input-clock data-twelvehour="false" type="text" ng-model="event.selectedEndTime">
					<label for="input_endtime">End Time</label>
				</div>
			</div>
			<div class="row">
				<div class="col s6">
					<div class="col s12 m12 l12 input-field">
						<select ng-model="event.activityId" ng-options="activity.activityId as activity.activityName for activity in activities" >
							<option value="" disabled selected>Select Activity</option>
						</select> <label>Activity</label>
					</div>
					<div class="col s12 m12 l12" style="padding-bottom: 15px;">
						<label style="color:black;font-size: 15px;">Or</label>
					</div>
					<div class="col s12 m12 l12 input-field">
						<select ng-model="event.mealId" ng-options="meal.mealId as meal.mealName for meal in meals" >
							<option value="" disabled selected>Select Meal</option>
						</select> <label>Meal</label>
					</div>
				</div>
				<div class="col s6">
					<div class="col s12 m12 l12 input-field">
						<select ng-model="event.roomId" ng-options="room.roomId as room.roomName for room in rooms" >
							<option value="" disabled selected>Select Room</option>
						</select> <label>Select Room</label>
					</div>
					<div class="col s12 m12 l12" style="padding-bottom: 15px;">
						<label style="color:black;font-size: 15px;">And</label>
					</div>
					<div class="col s12 m12 l12 input-field">
						<select ng-model="event.teacherId" ng-options="teacher.teacherId as teacher.teacherName for teacher in teachers" >
							<option value="" disabled selected>Select Teacher</option>
						</select> <label>Teacher</label>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="col s12 m12 l12">
					<label>Repeat</label>
				</div>
				<div class="col s12 m12 l12">
					<table class="repeatTable">
						<thead>
							<tr>
								<th>Mon</th>
								<th>Tue</th>
								<th>Wed</th>
								<th>Thur</th>
								<th>Fri</th>
								<th>Sat</th>
								<th>Sun</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>
									<input type="checkbox" id="mon" ng-model="event.monday"/>
									<label for="mon"></label>
								</td>
								<td>
									<input type="checkbox" id="tue" ng-model="event.tuesday"/>
									<label for="tue"></label>
								</td>
								<td>
									<input type="checkbox" id="wed" ng-model="event.wednesday"/>
									<label for="wed"></label>
								</td>
								<td>
									<input type="checkbox" id="thur" ng-model="event.thursday"/>
									<label for="thur"></label>
								</td>
								<td>
									<input type="checkbox" id="fri" ng-model="event.friday"/>
									<label for="fri"></label>
								</td>
								<td>
									<input type="checkbox" id="sat" ng-model="event.saturday"/>
									<label for="sat"></label>
								</td>
								<td>
									<input type="checkbox" id="sun" ng-model="event.sunday"/>
									<label for="sun"></label>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="modal-footer">
			<a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Cancel</a> 
			<a ng-click="createEvent()" class=" modal-action modal-close waves-effect waves-green btn-flat">Create</a>
		</div>
	</div>
</div>