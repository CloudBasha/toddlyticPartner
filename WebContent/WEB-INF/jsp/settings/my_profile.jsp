<div id="my_profile_div" class="my_profile_div">
	<div class="row">
		<div class="col s12 m9 l9">
			<div id="profile_info_card" class="card profile_info_card">
				<div class="row profile_margin">
					<div class="col s12 m3 l3">
						<img src="<%=request.getContextPath()%>/images/yuna.jpg" class="circle responsive-img" />
					</div>
					<div class="col s12 m9 l9 profile_info_row">
						<div class="row form_view_row">
							<div class="col s3 m3 l2 profile_label infoFieldDiv ">
								<span class="infoFieldLabel">Name:</span>
							</div>
							<div class="col s9 m3 l4">
								<input id="name" type="text" disabled value="Lucy Anthony" class="infoFieldInput">
							</div>
							<div class="col s3 m3 l2 infoFieldDiv profile_label">
								<span class="infoFieldLabel">Email:</span>
							</div>
							<div class="col s9 m3 l4">
								<input id="name" type="text" disabled value="lucy@gmail.com" class="infoFieldInput">
							</div>
						</div>
						<div class="row form_view_row">
							<div class="col s3 m3 l2 infoFieldDiv profile_label">
								<span class="infoFieldLabel">Mobile:</span>
							</div>
							<div class="col s9 m3 l4">
								<input id="name" type="text" disabled value="0123456789" class="infoFieldInput">
							</div>
							<div class="col s3 m3 l2 infoFieldDiv profile_label">
								<span class="infoFieldLabel">Role:</span>
							</div>
							<div class="col s9 m3 l4">
								<input id="name" type="text" disabled value="Teacher" class="infoFieldInput">
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col s3 m3 l2">
						<span class="infoFieldLabel">Time format:</span>
					</div>
					<div class="col s9 m3 l4">
						<span class="infoFieldLabel">HH:mm:ss</span>
					</div>
					<div class="col s3 m3 l2">
						<span class="infoFieldLabel">Date format:</span>
					</div>
					<div class="col s9 m3 l4">
						<span class="infoFieldLabel">yyyy-MM-dd</span>
					</div>
				</div>
				<div class="row">
					<div class="col s3 m3 l2">
						<span class="infoFieldLabel">Currency:</span>
					</div>
					<div class="col s9 m3 l4">
						<span class="infoFieldLabel">Ringgit Malaysia</span>
					</div>
					<div class="col s3 m3 l2">
						<span class="infoFieldLabel">Timezone:</span>
					</div>
					<div class="col s9 m3 l4">
						<span class="infoFieldLabel">Kuala Lumpur, Singapore</span>
					</div>
				</div>
				<div class="row">
					<div class="col s3 m3 l2">
						<span class="infoFieldLabel">Language:</span>
					</div>
					<div class="col s9 m3 l4">
						<span class="infoFieldLabel">English</span>
					</div>
					<div class="col s3 m3 l2">
						<span class="infoFieldLabel">My Manager:</span>
					</div>
					<div class="col s9 m3 l4">
						<span class="infoFieldLabel">Alice</span>
					</div>
				</div>
				<div class="row">
					<div class="col s12 m12 l12 right-align profile_edit_row">
						<a href="javascript:void(0)" onclick="" class="btn waves-effect">View Privileges</a> <a
							href="javascript:void(0)" onclick="" class="btn waves-effect">Edit</a>
					</div>
				</div>
			</div>




		</div>
		<div class="col s12 m3 l3">
			<div class="row profile_sub_menus">
				<div class="col s12 m12 l12">
					<a href="#changePasswordModal"
						class="waves-effect waves-teal btn categories_selection modal-trigger"><i
						class="material-icons left">add</i>Change Password</a>
				</div>
			</div>
			<div class="row sc_prog_right_options">
				<div class="col s12 m12 l12">
					<a href="#addMoreFieldModal"
						class="waves-effect waves-teal btn categories_selection modal-trigger"><i
						class="material-icons left">add</i>Add More Fields</a>
				</div>
			</div>
			<div class="row sc_prog_right_options">
				<div class="col s12 m12 l12">
					<a href="#socialLoginModal"
						class="waves-effect waves-teal btn categories_selection modal-trigger"><i
						class="material-icons left">add</i>Social Accounts</a>
				</div>
			</div>

		</div>
	</div>

	<div id="changePasswordModal" class="changePasswordModal modal modal-fixed-footer">
		<div class="modal-content">
			<div class="row">
				<div class="col s12 m12 l12">
					<h5 class="Lato_normal_font">Change Password</h5>
				</div>
			</div>
			<div class="row form_view_row input-field">
				<div class="col s12 m12 l12 input-field">
					<input type="text" class="validate" id="oldPassword" /> <label for="oldPassword">Old
						Password</label>
				</div>
			</div>
			<div class="row form_view_row">
				<div class="col s12 m12 l12 input-field">
					<input type="text" class="validate" id="newPassword" /> <label for="newPassword">New
						Password</label>
				</div>
			</div>
			<div class="row form_view_row">
				<div class="col s12 m12 l12 input-field">
					<input type="text" class="validate" id="confirmPassword" /> <label for="confirmPassword">Confirm
						Password</label>
				</div>
			</div>
		</div>
		<div class="modal-footer">
			<a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Cancel</a> <a
				href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Save</a>
		</div>
	</div>

	<div id="addMoreFieldModal" class="addMoreFieldModal modal modal-fixed-footer">
		<div class="modal-content">
			<div class="row">
				<div class="col s12 m12 l12">
					<h5 class="Lato_normal_font">Add More Fields</h5>
				</div>
			</div>
			<div class="row form_view_row">
				<div class="col s5 m5 l5 input-field">
					<select>
						<option value="" disabled selected>Select field</option>
						<option value="1">Second email</option>
						<option value="2">Third email</option>
					</select>
				</div>
				<div class="col s5 m5 l5 input-field">
					<input type="text" class="validate" />
				</div>
				<div class="col s2 m1 l1 center">
					<a href="javascript:void(0)" onclick="" class="waves-effect btn-flat add_mf_btn"><i
						class="material-icons">add</i></a>
				</div>
			</div>
		</div>
		<div class="modal-footer">
			<a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Cancel</a> <a
				href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Save</a>
		</div>
	</div>

	<div id="socialLoginModal" class="socialLoginModal modal modal-fixed-footer">
		<div class="modal-content">
			<div class="row">
				<div class="col s12 m12 l12">
					<h5 class="Lato_normal_font">Social Logins</h5>
				</div>
			</div>
			<div class="row">
				<div class="col s12 offset-m3 m6 offset-l3 l6 center">
					<a class="btn btn-fb btn-block btn-social btn-facebook waves-effect"> <span
						class="fa fa-facebook"></span> Sign in with Facebook
					</a>
				</div>
			</div>
			<div class="row">
				<div class="col s12 offset-m3 m6 offset-l3 l6 center">
					<a class="btn btn-google btn-block btn-social btn-google waves-effect"> <span
						class="fa fa-google"></span> Sign in with Google
					</a>
				</div>
			</div>
			<div class="row">
				<div class="col s12 offset-m3 m6 offset-l3 l6 center">
					<a class="btn btn-linkedin btn-block btn-social btn-linkedin waves-effect"> <span
						class="fa fa-linkedin"></span> Sign in with Linkedin
					</a>
				</div>
			</div>
			<div class="row">
				<div class="col s12 offset-m3 m6 offset-l3 l6 center">
					<a class="btn btn-twitter btn-block btn-social btn-twitter waves-effect"> <span
						class="fa fa-twitter"></span> Sign in with Twitter
					</a>
				</div>
			</div>
		</div>
		<div class="modal-footer">
			<a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Done</a>
		</div>
	</div>

</div>