<%@include file="header.jsp"%>
<%
	String action = (String) request.getAttribute("action");
%>
<script>
var action ='<%=action%>';

$(document).ready(function(){
	
	$('#loadOrganizationInfo').click(function(event){
		   var schoolId = $('#schoolId').val();	
		   window.location.href="<%=request.getContextPath()%>/cms/loadOrganizationInfo/"+schoolId;
	    });	
	
	$('#listAllDailyProgram').click(function(event){
		   var schoolId = $('#schoolId').val();	
		   window.location.href="<%=request.getContextPath()%>/cms/listDailyProgram/"+schoolId;
	    });
	
	$('#listAllSchoolProgram').click(function(event){
		   var schoolId = $('#schoolId').val();	
		   window.location.href="<%=request.getContextPath()%>/cms/listSchoolProgram/"+schoolId;
	    });
	
	$('#editSchoolProgram').click(function(event){
	   var schoolId = $('#schoolId').val();	
	   var title = $(this).attr('title');
	   window.location.href="<%=request.getContextPath()%>/cms/editSchoolProgram/"+schoolId+"?sprogramId="+title;
    });
	
	
	$('#editDailyProgram').click(function(event){
		   var schoolId = $('#schoolId').val();	
		   var title = $(this).attr('title');
		   window.location.href="<%=request.getContextPath()%>/cms/editDailyProgram/"
													+ schoolId
													+ "?dprogramId="
													+ title;
										});

						if (action == 'editSchoolProgram') {
							showProgrammeDiv(4);
						} else if (action == 'editDailyProgram') {
							showProgrammeDiv(5);
						} else if (action == 'listSchoolProgram') {
							showProgrammeDiv(3);
						} else if (action == 'listDailyProgram') {
							showProgrammeDiv(2);
						} else {
							showProgrammeDiv(1);
						}

					});
</script>
</head>
<body>


	<%@include file="login_nav.jsp"%>
	<main> <%@include file="school_setting_menu.jsp"%>
	<input type="hidden" name="schoolId" value="${id }" id="schoolId">
	<div class="row container_margin">
		<div class="col s12 m4 l2">
			<div>
				<ul class="collapsible" data-collapsible="accordion">
					<li id="schoolProgramLi">
						<div class="collapsible-header active" id="schoolProgramDiv">
							<i class="material-icons">filter_drama</i> School Program
						</div>
						<div class="collapsible-body">
							<div class="collapse_content">
								<a href="javascript:void(0)" onclick="showProgrammeDiv(3);"
									id="listAllSchoolProgram"
									class="waves-effect waves-teal btn-flat">Infant Program</a> <a
									href="" class="waves-effect waves-teal btn-flat"> Toddler
									Program </a> <a href="" class="waves-effect waves-teal btn-flat">
									Play School Level 1 </a> <a href="#new_school_programme"
									class="waves-effect waves-teal btn-flat modal-trigger">Add
									Program </a>
							</div>
						</div>
					</li>
					<!-- <li>
						<div class="collapsible-header">
							
						</div>
					</li> -->
				</ul>
			</div>
			<!-- <div>
				<ul class="collapsible" data-collapsible="accordion">
					<li>
						<div class="collapsible-header">
							<i class="material-icons">filter_drama</i> Daily Program
						</div>
						<div class="collapsible-body">
							<div class="collapse_content">
								<a href="javascript:void(0)" id="listAllDailyProgram"
									class="waves-effect waves-teal btn-flat">List All</a> <a
									class="waves-effect waves-teal btn-flat modal-trigger"
									href="#new_daily_programme">Add Daily Program</a>
							</div>
						</div>
					</li>
				</ul>
			</div> -->

		</div>
		<div class="col s12 m4 l8">
			<div class="row">
				<div class="col s12 m4 l1"></div>
				<div class="col s12 m4 l10">
					<div id="org_info_div" class="org_info_div"></div>
					<div id="daily_prog_div" class="daily_prog_div">
						<p class="Lato_normal_font">Daily Programs</p>
						<table class="responsive-table">
							<thead>
								<tr>
									<th data-field="price">Type</th>
									<th data-field="completion">Action</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${dailyProgramsList}" var="dailyProgram">
									<tr>
										<td>${dailyProgram.name}</td>
										<td><a class="modal-trigger" id="editDailyProgram"
											title="${dailyProgram.dailyProgramId}"> <img
												src="<%=request.getContextPath()%>/images/edit.png"
												width="30px" height="30px" />
										</a> <a> <img
												src="<%=request.getContextPath()%>/images/delete.png"
												width="30px" height="30px" />
										</a></td>
									</tr>
								</c:forEach>

							</tbody>
						</table>
					</div>
					<div id="sc_prog_div" class="sc_prog_div">
						<p class="Lato_normal_font">School Programs</p>
						<table class="responsive-table">
							<thead>
								<tr>
									<th data-field="price">Name</th>
									<th data-field="completion">Action</th>
								</tr>
							</thead>

							<tbody>
								<c:forEach items="${schoolProgramsList}" var="schoolProgram">
									<tr>
										<td>${schoolProgram.programName}</td>
										<td><a href="javascript:void(0)" id="editSchoolProgram"
											title="${schoolProgram.schoolProgramId}"> <img
												src="<%=request.getContextPath()%>/images/edit.png"
												width="30px" height="30px" />
										</a> <a> <img
												src="<%=request.getContextPath()%>/images/delete.png"
												width="30px" height="30px" />
										</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>




					<div id="daily_prog_edit_div" class="daily_prog_edit_div">

						<form id="schoolProgramForm" name="schoolProgramForm"
							action="<%=request.getContextPath()%>/cms/updateDailyProgram"
							method="post">
							<input type="hidden" name="schoolId" id="schoolId" value="${id}">
							<input type="hidden" name="dailyProgramId" id="dailyProgramId"
								value="${dailyProgram.dailyProgramId}">

							<div class="modal-content">
								<div class="row">
									<div class="input-field col s12 m12 l12">
										<input id="edit_new_programme_name"
											name="edit_new_programme_name" type="text" class="validate"
											value="${dailyProgram.name}"> <label
											for="edit_new_programme_name">Programme Name</label>
									</div>
									<div class="input-field col s12 m12 l12">
										<c:choose>
											<c:when test="${ not dailyProgram.quantity}">
												<input type="checkbox" id="edit_new_quantity"
													name="edit_new_quantity" value="true" />
											</c:when>
											<c:otherwise>
												<input type="checkbox" id="edit_new_quantity"
													name="edit_new_quantity" value="true" checked="checked" />
											</c:otherwise>
										</c:choose>
										<label for="edit_new_quantity">Quantity</label>
									</div>
									<div class="input-field col s12 m12 l12">
										<c:choose>
											<c:when test="${ not dailyProgram.unit}">
												<input type="checkbox" id="edit_new_unit"
													name="edit_new_unit" value="true" />
											</c:when>
											<c:otherwise>
												<input type="checkbox" id="edit_new_unit"
													name="edit_new_unit" value="true" checked="checked" />
											</c:otherwise>
										</c:choose>
										<label for="edit_new_unit">Unit</label>
									</div>
									<div class="input-field col s12 m12 l12">
										<c:choose>
											<c:when test="${ not dailyProgram.completeStatus}">
												<input type="checkbox" id="edit_new_complete_status"
													name="edit_new_complete_status" value="true" />
											</c:when>
											<c:otherwise>
												<input type="checkbox" id="edit_new_complete_status"
													name="edit_new_complete_status" value="true"
													checked="checked" />
											</c:otherwise>
										</c:choose>
										<label for="edit_new_complete_status">Complete Status</label>
									</div>
									<div class="input-field col s12 m12 l12">
										<c:choose>
											<c:when test="${ not dailyProgram.temperature}">
												<input type="checkbox" id="edit_new_temperature"
													name="edit_new_temperature" value="true" />
											</c:when>
											<c:otherwise>
												<input type="checkbox" id="edit_new_temperature"
													name="edit_new_temperature" value="true" checked="checked" />
											</c:otherwise>
										</c:choose>
										<label for="edit_new_temperature">Temperature</label>
									</div>
									<div class="input-field col s12 m12 l12">
										<c:choose>
											<c:when test="${ not dailyProgram.rashes}">
												<input type="checkbox" id="edit_new_rashes"
													name="edit_new_rashes" value="true" />
											</c:when>
											<c:otherwise>
												<input type="checkbox" id="edit_new_rashes"
													name="edit_new_rashes" value="true" checked="checked" />
											</c:otherwise>
										</c:choose>
										<label for="edit_new_rashes">Rashes</label>
									</div>
									<div class="input-field col s12 m12 l12">
										<c:choose>
											<c:when test="${ not dailyProgram.mouthulcer}">
												<input type="checkbox" id="edit_new_ulcer"
													name="edit_new_ulcer" value="true" />
											</c:when>
											<c:otherwise>
												<input type="checkbox" id="edit_new_ulcer"
													name="edit_new_ulcer" value="true" checked="checked" />
											</c:otherwise>
										</c:choose>
										<label for="edit_new_ulcer">Mouth Ulcer</label>
									</div>
									<div class="input-field col s12 m12 l12">
										<c:choose>
											<c:when test="${ not dailyProgram.blister}">
												<input type="checkbox" id="edit_new_blis"
													name="edit_new_blis" value="true" />
											</c:when>
											<c:otherwise>
												<input type="checkbox" id="edit_new_blis"
													name="edit_new_blis" value="true" checked="checked" />
											</c:otherwise>
										</c:choose>
										<label for="edit_new_blis">Blister/Eruption on
											palms/soles/buttocks</label>
									</div>
									<div class="input-field col s12 m12 l12">
										<c:choose>
											<c:when test="${ not dailyProgram.droolingsaliva}">
												<input type="checkbox" id="edit_new_saliva"
													name="edit_new_saliva" value="true" />
											</c:when>
											<c:otherwise>
												<input type="checkbox" id="edit_new_saliva"
													name="edit_new_saliva" value="true" checked="checked" />
											</c:otherwise>
										</c:choose>
										<label for="new_saliva">Drooling saliva</label>
									</div>
									<div class="input-field col s12 m12 l12">
										<c:choose>
											<c:when test="${ not dailyProgram.redwateryeyes}">
												<input type="checkbox" id="edit_new_redeyes"
													name="edit_new_redeyes" value="true" />
											</c:when>
											<c:otherwise>
												<input type="checkbox" id="edit_new_redeyes"
													name="edit_new_redeyes" value="true" checked="checked" />
											</c:otherwise>
										</c:choose>
										<label for="new_redeyes">Red &amp; Watery Eyes</label>
									</div>
									<div class="input-field col s12 m12 l12">
										<c:choose>
											<c:when test="${ not dailyProgram.cough}">
												<input type="checkbox" id="edit_new_cough"
													name="edit_new_cough" value="true" />
											</c:when>
											<c:otherwise>
												<input type="checkbox" id="edit_new_cough"
													name="edit_new_cough" value="true" checked="checked" />
											</c:otherwise>
										</c:choose>
										<label for="edit_new_cough">Cough</label>
									</div>
									<div class="input-field col s12 m12 l12">
										<c:choose>
											<c:when test="${ not dailyProgram.runnynose}">
												<input type="checkbox" id="edit_new_runnynose"
													name="edit_new_runnynose" value="true" />
											</c:when>
											<c:otherwise>
												<input type="checkbox" id="edit_new_runnynose"
													name="edit_new_runnynose" value="true" checked="checked" />
											</c:otherwise>
										</c:choose>
										<label for="edit_new_runnynose">Runny nose</label>
									</div>
									<div class="input-field col s12 m12 l12">
										<c:choose>
											<c:when test="${ not dailyProgram.virus}">
												<input type="checkbox" id="edit_new_virus"
													name="edit_new_virus" value="true" />
											</c:when>
											<c:otherwise>
												<input type="checkbox" id="edit_new_virus"
													name="edit_new_virus" value="true" checked="checked" />
											</c:otherwise>
										</c:choose>
										<label for="edit_new_virus">Virus</label>
									</div>
								</div>
							</div>
							<div class="modal-footer">
								<a href="#!"
									class=" modal-action modal-close waves-effect waves-green btn-flat">Cancel</a>
								<a href="#!"
									class=" modal-action modal-close waves-effect waves-green btn-flat"
									onclick="$(this).closest('form').submit();">Update</a>
							</div>
						</form>

					</div>




					<div id="sc_prog_edit_div" class="sc_prog_edit_div">
						<form id="schoolProgramForm" name="schoolProgramForm"
							action="<%=request.getContextPath()%>/cms/updateSchoolProgram"
							method="post">
							<input type="hidden" name="schoolId" id="schoolId" value="${id}">
							<input type="hidden" name="schooProgramlId" id="schooProgramlId"
								value="${schoolProgram.schoolProgramId}">
							<div class="modal-content">
								<div class="row">
									<div class="input-field col s12 m12 l12">
										<input id="edit_sc_new_programme_name"
											name="edit_sc_new_programme_name" type="text"
											class="validate" value="${schoolProgram.programName}">
										<label for="edit_sc_new_programme_name">Program Name</label>
									</div>
									<div class="input-field col s12 m12 l12">
										<input id="edit_start_age" name="edit_start_age" type="text"
											class="validate" value="${schoolProgram.startAge}"> <label
											for="edit_start_age">Start Age</label>
									</div>
									<div class="input-field col s12 m12 l12">
										<input id="edit_end_age" name="edit_end_age" type="text"
											class="validate" value="${schoolProgram.endAge}"> <label
											for="edit_end_age">End Age</label>
									</div>
									<c:forEach items="${dailyProgramsList}" var="dailyProgram">
										<c:set var="dailyProgramId"
											value="${dailyProgram.dailyProgramId}"></c:set>
										<c:set var="idVal"
											value="${selectedDailyProgram[dailyProgramId]}"></c:set>
										<div class="input-field col s12 m12 l12">
											<c:choose>
												<c:when test="${idVal=='yes'}">
													<input type="checkbox"
														id="edit${dailyProgram.dailyProgramId}"
														name="edit${dailyProgram.dailyProgramId}"
														class="filled-in" value="yes" checked="checked" />
												</c:when>
												<c:otherwise>
													<input type="checkbox"
														id="edit${dailyProgram.dailyProgramId}"
														name="edit${dailyProgram.dailyProgramId}"
														class="filled-in" value="yes" />
												</c:otherwise>
											</c:choose>
											<label for="edit${dailyProgram.dailyProgramId}">${dailyProgram.name}</label>
										</div>
									</c:forEach>

								</div>
							</div>
							<div class="modal-footer">
								<a href="javascript:void(0);"
									class=" modal-action modal-close waves-effect waves-green btn-flat">Cancel</a>
								<a href="javascript:void(0);"
									class=" modal-action modal-close waves-effect waves-green btn-flat"
									onclick="$(this).closest('form').submit();">Update</a>
							</div>
						</form>
					</div>
					<div>
						<div class="row">
							<div class="col s12 m9 l8">
								<h5>Infant Program</h5>
							</div>
							<div class="col s12 m3 l4">
								<a href="#new_sub_program_modal" class="waves-effect waves-green btn-flat modal-trigger">Add
									Daily Activity</a>
							</div>
						</div>

						<div class="row">
							<div class="col s12 m12 l12">
								<h6>
									<span class="program_title">Program Details</span>
								</h6>
							</div>
						</div>
						<div class="row">
							<div class="col s12 m4 l4 input-field">
								<input disabled id="age_from" type="text" class="validate"
									value="1 month"> <label for="age_from">From Age</label>
							</div>
							<div class="col s12 m4 l4 input-field">
								<input disabled id="age_to" type="text" class="validate"
									value="8 months"> <label for="age_to">To Age</label>
							</div>
						</div>
						<div class="row">
							<div class="col s12 m11 l11 input-field">
								<textarea disabled id="desc_ta" class="materialize-textarea"
									maxlength="100" length="100" value="For Infant"></textarea>
								<label for="desc_ta">Description</label>
							</div>
							<script>
								$('#desc_ta').val('For Infant');
							</script>
						</div>

						<div class="row">
							<div class="col s12 m12 l12">
								<h6>
									<span class="program_title">Billing Rate</span>
								</h6>
							</div>
						</div>

						<div class="row">
							<div class="col s12 m4 l4 input-field">
								<input disabled id="prog_rate" type="text" class="validate"
									value="700"> <label for="prog_rate">Program
									Rate</label>
							</div>
							<div class="col s12 m4 l4 input-field">
								<input disabled id="period" type="text" class="validate"
									value="Weekly"> <label for="period">Period</label>
							</div>

						</div>
						<div class="row">
							<div class="col s12 m4 l4 input-field">
								<input id="start_time" type="text" class="validate" disabled
									value="09:00am"> <label for="start_time">Start
									Time</label>
							</div>
							<div class="col s12 m4 l4 input-field">
								<input id="end_time" type="text" class="validate" disabled
									value="10:00am"> <label for="end_time">End Time</label>
							</div>
						</div>
						<div class="row">
							<div class="col s12 m12 l12">
								<label>Billing Period</label>
								<div class="row">
									<div class="col s12 m3 l3 input-field">
										<input id="p_mon" type="checkbox" class="filled-in" checked
											disabled> <label for="p_mon">Monday</label>
									</div>
									<div class="col s12 m3 l3 input-field">
										<input id="p_tue" type="checkbox" class="filled-in" checked
											disabled> <label for="p_tue">Tuesday</label>
									</div>
									<div class="col s12 m3 l3 input-field">
										<input id="p_wed" type="checkbox" class="filled-in" checked
											disabled> <label for="p_wed">Wednesday</label>
									</div>
									<div class="col s12 m3 l3 input-field">
										<input id="p_thu" type="checkbox" class="filled-in" checked
											disabled> <label for="p_thu">Thursday</label>
									</div>
									<div class="col s12 m3 l3 input-field">
										<input id="p_fri" type="checkbox" class="filled-in" checked
											disabled> <label for="p_fri">Friday</label>
									</div>
									<div class="col s12 m3 l3 input-field">
										<input id="p_sat" type="checkbox" class="filled-in" disabled>
										<label for="p_sat">Saturday</label>
									</div>
									<div class="col s12 m3 l3 input-field">
										<input id="p_sun" type="checkbox" class="filled-in" disabled>
										<label for="p_sun">Sunday</label>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col s12 m10 l10 input-field">
								<textarea id="bill_desc_ta" class="materialize-textarea"
									maxlength="100" length="100" disabled></textarea>
								<label for="bill_desc_ta">Description</label>

								<script>
									$('#bill_desc_ta').val('Infant Bills');
								</script>
							</div>
						</div>
						<div class="row">
							<div class="col s12 m1 offset-l10 l1">
								<a class="modal-trigger" href="#edit_program_modal"><img
									src="<%=request.getContextPath()%>/images/edit.png"
									width="30px" height="30px" /></a>
								<%-- <a href="javascript:void(0)" onclick="MM_showHideLayers();"><img
									src="<%=request.getContextPath()%>/images/edit.png"
									width="30px" height="30px" /></a> --%>
							</div>
							<div class="col s12 m1 l1">
								<a href="javascript:void(0)" onclick="myFunction();"><img src="<%=request.getContextPath()%>/images/delete.png"
									width="30px" height="30px" /></a>
								<script>
									function myFunction() {
									var txt;
										var r = confirm("Are you sure you want to remove this program?");
										if (r == true) {
											txt = "Program removed";
										} else {
											//txt = "You pressed Cancel!";
										}
										Materialize.toast(txt, 4000);
									}
								</script>
							</div>
						</div>

						<div class="row" style="border: 1px black solid;"></div>

						<div class="row">
							<div class="col s12 m4 l4">
								<h5>Meal Plan</h5>
							</div>
						</div>
						<div class="row">
							<div class="col s12 m12 l12">
								<h6>
									<span class="program_title">Program Info</span>
								</h6>
							</div>
						</div>
						<div class="row">
							<div class="col s12 m6 l6">
								<strong>Criterias:</strong>
							</div>
						</div>

						<div class="row">
							<div class="col s12 m3 l3">
								<p>
									<input type="checkbox" id="t1" class="filled-in" checked
										disabled /> <label for="t1">Quantity</label>
								</p>
							</div>
							<div class="col s12 m3 l3">
								<p>
									<input type="checkbox" id="t2" class="filled-in" disabled /> <label
										for="t2">Unit</label>
								</p>
							</div>
							<div class="col s12 m3 l3">
								<p>
									<input type="checkbox" id="t3" class="filled-in" checked
										disabled /> <label for="t3">Complete Status</label>
								</p>
							</div>
							<div class="col s12 m3 l3">
								<p>
									<input type="checkbox" id="t4" class="filled-in" disabled /> <label
										for="t4">Temperature</label>
								</p>
							</div>
							<div class="col s12 m3 l3">
								<p>
									<input type="checkbox" id="t5" class="filled-in" disabled /> <label
										for="t5">Rashes</label>
								</p>
							</div>
							<div class="col s12 m3 l3">
								<p>
									<input type="checkbox" id="t6" class="filled-in" disabled /> <label
										for="t6">Mouth Ulcer</label>
								</p>
							</div>
							<div class="col s12 m3 l3">
								<p>
									<input type="checkbox" id="t7" class="filled-in" disabled /> <label
										for="t7">Blister</label>
								</p>
							</div>
							<div class="col s12 m3 l3">
								<p>
									<input type="checkbox" id="t8" class="filled-in" disabled /> <label
										for="t8">Drooling Saliva</label>
								</p>
							</div>
							<div class="col s12 m3 l3">
								<p>
									<input type="checkbox" id="t9" class="filled-in" disabled /> <label
										for="t9">Red Watery Eyes</label>
								</p>
							</div>
							<div class="col s12 m3 l3">
								<p>
									<input type="checkbox" id="t10" class="filled-in" disabled /> <label
										for="t10">Cough</label>
								</p>
							</div>
							<div class="col s12 m3 l3">
								<p>
									<input type="checkbox" id="t11" class="filled-in" disabled /> <label
										for="t11">Runny Nose</label>
								</p>
							</div>
							<div class="col s12 m3 l3">
								<p>
									<input type="checkbox" id="t12" class="filled-in" disabled /> <label
										for="t12">Virus</label>
								</p>
							</div>
							<div class="col s12 m4 l4">
								<div class="input-field">
									<input id="st_1" type="text" class="validate" value="-"
										disabled> <label for="st_1">Start Time</label>
								</div>
							</div>
							<div class="col s12 m4 l4">
								<div class="input-field">
									<input id="et_1" type="text" class="validate" value="-"
										disabled> <label for="et_1">End Time</label>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col s12 m12 l12">
								<h6>
									<span class="program_title">Billing Info</span>
								</h6>
							</div>
						</div>
						<div class="row">
							<div class="col s12 m4 l4 input-field">
								<input disabled id="b_prog_rate" type="text" class="validate"
									value="100" disabled> <label for="b_prog_rate">Program
									Rate</label>
							</div>
							<div class="col s12 m4 l4 input-field">
								<input disabled id="b_period" type="text" class="validate"
									value="Monthly" disabled> <label for="b_period">Period</label>
							</div>

						</div>
						<div class="row">
							<div class="col s12 m4 l4 input-field">
								<input id="b_start_time" type="text" class="validate" disabled
									value="09:00am" disabled> <label for="b_start_time">Start
									Time</label>
							</div>
							<div class="col s12 m4 l4 input-field">
								<input id="b_end_time" type="text" class="validate" disabled
									value="10:00am"> <label for="b_end_time">End
									Time</label>
							</div>
						</div>
						<div class="row">
							<div class="col s12 m12 l12">
								<label>Billing Period</label>
								<div class="row">
									<div class="col s12 m3 l3 input-field">
										<input id="b_p_mon" type="checkbox" class="filled-in" checked
											disabled> <label for="b_p_mon">Monday</label>
									</div>
									<div class="col s12 m3 l3 input-field">
										<input id="b_p_tue" type="checkbox" class="filled-in" checked
											disabled> <label for="b_p_tue">Tuesday</label>
									</div>
									<div class="col s12 m3 l3 input-field">
										<input id="b_p_wed" type="checkbox" class="filled-in" checked
											disabled> <label for="b_p_wed">Wednesday</label>
									</div>
									<div class="col s12 m3 l3 input-field">
										<input id="b_p_thu" type="checkbox" class="filled-in" checked
											disabled> <label for="b_p_thu">Thursday</label>
									</div>
									<div class="col s12 m3 l3 input-field">
										<input id="b_p_fri" type="checkbox" class="filled-in" checked
											disabled> <label for="b_p_fri">Friday</label>
									</div>
									<div class="col s12 m3 l3 input-field">
										<input id="b_p_sat" type="checkbox" class="filled-in" disabled>
										<label for="b_p_sat">Saturday</label>
									</div>
									<div class="col s12 m3 l3 input-field">
										<input id="b_p_sun" type="checkbox" class="filled-in" disabled>
										<label for="b_p_sun">Sunday</label>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col s12 m10 l10 input-field">
								<textarea id="bill_desc_ta_b" class="materialize-textarea"
									maxlength="100" length="100" disabled></textarea>
								<label for="bill_desc_ta_b">Description</label>

								<script>
									$('#bill_desc_ta_b').val('Meal Plan Bills');
								</script>
							</div>
						</div>
						<div class="row">
							<div class="col s12 m1 offset-l10 l1">
								<a class="modal-trigger" href="#edit_sub_program_modal"><img
									src="<%=request.getContextPath()%>/images/edit.png"
									width="30px" height="30px" /></a>
							</div>
							<div class="col s12 m1 l1">
								<img src="<%=request.getContextPath()%>/images/delete.png"
									width="30px" height="30px" />
							</div>
						</div>


						<%-- <div class="row" style="border: 1px black solid;"></div>

						<div class="row">
							<div class="col s12 m4 l4">
								<h6>Transport</h6>
							</div>
						</div>
						<div class="row">
							<div class="col s12 m4 l4">
								<strong>Program Rate:</strong> RM150
							</div>
							<div class="col s12 m4 l4">
								<strong>Period:</strong> Weekly
							</div>

						</div>
						<div class="row">
							<div class="col s12 m4 l4">
								<strong>Start Time: </strong>8.00am
							</div>
							<div class="col s12 m4 l4">
								<strong>End Time: </strong>6.00pm
							</div>
						</div>
						<div class="row">
							<div class="col s12 m12 l12">
								<strong>Billing Period:</strong> Monday, Tuesday, Wednesday,
								Thursday, Friday
							</div>
						</div>
						<div class="row">
							<div class="col s12 m10 l10">
								<strong>Description:</strong>
							</div>
							
						</div>
						<div class="row">
							<div class="col s12 m1 offset-l10 l1">
								<img src="<%=request.getContextPath()%>/images/edit.png"
									width="30px" height="30px" />
							</div>
							<div class="col s12 m1 l1">
								<img src="<%=request.getContextPath()%>/images/delete.png"
									width="30px" height="30px" />
							</div>
						</div> --%>
					</div>
				</div>
				<div class="col s12 m4 l1"></div>
			</div>
		</div>
		<div class="col s12 m4 l2">
			<%-- <div class="row">
				<div class="col s12 m12 l12">Recent Items</div>
			</div>
			<%@include file="recent_item.jsp"%> --%>
		</div>
	</div>
	<%@include
		file="modal.jsp"%> </main>
	<%@include file="footer.jsp"%>