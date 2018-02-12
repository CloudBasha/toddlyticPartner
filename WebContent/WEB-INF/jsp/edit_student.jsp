<%@include file="header.jsp"%>
<%@include file="login_nav.jsp"%>
<main> <%@include file="school_main_menu.jsp"%>
<div class="container login_margin_top">
	<div class="row">
		<div class="col s12 m2 l2"></div>
		<div class="col s12 m4 l4">Edit Student</div>
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
				<label class="Lato_normal_font">Preferred Name To Be Called</label>
				<input>
			</div>
			<div>
				<label class="Lato_normal_font">Date of Birth</label>
				<input type="date" class="datepicker">
			</div>
			<div class="input-field">
				<select>
					<option value="" disabled selected>Select gender</option>
					<option value="1">Male</option>
					<option value="2">Female</option>
				</select>
				<label class="Lato_normal_font">Gender</label>

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
				<label class="Lato_normal_font">Address 3</label>
				<input>
			</div>
			<div>
				<label class="Lato_normal_font">Medication</label>
				<input>
			</div>
			<div>
				<label class="Lato_normal_font">Peditrician Name</label>
				<input>
			</div>
			<div>
				<label class="Lato_normal_font">Peditrician Contact No</label>
				<input>
			</div>
		</div>
		<div class="col s12 m2 l2"></div>
	</div>

	<div class="row">
		<div class="col s12 m4 l4"></div>
		<div class="col s12 m4 l4">
			<div class="center">
				<a class="waves-effect waves-light blue darken-4 btn center login_button Lato_normal_font">Edit</a>
			</div>
		</div>
		<div class="col s12 m4 l4"></div>
	</div>


</div>
</main>
<%@include file="footer.jsp"%>