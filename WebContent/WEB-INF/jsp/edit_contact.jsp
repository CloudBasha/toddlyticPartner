<%@include file="header.jsp"%>
<%@include file="login_nav.jsp"%>
<main> <%@include file="school_main_menu.jsp"%>
<div class="container login_margin_top">
	<div class="row">
		<div class="col s12 m4 l4"></div>
		<div class="col s12 m4 l4">
			<div class="center">
				<h5 class="Lato_normal_font">Edit Contact</h5>
			</div>
		</div>
		<div class="col s12 m4 l4"></div>
	</div>
	<div class="row">
		<div class="col s12 m2 l2"></div>
		<div class="col s12 m4 l4">
			<div>
				<label class="Lato_normal_font">First Name</label>
				<input>
			</div>
			<div>
				<label class="Lato_normal_font">Last Name</label>
				<input>
			</div>
			<div>
				<label class="Lato_normal_font">Identification No</label>
				<input>
			</div>
			<!-- This div is for rls_student in the Contacts table -->
			<div class="input-field">
				<select>
					<option value="" disabled selected>Select role</option>
					<option value="1">Father</option>
					<option value="2">Mother</option>
					<option value="3">Guardian</option>
				</select>
				<label class="Lato_normal_font">Role</label>
			</div>
			<div class="input-field">
				<select>
					<option value="" disabled selected>Select status</option>
					<option value="1">Single</option>
					<option value="2">Married</option>
					<option value="3">Separated</option>
					<option value="4">Divorced</option>
					<option value="5">Widowed</option>
				</select>
				<label class="Lato_normal_font">Marital Status</label>
			</div>
			<div>
				<label class="Lato_normal_font">Email</label>
				<input type="date" class="datepicker">
			</div>

			<div>
				<label class="Lato_normal_font">Home Phone</label>
				<input>
			</div>
		</div>
		<div class="col s12 m4 l4">
			<div>
				<label class="Lato_normal_font">Address 1</label>
				<input>
			</div>
			<div>
				<label class="Lato_normal_font">Address 2</label>
				<input>
			</div>
			<div>
				<label class="Lato_normal_font">Poscode</label>
				<input>
			</div>
			<div>
				<label class="Lato_normal_font">City</label>
				<input>
			</div>
			<div>
				<label class="Lato_normal_font">State</label>
				<input>
			</div>
			<div>
				<label class="Lato_normal_font">Country</label>
				<input>
			</div>
			<div>
				<label class="Lato_normal_font">Car Plate No</label>
				<input>
			</div>
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
		<div class="col s12 m2 l2"></div>
	</div>
	<div class="row">
		<div class="col s12 m2 l2"></div>
		<div class="col s12 m4 l4">Work Information</div>
	</div>

	<div class="row">
		<div class="col s12 m2 l2"></div>
		<div class="col s12 m4 l4">
			<div>
				<label class="Lato_normal_font">Occupation</label>
				<input>
			</div>
			<div>
				<label class="Lato_normal_font">Employed By</label>
				<input>
			</div>
			<div>
				<label class="Lato_normal_font">Work Hours</label>
				<input>
			</div>
			<div>
				<label class="Lato_normal_font">Office Phone</label>
				<input>
			</div>
			<div>
				<label class="Lato_normal_font">Work Address 1</label>
				<input>
			</div>
			<div>
				<label class="Lato_normal_font">Work Address 2</label>
				<input>
			</div>
			<div>
				<label class="Lato_normal_font">Poscode</label>
				<input>
			</div>
			<div>
				<label class="Lato_normal_font">City</label>
				<input>
			</div>
			<div>
				<label class="Lato_normal_font">State</label>
				<input>
			</div>
		</div>
		<div class="col s12 m4 l4">
		
		</div>
		<div class="col s12 m2 l2"></div>
		
	</div>
	<div class="row">
		<div class="col s12 m4 l4"></div>
		<div class="col s12 m4 l4">
			<div class="center">
				<a class="waves-effect waves-light blue darken-4 btn center login_button Lato_normal_font">Create</a>
			</div>
		</div>
		<div class="col s12 m4 l4"></div>
	</div>


</div>
</main>
<%@include file="footer.jsp"%>