<script type="text/javascript">
	//Check Photo Upload size
	$('#photo_img').bind('change', function() {
		var photoSize = this.files[0].size / 1024 / 1024;
		if (photoSize >= 3) {
			alert('Image size exceed max file size, please upload smaller size image');
			var photo_img = $('#photo_img');

			photo_img.wrap('<form>').closest('form').get(0).reset();
			photo_img.unwrap();
		} else {
			//alert('This file size is allowed');
		}
	});
</script>

<div id="view_photo" class="modal" style="max-height: 85% !important; width: 70% !important;">
	<%-- <div class="modal-content">
		<div class="row">
			<div class="col s12 m6 l6">
				<div style="width: 500px; height: 500px; border: 1px #bdbdbd solid;"></div>
				<div class="file-field input-field">
					<div class="btn">
						<span>Photo</span>
						<input type="file">
					</div>
					<div class="file-path-wrapper">
						<input class="file-path validate" type="text">
					</div>
				</div>
			</div>
			<div class="col s12 m6 l6">
				<div class="row">
					<div class="col s12 m6 l6">Tag Students</div>
					<div class="col s12 m6 l6">
						<input type="checkbox" class="filled-in" id="filled-in-box" checked="checked" />
						<label for="filled-in-box">Public</label>
					</div>
				</div>

				<div class="row">
					<div class="col s9 m9 l9">
						<div class="input-field col s12">
							<input placeholder="Student Name" type="text" id="autocomplete-input" class="autocomplete">
						</div>
					</div>
					<div class="col s3 m3 m3">
						<img src="<%=request.getContextPath()%>/images/add.png" width="30px" height="30px" style="margin-top: 30px;" />
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="modal-footer">
		<a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Cancel</a>
		<a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Edit</a>
	</div> --%>
	<form action="<%=request.getContextPath()%>/cms/createPhoto" method="post"
		enctype="multipart/form-data" id="addPhotoForm">
		<input type="hidden" name="schoolId" value="${id}">
		<div class="modal-content">
			<h4>View Photo</h4>
			<div class="row">
				<div class="col s12 m6 l6">
					<div class="row">
						<div class="input-field col s12">
							<select name="albumId" id="albumId">
								<option value="" disabled selected>Select album</option>
								<c:forEach items="${albumsList}" var="album">
									<option value="${album.albumId}">${album.name}</option>
								</c:forEach>
							</select> <label>Album</label>
						</div>

						<div class="input-field col s12">
							<input type="text" name="name" id="name"> <label>Name</label>
						</div>

					</div>

					<div class="row">
						<div class="col s12 m8 l8">
							<div class="file-field input-field">
								<div class="btn">
									<span>Photo</span> <input type="file" name="photo" id="photo">
								</div>
								<div class="file-path-wrapper">
									<input class="file-path validate" type="text">
								</div>
							</div>
						</div>
						<div class="col s12 m4 l4 public_chkbtn">
							<input type="checkbox" class="filled-in" id="isPublic" name="isPublic" value="true"
								checked="checked" /> <label for="filled-in-box">Public</label>
						</div>
					</div>
				</div>
				<div class="col s12 m6 l6">
					<div class="row">
						<div class="col s6 m6 l3">Tag Students</div>
					</div>

					<div class="row">
						<div class="col s9 m9 l9">
							<div class="input-field col s12">
								<input placeholder="Student Name" type="text" id="tags" name="tags" size="50">
							</div>
						</div>
						<div class="col s3 m3 m3">
							<a href="javascript:void(0)" onclick="addStudentToPhoto()"> <img
								src="<%=request.getContextPath()%>/images/add.png" width="30px" height="30px"
								style="margin-top: 30px;" />
							</a>
						</div>
					</div>
					<div class="row" id="selectedStudent"></div>
				</div>
			</div>
		</div>
		<div class="modal-footer">
			<a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Cancel</a> <a
				href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat"
				onclick="$(this).closest('form').submit();">Edit</a>
		</div>
	</form>
</div>

<div id="album" class="modal" style="width: 20%">
	<form method="post" action="<%=request.getContextPath()%>/cms/createAlbum">
		<input type="hidden" name="schoolId" value="${id}">
		<div class="modal-content">
			<div class="row">
				<div class="input-field col s12 m12 l12">
					<input name="album_name" id="album_name" type="text" class="validate"> <label
						for="last_name">Album Name</label>
				</div>
			</div>
		</div>
		<div class="modal-footer">
			<a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Cancel</a> <a
				href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat"
				onclick="$(this).closest('form').submit();">Create</a>
		</div>
	</form>
</div>

<div id="editalbum" class="modal" style="width: 20%">
	<form method="post" action="<%=request.getContextPath()%>/cms/updateAlbum">
		<input type="hidden" name="schoolId" value="${id}"> <input type="hidden" name="albumId"
			value="${editAlbum.albumId}">
		<div class="modal-content">
			<div class="row">
				<div class="input-field col s12 m12 l12">
					<input name="album_name" id="album_name" type="text" class="validate" value="${editAlbum.name}">
					Album Name
				</div>
			</div>
		</div>
		<div class="modal-footer">
			<a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Cancel</a> <a
				href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat"
				onclick="$(this).closest('form').submit();">Update</a>
		</div>
	</form>
</div>

<div id="upload_newsletter" class="modal" style="width: 20%">
	<form method="post" action="<%=request.getContextPath()%>/cms/createNewsLetter"
		enctype="multipart/form-data">
		<input type="hidden" name="schoolId" value="${id}">
		<div class="modal-content">
			<div class="row">
				<div class="col s12 m12 l12">
					<div class="input-field">
						<input id="name" name="name" type="text" class="validate"> <label for="name">Newsletter
							Name</label>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col s12 m12 l12">
					<div class="file-field input-field">
						<div class="btn">
							<span>File</span> <input type="file" name="newsletterFile" id="newsletterFile">
						</div>
						<div class="file-path-wrapper">
							<input class="file-path validate" type="text">
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="modal-footer">
			<a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Cancel</a> <a
				href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat"
				onclick="$(this).closest('form').submit();">Upload</a>
		</div>
	</form>
</div>

<div id="meal_record" class="modal" style="width: 20%">
	<div class="modal-content">
		<div class="row">
			<!-- <div class="input-field col s12 m12 l12">
				<input id="student_name" type="text" class="validate">
				<label for="student_name">Student Name</label>
			</div> -->
			<div class="input-field col s12 m12 l12">
				<input id="type" type="text" class="validate"> <label for="type">Type</label>
			</div>
			<div class="input-field col s12 m12 l12">
				<input id="completion" type="text" class="validate"> <label for="completion">Completion</label>
			</div>
		</div>
	</div>
	<div class="modal-footer">
		<a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Cancel</a> <a
			href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Add</a>
	</div>
</div>

<div id="health_record" class="modal" style="width: 30%; max-height: 80%;">
	<div class="modal-content">
		<div class="row">
			<!-- <div class="input-field col s12 m12 l12">
				<input id="student_name" type="text" class="validate">
				<label for="student_name">Student Name</label>
			</div> -->
			<div class="input-field col s12 m12 l12">
				<input id="type" type="text" class="validate"> <label for="type">Fever(Temp)</label>
			</div>
			<div class="input-field col s12 m12 l12">
				<input type="checkbox" id="rashes" /> <label for="rashes">Rashes</label>
			</div>
			<div class="input-field col s12 m12 l12">
				<input type="checkbox" id="ulcer" /> <label for="ulcer">Mouth Ulcer</label>
			</div>
			<div class="input-field col s12 m12 l12">
				<input type="checkbox" id="blis" /> <label for="blis">Blister/Eruption on
					palms/soles/buttocks</label>
			</div>
			<div class="input-field col s12 m12 l12">
				<input type="checkbox" id="saliva" /> <label for="saliva">Drooling saliva</label>
			</div>
			<div class="input-field col s12 m12 l12">
				<input type="checkbox" id="redeyes" /> <label for="redeyes">Red &amp; Watery Eyes</label>
			</div>
			<div class="input-field col s12 m12 l12">
				<input type="checkbox" id="cough" /> <label for="cough">Cough</label>
			</div>
			<div class="input-field col s12 m12 l12">
				<input type="checkbox" id="runnynose" /> <label for="runnynose">Runny nose</label>
			</div>
			<div class="input-field col s12 m12 l12">
				<input type="checkbox" id="virus" /> <label for="virus">Virus</label>
			</div>
			<div class="input-field col s12 m12 l12" style="margin-top: 25px !important;">
				<input type="text" id="time" class="validate" /> <label for="time">Time</label>
			</div>
		</div>
	</div>
	<div class="modal-footer">
		<a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Cancel</a> <a
			href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Add</a>
	</div>
</div>

<div id="billing_rate" class="modal" style="width: 60%">
	<div class="modal-content">
		<div class="row">
			<div class="input-field col s12 m12 l12">
				<input id="name" type="text" class="validate"> <label for="name">Item Name</label>
			</div>
			<div class="input-field col s12 m12 l12">
				<input id="price" type="text" class="validate"> <label for="price">Unit Price</label>
			</div>
			<div class="input-field col s12 m12 l12">
				<input id="description" type="text" class="validate"> <label for="description">Description</label>
			</div>
			<div class="input-field col s12 m12 l12">
				<p>Period</p>
				<p>
					<input name="group1" type="radio" id="test1" /> <label for="test1">Yearly</label>
				</p>
				<p>
					<input name="group1" type="radio" id="test2" /> <label for="test2">Monthly</label>
				</p>
				<p>
					<input class="with-gap" name="group1" type="radio" id="test3" /> <label for="test3">Weekly</label>
				</p>
				<p>
					<input class="with-gap" name="group1" type="radio" id="test4" /> <label for="test4">Daily</label>
				</p>
				<p>
					<input class="with-gap" name="group1" type="radio" id="test5" /> <label for="test5">One-Off</label>
				</p>
			</div>
			<div class="input-field col s12 m12 l12">
				<input id="start" type="text" class="validate"> <label for="start">Start Time</label>
			</div>
			<div class="input-field col s12 m12 l12">
				<input id="end" type="text" class="validate"> <label for="end">End Time</label>
			</div>
			<div class="input-field col s12">
				<select multiple>
					<option value="" disabled selected>Choose your option</option>
					<option value="1">Monday</option>
					<option value="2">Tuesday</option>
					<option value="3">Wednesday</option>
					<option value="4">Thursday</option>
					<option value="5">Friday</option>
					<option value="6">Saturday</option>
					<option value="7">Sunday</option>
				</select> <label>Billing Days</label>
			</div>
		</div>
	</div>
	<div class="modal-footer">
		<a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Cancel</a> <a
			href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Add</a>
	</div>
</div>

<div id="edit_permission" class="modal" style="width: 20%">
	<div class="modal-content">
		<div class="row">
			<div class="input-field col s12 m12 l12">
				<input value="Alvin" id="name" type="text" class="validate" disabled> <label for="name">Name</label>
			</div>
			<div class="input-field col s12 m12 l12">
				<input value="Teacher" id="role" type="text" class="validate" disabled> <label
					for="role">Role</label>
			</div>
			<div>
				<input type="checkbox" class="filled-in" id="fi1" /> <label for="fi1">Create School</label>
			</div>
			<div>
				<input type="checkbox" class="filled-in" id="fi2" /> <label for="fi2">Read School</label>
			</div>
			<div>
				<input type="checkbox" class="filled-in" id="fi3" /> <label for="fi3">Edit School</label>
			</div>
			<div>
				<input type="checkbox" class="filled-in" id="fi4" /> <label for="fi4">Delete School</label>
			</div>
			<div>
				<input type="checkbox" class="filled-in" id="fi5" checked="checked" /> <label for="fi5">Create
					Student</label>
			</div>
			<div>
				<input type="checkbox" class="filled-in" id="fi6" checked="checked" /> <label for="fi6">Read
					School</label>
			</div>
			<div>
				<input type="checkbox" class="filled-in" id="fi7" checked="checked" /> <label for="fi7">Edit
					School</label>
			</div>
			<div>
				<input type="checkbox" class="filled-in" id="fi8" checked="checked" /> <label for="fi8">Delete
					School</label>
			</div>
			<div>
				<input type="checkbox" class="filled-in" id="fi9" checked="checked" /> <label for="fi9">Create
					School</label>
			</div>
			<div>
				<input type="checkbox" class="filled-in" id="fi10" checked="checked" /> <label for="fi10">Read
					School</label>
			</div>
			<div>
				<input type="checkbox" class="filled-in" id="fi11" checked="checked" /> <label for="fi11">Edit
					School</label>
			</div>
			<div>
				<input type="checkbox" class="filled-in" id="fi12" checked="checked" /> <label for="fi12">Delete
					School</label>
			</div>
		</div>
	</div>
	<div class="modal-footer">
		<a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Cancel</a> <a
			href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Edit</a>
	</div>
</div>

<div id="new_daily_programme" class="modal" style="width: 30%">
	<form id="schoolProgramForm" name="schoolProgramForm"
		action="<%=request.getContextPath()%>/cms/createDailyProgram" method="post">
		<input type="hidden" name="schoolId" id="schoolId" value="${id}">

		<div class="modal-content">
			<div class="row">
				<div class="input-field col s12 m12 l12">
					<input id="new_programme_name" name="new_programme_name" type="text" class="validate">
					<label for="new_programme_name">Programme Name</label>
				</div>
				<div class="input-field col s12 m12 l12">
					<input type="checkbox" id="new_quantity" name="new_quantity" value="true" /> <label
						for="new_quantity">Quantity</label>
				</div>
				<div class="input-field col s12 m12 l12">
					<input type="checkbox" id="new_unit" name="new_unit" value="true" /> <label for="new_unit">Unit</label>
				</div>
				<div class="input-field col s12 m12 l12">
					<input type="checkbox" id="new_complete_status" name="new_complete_status" value="true" /> <label
						for="new_complete_status">Complete Status</label>
				</div>
				<div class="input-field col s12 m12 l12">
					<input type="checkbox" id="new_temperature" name="new_temperature" value="true" /> <label
						for="new_temperature">Temperature</label>
				</div>
				<div class="input-field col s12 m12 l12">
					<input type="checkbox" id="new_rashes" name="new_rashes" value="true" /> <label
						for="new_rashes">Rashes</label>
				</div>
				<div class="input-field col s12 m12 l12">
					<input type="checkbox" id="new_ulcer" name="new_ulcer" value="true" /> <label for="new_ulcer">Mouth
						Ulcer</label>
				</div>
				<div class="input-field col s12 m12 l12">
					<input type="checkbox" id="new_blis" name="new_blis" value="true" /> <label for="new_blis">Blister/Eruption
						on palms/soles/buttocks</label>
				</div>
				<div class="input-field col s12 m12 l12">
					<input type="checkbox" id="new_saliva" name="new_saliva" value="true" /> <label
						for="new_saliva">Drooling saliva</label>
				</div>
				<div class="input-field col s12 m12 l12">
					<input type="checkbox" id="new_redeyes" name="new_redeyes" value="true" /> <label
						for="new_redeyes">Red &amp; Watery Eyes</label>
				</div>
				<div class="input-field col s12 m12 l12">
					<input type="checkbox" id="new_cough" name="new_cough" value="true" /> <label for="new_cough">Cough</label>
				</div>
				<div class="input-field col s12 m12 l12">
					<input type="checkbox" id="new_runnynose" name="new_runnynose" value="true" /> <label
						for="new_runnynose">Runny nose</label>
				</div>
				<div class="input-field col s12 m12 l12">
					<input type="checkbox" id="new_virus" name="new_virus" value="true" /> <label for="new_virus">Virus</label>
				</div>
			</div>
		</div>
		<div class="modal-footer">
			<a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Cancel</a> <a
				href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat"
				onclick="$(this).closest('form').submit();">Add</a>
		</div>
	</form>
</div>
<div id="new_school_programme" class="modal" style="width: 20%">
	<form id="schoolProgramForm" name="schoolProgramForm"
		action="<%=request.getContextPath()%>/cms/createSchoolProgram" method="post">
		<input type="hidden" name="schoolId" id="schoolId" value="${id}">
		<div class="modal-content">
			<div class="row">
				<div class="input-field col s12 m12 l12">
					<input id="new_programme_name" name="new_programme_name" type="text" class="validate">
					<label for="new_programme_name">Program Name</label>
				</div>
				<div class="input-field col s12 m12 l12">
					<input id="start_age" name="start_age" type="text" class="validate"> <label
						for="start_age">Start Age</label>
				</div>
				<div class="input-field col s12 m12 l12">
					<input id="end_age" name="end_age" type="text" class="validate"> <label for="end_age">End
						Age</label>
				</div>
				<c:forEach items="${dailyProgramsList}" var="dailyProgram">
					<div class="input-field col s12 m12 l12">
						<input type="checkbox" id="${dailyProgram.dailyProgramId}"
							name="${dailyProgram.dailyProgramId}" class="filled-in" value="yes" /> <label
							for="${dailyProgram.dailyProgramId}">${dailyProgram.name}</label>
					</div>
				</c:forEach>

			</div>
		</div>
		<div class="modal-footer">
			<a href="javascript:void(0);" class=" modal-action modal-close waves-effect waves-green btn-flat">Cancel</a>
			<a href="javascript:void(0);" class=" modal-action modal-close waves-effect waves-green btn-flat"
				onclick="$(this).closest('form').submit();">Add</a>
		</div>
	</form>
</div>
<div id="edit_program_modal" class="modal" style="width: 50%; height: 100%; max-height: 85%;">
	<div class="modal-content">
		<div class="row">
			<div id="content" class="input-field col s12 m12 l12">
				<div class="row">
					<div class="col s12 m12 l12">
						<h5>[Selected Program Name]</h5>
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
						<input id="age_from" type="text" class="validate"> <label for="age_from">From
							Age</label>
					</div>
					<div class="col s12 m4 l4 input-field">
						<input id="age_to" type="text" class="validate"> <label for="age_to">To Age</label>
					</div>
				</div>
				<div class="row">
					<div class="col s12 m11 l11 input-field">
						<textarea id="desc_ta" class="materialize-textarea" maxlength="100" length="100"></textarea>
						<label for="desc_ta">Description</label>
					</div>

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
						<input id="prog_rate_e" type="text" class="validate"> <label for="prog_rate_e">Program
							Rate</label>
					</div>
					<div class="col s12 m4 l4 input-field">
						<select>
							<option value="1">Yearly</option>
							<option value="2">Monthly</option>
							<option value="3" selected>Weekly</option>
							<option value="4">Daily</option>
						</select> <label>Select Period</label>
					</div>

				</div>
				<div class="row">
					<div class="col s12 m4 l4 input-field">
						<input id="start_time_e" type="text" class="validate"> <label for="start_time_e">Start
							Time</label>
					</div>
					<div class="col s12 m4 l4 input-field">
						<input id="end_time_e" type="text" class="validate"> <label for="end_time_e">End
							Time</label>
					</div>
				</div>
				<div class="row">
					<div class="col s12 m12 l12">
						<label style="position: relative;">Billing Period</label>
						<div class="row">
							<div class="col s12 m3 l3 input-field">
								<input id="p_mon_e" type="checkbox" class="filled-in"> <label for="p_mon_e">Monday</label>
							</div>
							<div class="col s12 m3 l3 input-field">
								<input id="p_tue_e" type="checkbox" class="filled-in"> <label for="p_tue_e">Tuesday</label>
							</div>
							<div class="col s12 m3 l3 input-field">
								<input id="p_wed_e" type="checkbox" class="filled-in"> <label for="p_wed_e">Wednesday</label>
							</div>
							<div class="col s12 m3 l3 input-field">
								<input id="p_thu_e" type="checkbox" class="filled-in"> <label for="p_thu_e">Thursday</label>
							</div>
							<div class="col s12 m3 l3 input-field">
								<input id="p_fri_e" type="checkbox" class="filled-in"> <label for="p_fri_e">Friday</label>
							</div>
							<div class="col s12 m3 l3 input-field">
								<input id="p_sat_e" type="checkbox" class="filled-in"> <label for="p_sat_e">Saturday</label>
							</div>
							<div class="col s12 m3 l3 input-field">
								<input id="p_sun_e" type="checkbox" class="filled-in"> <label for="p_sun_e">Sunday</label>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col s12 m10 l10 input-field">
						<textarea id="bill_desc_ta_e" class="materialize-textarea" maxlength="100" length="100"></textarea>
						<label for="bill_desc_ta_e">Description</label>
					</div>

				</div>

			</div>
		</div>
	</div>
	<div class="modal-footer">
		<a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Cancel</a> <a
			href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Edit</a>
	</div>
</div>

<div id="edit_sub_program_modal" class="modal" style="width: 50%; height: 100%; max-height: 85%;">
	<div class="modal-content">
		<div class="row">
			<div id="content" class="input-field col s12 m12 l12">
				<div class="row">
					<div class="col s12 m12 l12">
						<h5>[Selected Program Name]</h5>
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
					<div class="col s12 m6 l6">
						<strong>Criterias:</strong>
					</div>
				</div>

				<div class="row">
					<div class="col s12 m4 l4">
						<p>
							<input type="checkbox" id="t1_e" class="filled-in" checked /> <label for="t1_e">Quantity</label>
						</p>
					</div>
					<div class="col s12 m4 l4">
						<p>
							<input type="checkbox" id="t2_e" class="filled-in" /> <label for="t2_e">Unit</label>
						</p>
					</div>
					<div class="col s12 m4 l4">
						<p>
							<input type="checkbox" id="t3_e" class="filled-in" checked /> <label for="t3_e">Complete
								Status</label>
						</p>
					</div>
					<div class="col s12 m4 l4">
						<p>
							<input type="checkbox" id="t4_e" class="filled-in" /> <label for="t4_e">Temperature</label>
						</p>
					</div>
					<div class="col s12 m4 l4">
						<p>
							<input type="checkbox" id="t5_e" class="filled-in" /> <label for="t5_e">Rashes</label>
						</p>
					</div>
					<div class="col s12 m4 l4">
						<p>
							<input type="checkbox" id="t6_e" class="filled-in" /> <label for="t6_e">Mouth Ulcer</label>
						</p>
					</div>
					<div class="col s12 m4 l4">
						<p>
							<input type="checkbox" id="t7_e" class="filled-in" /> <label for="t7_e">Blister</label>
						</p>
					</div>
					<div class="col s12 m4 l4">
						<p>
							<input type="checkbox" id="t8_e" class="filled-in" /> <label for="t8_e">Drooling
								Saliva</label>
						</p>
					</div>
					<div class="col s12 m4 l4">
						<p>
							<input type="checkbox" id="t9_e" class="filled-in" /> <label for="t9_e">Red Watery
								Eyes</label>
						</p>
					</div>
					<div class="col s12 m4 l4">
						<p>
							<input type="checkbox" id="t10_e" class="filled-in" /> <label for="t10_e">Cough</label>
						</p>
					</div>
					<div class="col s12 m4 l4">
						<p>
							<input type="checkbox" id="t11_e" class="filled-in" /> <label for="t11_e">Runny Nose</label>
						</p>
					</div>
					<div class="col s12 m4 l4">
						<p>
							<input type="checkbox" id="t12_e" class="filled-in" /> <label for="t12_e">Virus</label>
						</p>
					</div>
				</div>

				<div class="row">
					<div class="col s12 m4 l4">
						<div class="input-field">
							<input id="st_1" type="text" class="validate" value="-"> <label for="st_1">Start
								Time</label>
						</div>
					</div>
					<div class="col s12 m4 l4">
						<div class="input-field">
							<input id="et_1" type="text" class="validate" value="-"> <label for="et_1">End
								Time</label>
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
						<input id="b_prog_rate_e" type="text" class="validate" value="100"> <label
							for="b_prog_rate">Program Rate</label>
					</div>
					<div class="col s12 m4 l4 input-field">
						<select>
							<option value="1">Yearly</option>
							<option value="2" selected>Monthly</option>
							<option value="3">Weekly</option>
							<option value="4">Daily</option>
						</select> <label>Select Period</label>
					</div>

				</div>
				<div class="row">
					<div class="col s12 m4 l4 input-field">
						<input id="b_start_time_e" type="text" class="validate" value="09:00am"> <label
							for="b_start_time">Start Time</label>
					</div>
					<div class="col s12 m4 l4 input-field">
						<input id="b_end_time_e" type="text" class="validate" value="10:00am"> <label
							for="b_end_time">End Time</label>
					</div>
				</div>
				<div class="row">
					<div class="col s12 m12 l12">
						<label style="position: relative;">Billing Period</label>
						<div class="row">
							<div class="col s12 m3 l3 input-field">
								<input id="b_p_mon_e" type="checkbox" class="filled-in" checked> <label
									for="b_p_mon_e">Monday</label>
							</div>
							<div class="col s12 m3 l3 input-field">
								<input id="b_p_tue_e" type="checkbox" class="filled-in" checked> <label
									for="b_p_tue_e">Tuesday</label>
							</div>
							<div class="col s12 m3 l3 input-field">
								<input id="b_p_wed_e" type="checkbox" class="filled-in" checked> <label
									for="b_p_wed_e">Wednesday</label>
							</div>
							<div class="col s12 m3 l3 input-field">
								<input id="b_p_thu_e" type="checkbox" class="filled-in" checked> <label
									for="b_p_thu_e">Thursday</label>
							</div>
							<div class="col s12 m3 l3 input-field">
								<input id="b_p_fri_e" type="checkbox" class="filled-in" checked> <label
									for="b_p_fri_e">Friday</label>
							</div>
							<div class="col s12 m3 l3 input-field">
								<input id="b_p_sat_e" type="checkbox" class="filled-in"> <label for="b_p_sat_e">Saturday</label>
							</div>
							<div class="col s12 m3 l3 input-field">
								<input id="b_p_sun_e" type="checkbox" class="filled-in"> <label for="b_p_sun_e">Sunday</label>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col s12 m10 l10 input-field">
						<textarea id="bill_desc_ta_b_e" class="materialize-textarea" maxlength="100" length="100"></textarea>
						<label for="bill_desc_ta_b_e">Description</label>

						<script>
							$('#bill_desc_ta_b_e').val('Meal Plan Bills');
						</script>
					</div>
				</div>

			</div>
		</div>
	</div>
	<div class="modal-footer">
		<a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Cancel</a> <a
			href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Edit</a>
	</div>
</div>

<!-- TODO -->
<div id="new_sub_program_modal" class="modal" style="width: 50%; height: 100%; max-height: 85%;">
	<div class="modal-content">
		<div class="row">
			<div id="content" class="input-field col s12 m12 l12">
				<div class="row">
					<div class="col s12 m12 l12">
						<div class="input-field">
							<input id="prog_name_n" type="text" class="validate" value=""> <label
								for="prog_name_n">Program Name</label>
						</div>
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
					<div class="col s12 m6 l6">
						<strong>Criterias:</strong>
					</div>
				</div>

				<div class="row">
					<div class="col s12 m4 l4">
						<p>
							<input type="checkbox" id="t1_n" class="filled-in" /> <label for="t1_n">Quantity</label>
						</p>
					</div>
					<div class="col s12 m4 l4">
						<p>
							<input type="checkbox" id="t2_n" class="filled-in" /> <label for="t2_n">Unit</label>
						</p>
					</div>
					<div class="col s12 m4 l4">
						<p>
							<input type="checkbox" id="t3_n" class="filled-in" /> <label for="t3_n">Complete
								Status</label>
						</p>
					</div>
					<div class="col s12 m4 l4">
						<p>
							<input type="checkbox" id="t4_n" class="filled-in" /> <label for="t4_n">Temperature</label>
						</p>
					</div>
					<div class="col s12 m4 l4">
						<p>
							<input type="checkbox" id="t5_n" class="filled-in" /> <label for="t5_n">Rashes</label>
						</p>
					</div>
					<div class="col s12 m4 l4">
						<p>
							<input type="checkbox" id="t6_n" class="filled-in" /> <label for="t6_n">Mouth Ulcer</label>
						</p>
					</div>
					<div class="col s12 m4 l4">
						<p>
							<input type="checkbox" id="t7_n" class="filled-in" /> <label for="t7_n">Blister</label>
						</p>
					</div>
					<div class="col s12 m4 l4">
						<p>
							<input type="checkbox" id="t8_n" class="filled-in" /> <label for="t8_n">Drooling
								Saliva</label>
						</p>
					</div>
					<div class="col s12 m4 l4">
						<p>
							<input type="checkbox" id="t9_n" class="filled-in" /> <label for="t9_n">Red Watery
								Eyes</label>
						</p>
					</div>
					<div class="col s12 m4 l4">
						<p>
							<input type="checkbox" id="t10_n" class="filled-in" /> <label for="t10_n">Cough</label>
						</p>
					</div>
					<div class="col s12 m4 l4">
						<p>
							<input type="checkbox" id="t11_n" class="filled-in" /> <label for="t11_n">Runny Nose</label>
						</p>
					</div>
					<div class="col s12 m4 l4">
						<p>
							<input type="checkbox" id="t12_n" class="filled-in" /> <label for="t12_n">Virus</label>
						</p>
					</div>
				</div>

				<div class="row">
					<div class="col s12 m4 l4">
						<div class="input-field">
							<input id="st_1" type="text" class="validate"> <label for="st_1">Start Time</label>
						</div>
					</div>
					<div class="col s12 m4 l4">
						<div class="input-field">
							<input id="et_1" type="text" class="validate"> <label for="et_1">End Time</label>
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
						<input id="b_prog_rate_n" type="text" class="validate"> <label for="b_prog_rate">Program
							Rate</label>
					</div>
					<div class="col s12 m4 l4 input-field">
						<select>
							<option value="1" selected>Yearly</option>
							<option value="2">Monthly</option>
							<option value="3">Weekly</option>
							<option value="4">Daily</option>
						</select> <label>Select Period</label>
					</div>

				</div>
				<div class="row">
					<div class="col s12 m4 l4 input-field">
						<input id="b_start_time_n" type="text" class="validate"> <label for="b_start_time">Start
							Time</label>
					</div>
					<div class="col s12 m4 l4 input-field">
						<input id="b_nnd_time_n" type="text" class="validate"> <label for="b_nnd_time">End
							Time</label>
					</div>
				</div>
				<div class="row">
					<div class="col s12 m12 l12">
						<label style="position: relative;">Billing Period</label>
						<div class="row">
							<div class="col s12 m3 l3 input-field">
								<input id="b_p_mon_n" type="checkbox" class="filled-in"> <label for="b_p_mon_n">Monday</label>
							</div>
							<div class="col s12 m3 l3 input-field">
								<input id="b_p_tue_n" type="checkbox" class="filled-in"> <label for="b_p_tue_n">Tuesday</label>
							</div>
							<div class="col s12 m3 l3 input-field">
								<input id="b_p_wed_n" type="checkbox" class="filled-in"> <label for="b_p_wed_n">Wednesday</label>
							</div>
							<div class="col s12 m3 l3 input-field">
								<input id="b_p_thu_n" type="checkbox" class="filled-in"> <label for="b_p_thu_n">Thursday</label>
							</div>
							<div class="col s12 m3 l3 input-field">
								<input id="b_p_fri_n" type="checkbox" class="filled-in"> <label for="b_p_fri_n">Friday</label>
							</div>
							<div class="col s12 m3 l3 input-field">
								<input id="b_p_sat_n" type="checkbox" class="filled-in"> <label for="b_p_sat_n">Saturday</label>
							</div>
							<div class="col s12 m3 l3 input-field">
								<input id="b_p_sun_n" type="checkbox" class="filled-in"> <label for="b_p_sun_n">Sunday</label>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col s12 m10 l10 input-field">
						<textarea id="bill_desc_ta_b_n" class="materialize-textarea" maxlength="100" length="100"></textarea>
						<label for="bill_desc_ta_b_n">Description</label>

						<!-- <script>
							$('#bill_desc_ta_b_n').val('Meal Plan Bills');
						</script> -->
					</div>
				</div>

			</div>
		</div>
	</div>
	<div class="modal-footer">
		<a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Cancel</a> <a
			href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Create</a>
	</div>
</div>

<script type="text/javascript">
	/* function createNewItemRow() {
		var div = document.createElement("div");
		div.style.background = "red";
		div.style.color = "white";
		div.setAttribute('class', 'row');
		div.innerHTML = "Hello";

		document.body.appendChild(div);
	} */
	/* function createNewItemRow() {
		//var dynamic = ('this is my contact number.');
		$('.old_row').after('<div class="row"><div class="input-field col s6 m6 l6">' + 
				'<select><option value="" selected disabled>Select item</option><option value="1">Pre Scholar Program</option>' + 
				'<option value="2">Infant Program</option></select> <label>Select Item</label></div>'+
				'</div>');
	} */
	var i = 0;
	function createNewItemRow(){
		$('<div class="row"><div class="input-field col s6 m6 l6">' + 
				'<select><option value="" selected disabled>Select item</option><option value="1">Pre Scholar Program</option>' + 
				'<option value="2">Infant Program</option></select> <label>Select Item</label></div>'+
				'<div class="input-field col s4 m4 l4"><select size="5"><option value="" selected disabled>Select quantity</option> '+ 
				'<option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option> '+
				'<option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option>'+
				'<option value="9">9</option><option value="10">10</option></select> <label>Select Quantity</label></div>'+
				'<div class="input-field col s2 m2 l2"><a href="javascript:void(0)" onclick="createNewItemRow();"> '+
				'<img src="<%=request.getContextPath()%>/images/add.png" width="25px" height="25px" /></a>'+
				'<a href="javascript:void(0)" onclick=""><img src="<%=request.getContextPath()%>/images/minus.png" width="25px" height="25px" /></a></div>'+
				'</div>', {
		    id: 'foo_'+i,
		    href: 'http://google.com',
		    title: 'Become a Googler',
		    rel: 'external',
		    text: 'Go to Google!'
		}).appendTo('#bill_content');
		i++;
	}
</script>


