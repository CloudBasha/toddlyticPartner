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
		<div class="col s12 m4 l2 left_column">
			<div>
				<ul class="collapsible" data-collapsible="accordion">
					<li>
						<div class="collapsible-header active">
							<a href="javascript:void(0)" id="loadOrganizationInfo"
								class="staff_menu_add"> <i class="material-icons">place</i>
								Organization Info
							</a>
						</div>
					</li>
				</ul>
			</div>

			<div>
				<ul class="collapsible" data-collapsible="accordion">
					<li>
						<div class="collapsible-header active">
							<i class="material-icons">place</i> Teacher Profile
						</div>
						<div class="collapsible-body">
							<div class="collapse_content">
								<a href="javascript:void(0)" onclick="showProfileDiv()"
									class="waves-effect waves-teal btn-flat">Permissions</a>
							</div>
						</div>
					</li>
					<li>
						<div class="collapsible-header">
							<i class="material-icons">place</i> Admin Profile
						</div>
						<div class="collapsible-body">
							<div class="collapse_content">
								<a href="" class="waves-effect waves-teal btn-flat">Permissions</a>
							</div>
						</div>
					</li>
					<li>
						<div class="collapsible-header">
							<a href="#new_profile" class="staff_menu_add modal-trigger">
								<i class="material-icons">place</i> Add Profile
							</a>
						</div>
					</li>
				</ul>
			</div>


		</div>
		<div class="col s12 m4 l8">
			<div class="row org_info_div" id="org_info_div">
				<div class="col s12 m4 l1"></div>
				<div class="col s12 m4 l10">

					<div>
						<!-- <div id="org_info_div" class="org_info_div"> -->
						<form id="orgInfoForm" name="orgInfoForm"
							action="<%=request.getContextPath()%>/cms/updateOrganization"
							method="post" enctype="multipart/form-data">
							<input type="hidden" name="schoolId" id="schoolId" value="${id}">
							<p class="Lato_normal_font">Organization Info</p>
							<div class="row">

								<input type="hidden" name="schoolId" id="schoolId" value="${id}">
								<div class="col s12 m6 l6">
									<label class="Lato_normal_font">Organization Name</label> <input
										type="text" name="orgname" id="orgname"
										value="${organization.organizationName}"> <label
										class="Lato_normal_font">Address 1</label> <input type="text"
										name="address1" id="address1"
										value="${organization.streetAddress }"> <label
										class="Lato_normal_font">Address 2</label> <input type="text"
										name="address2" id="address2"
										value="${organization.streetAddressOne}"> <label
										class="Lato_normal_font">Post Code</label> <input type="text"
										name="postCode" id="postCode" value="${organization.postCode}">
									<label class="Lato_normal_font">City</label> <input type="text"
										name="city" id="city" value="${organization.city}"> <label
										class="Lato_normal_font">State</label> <input type="text"
										name="state" id="state" value="${organization.state}">
									<label class="Lato_normal_font">Country</label> <input
										type="text" name="country" id="country"
										value="${organization.country}">
								</div>
								<div class="col s12 m6 l6">
									<label class="Lato_normal_font">Contact no</label> <input
										type="text" name="contactNo" id="contactNo"
										value="${organization.contactNumber}"> <label
										class="Lato_normal_font">Fax no</label> <input type="text"
										name="faxNo" id="faxNo" value="${organization.faxNumber}">
									<label class="Lato_normal_font">Website</label> <input
										type="text" name="website" id="website"
										value="${organization.website}">
									<c:if test="${ not empty organization.logoUrl }">
										<div>
											<a
												href="<%=request.getContextPath()%>/cms/orgimage?id=${organization.organizationId}"
												target="_blank">Image</a>
										</div>
									</c:if>
									<div class="file-field input-field">
										<div class="btn">
											<span>Logo</span> <input type="file" name="logo" id="logo">
										</div>

										<div class="file-path-wrapper">
											<input class="file-path validate" type="text">
										</div>
									</div>
								</div>


							</div>
							<div class="row">
								<div class="col s12 m4 l7"></div>
								<div class="col s3 m4 l2">
									<a class="waves-effect waves-light btn"
										onclick="$(this).closest('form').submit();">Update</a>
								</div>
								<!-- 
						<div class="col s3 m4 l2">
							<a class="waves-effect waves-light btn">Cancel</a>
						</div>
						 -->
							</div>
						</form>
					</div>
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
				</div>
				<div class="col s12 m4 l1"></div>
			</div>

			<!-- Profile -->
			<div class="school_global_div" id="school_global_div">
				<div class="row">
					<div class="col s12 m12 l1"></div>
					<div class="col s12 m12 l10"><h5>Teacher Profile</h5></div>
					<div class="col s12 m12 l1"></div>
				</div>
				<div class="row">
					<div class="col s12 m12 l1"></div>
					<div class="col s12 m12 l10">
						<p>School Permissions</p>
						<table class="responsive-table">
							<thead>
								<tr>
									<th>Create School</th>
									<th>Read School</th>
									<th>Edit School</th>
									<th>Delete School</th>
								</tr>
							</thead>

							<tbody>
								<tr>
									<td class="center"><input type="checkbox"
										class="filled-in" id="fi1" /> <label for="fi1"></label></td>
									<td class="center"><input type="checkbox"
										class="filled-in" id="fi2" /> <label for="fi2"></label></td>
									<td class="center"><input type="checkbox"
										class="filled-in" id="fi3" /> <label for="fi3"></label></td>
									<td class="center"><input type="checkbox"
										class="filled-in" id="fi4" /> <label for="fi4"></label></td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="col s12 m12 l1"></div>
				</div>
				<div class="row">
					<div class="col s12 m12 l1"></div>
					<div class="col s12 m12 l10">
						<p>Contact Permissions</p>
						<table class="responsive-table">
							<thead>
								<tr>
									<th>Create Contact</th>
									<th>Read Contact</th>
									<th>Edit Contact</th>
									<th>Delete Contact</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="center"><input type="checkbox"
										class="filled-in" id="fi5" checked="checked" /> <label
										for="fi5"></label></td>
									<td class="center"><input type="checkbox"
										class="filled-in" id="fi6" checked="checked" /> <label
										for="fi6"></label></td>
									<td class="center"><input type="checkbox"
										class="filled-in" id="fi7" checked="checked" /> <label
										for="fi7"></label></td>
									<td class="center"><input type="checkbox"
										class="filled-in" id="fi8" checked="checked" /> <label
										for="fi8"></label></td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="col s12 m12 l1"></div>
				</div>
				<div class="row">
					<div class="col s12 m12 l1"></div>
					<div class="col s12 m12 l10">
						<p>School Programme Permissions</p>
						<table class="responsive-table">
							<thead>
								<tr>
									<th>Create School Programme</th>
									<th>Read School Programme</th>
									<th>Edit School Programme</th>
									<th>Delete School Programme</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="center"><input type="checkbox"
										class="filled-in" id="fi9" checked="checked" /> <label
										for="fi9"></label></td>
									<td class="center"><input type="checkbox"
										class="filled-in" id="fi10" checked="checked" /> <label
										for="fi10"></label></td>
									<td class="center"><input type="checkbox"
										class="filled-in" id="fi11" checked="checked" /> <label
										for="fi11"></label></td>
									<td class="center"><input type="checkbox"
										class="filled-in" id="fi12" checked="checked" /> <label
										for="fi12"></label></td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="col s12 m12 l1"></div>
				</div>
			</div>
		</div>
		<div class="col s12 m4 l2">
			<%-- <div class="row"> <div
			class="col s12 m12 l12">Recent Items</div> </div> <%@include
			file="recent_item.jsp"%> --%>
		</div>
	</div>
	<%@include file="modal.jsp"%> </main>
	<%@include file="footer.jsp"%>