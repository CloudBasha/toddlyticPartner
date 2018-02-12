<%@include file="header.jsp"%>
<%@include file="login_nav.jsp"%>
<main> <%@include file="school_main_menu.jsp"%>
<div class="row container_margin">
	<div class="col s12 m4 l3 left_column">
		<div class="" id="slider" style="height: 574px !important;">
			<div class="slider-content">
				<ul>
					<li id="a"><a name="a" class="title">A</a>
						<ul>
							<li><a href="javascript:void(0)" onclick="showContactDiv();"> <img
									src="<%=request.getContextPath()%>/images/yuna.jpg" width="40px" height="40px"
									class="circle li_student_img" /> Adam
							</a></li>
							<li><a href="/">Alex</a></li>
							<li><a href="/">Ali</a></li>
							<li><a href="/">Apple</a></li>
							<li><a href="/">Arthur</a></li>
							<li><a href="/">Ashley</a></li>
						</ul></li>
					<li id="b"><a name="b" class="title">B</a>
						<ul>
							<li><a href="/">Barry</a></li>
							<li><a href="/">Becky</a></li>
							<li><a href="/">Biff</a></li>
							<li><a href="/">Billy</a></li>
							<li><a href="/">Bozarking</a></li>
							<li><a href="/">Bryan</a></li>
						</ul></li>
					<li id="c"><a name="c" class="title">c</a>
						<ul>
							<li><a href="/">Calista</a></li>
							<li><a href="/">Cathy</a></li>
							<li><a href="/">Chris</a></li>
							<li><a href="/">Cinderella</a></li>
							<li><a href="/">Corky</a></li>
							<li><a href="/">Cypher</a></li>
						</ul></li>
					<li id="d"><a name="d" class="title">d</a>
						<ul>
							<li><a href="/">damien</a></li>
							<li><a href="/">danny</a></li>
							<li><a href="/">denver</a></li>
							<li><a href="/">devon</a></li>
							<li><a href="/">doug</a></li>
							<li><a href="/">dustin</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="col m1 l1"></div>
		<div id="staff_info_div" class="col s12 m8 l8 staff_info_div">
			<h4>[Selected Staff Name]</h4>
			<div class="row">
				<div class="col s12 m5 l5">
					<div class="row form_view_row">
						<div class="col s6 m4 l3 form_view_info_label">
							<label class="Lato_normal_font label_font">Name:</label>
						</div>
						<div class="col s6 m8 l9">
							<input class="form_view_info_input" disabled value="Ali Abu">
						</div>
					</div>
					<div class="row form_view_row">
						<div class="col s6 m4 l3 form_view_info_label">
							<label class="Lato_normal_font label_font">Email:</label>
						</div>
						<div class="col s6 m8 l9">
							<input class="form_view_info_input" disabled value="ali@gmail.com">
						</div>
					</div>
					<div class="row form_view_row">
						<div class="col s6 m4 l3 form_view_info_label">
							<label class="Lato_normal_font label_font">MyKad No:</label>
						</div>
						<div class="col s6 m8 l9">
							<input class="form_view_info_input" disabled value="123456789012">
						</div>
					</div>
					<div class="row form_view_row">
						<div class="col s6 m4 l3 form_view_info_label">
							<label class="Lato_normal_font label_font">Address 1:</label>
						</div>
						<div class="col s6 m8 l9">
							<input class="form_view_info_input" disabled value="A1234 Jalan 123/1">
						</div>
					</div>
					<div class="row form_view_row">
						<div class="col s6 m4 l3 form_view_info_label">
							<label class="Lato_normal_font label_font">City:</label>
						</div>
						<div class="col s6 m8 l9">
							<input class="form_view_info_input" disabled value="Kelana Jaya">
						</div>
					</div>
					<div class="row form_view_row">
						<div class="col s6 m4 l3 form_view_info_label">
							<label class="Lato_normal_font label_font">State:</label>
						</div>
						<div class="col s6 m8 l9">
							<input class="form_view_info_input" disabled value="Selangor">
						</div>
					</div>
				</div>
				<div class="col s12 m5 l5">
					<div class="row form_view_row">
						<div class="col s6 m4 l4 form_view_info_label">
							<label class="Lato_normal_font label_font">Mobile No:</label>
						</div>
						<div class="col s6 m8 l8">
							<input class="form_view_info_input" disabled value="0123456789">
						</div>
					</div>
					<div class="row form_view_row">
						<div class="col s6 m4 l4 form_view_info_label">
							<label class="Lato_normal_font label_font">Car Plate No:</label>
						</div>
						<div class="col s6 m8 l8">
							<input class="form_view_info_input" disabled value="ABC1234">
						</div>
					</div>
					<div class="row form_view_row">
						<div class="col s6 m4 l4 form_view_info_label">
							<label class="Lato_normal_font label_font">Profile:</label>
						</div>
						<div class="col s6 m8 l8">
							<input class="form_view_info_input" disabled value="Teacher">
						</div>
					</div>
					<div class="row form_view_row">
						<div class="col s6 m4 l4 form_view_info_label">
							<label class="Lato_normal_font label_font">Address 2:</label>
						</div>
						<div class="col s6 m8 l8">
							<input class="form_view_info_input" disabled value="Taman Jaya">
						</div>
					</div>
					<div class="row form_view_row">
						<div class="col s6 m4 l4 form_view_info_label">
							<label class="Lato_normal_font label_font">Poscode:</label>
						</div>
						<div class="col s6 m8 l8">
							<input class="form_view_info_input" disabled value="12345">
						</div>
					</div>
					<div class="row form_view_row">
						<div class="col s6 m4 l4 form_view_info_label">
							<label class="Lato_normal_font label_font">Country:</label>
						</div>
						<div class="col s6 m8 l8">
							<input class="form_view_info_input" disabled value="Malaysia">
						</div>
					</div>


				</div>
			</div>
			<div class="row">
				<div class="col m2 m2 l4"></div>
				<div class="col s12 m5 l3">
					<div class="center">
						<a class="waves-effect waves-light blue darken-4 btn center login_button Lato_normal_font"
							href="javascript:void(0)" onclick="switchStaffDiv(2);">Edit</a>
					</div>
				</div>
				<div class="col s12 m5 l3">
					<script type="text/javascript">
						function alertDelete() {
							confirm('Are you sure you want to remove this staff?');
						}
					</script>
					<a class="waves-effect waves-red red btn center login_button Lato_normal_font"
						href="javascript:void(0)" onclick="alertDelete();">Delete</a>
				</div>
			</div>
		</div>
		<!-- STAFF EDIT DIV -->
		<div id="staff_info_edit_div" class="col s12 m8 l8 staff_info_edit_div">
			<h4 class="Lato_normal_font">[Selected Staff Name]</h4>
			<div class="row">
				<div class="col s12 m5 l5">
					<label class="Lato_normal_font label_font">First Name</label> <input>
				</div>
				<div class="col s12 m5 l5">
					<label class="Lato_normal_font label_font">Last Name</label> <input>
				</div>
			</div>
			<div class="row">
				<div class="col s12 m5 l5">
					<label class="Lato_normal_font label_font">Identification No</label> <input>
				</div>
				<!-- This div is for rls_student in the Contacts table -->
				<div class="col s12 m5 l5 input-field edit_gender_select">
					<select>
						<option value="" disabled selected>Select profile</option>
						<option value="1">Teacher</option>
						<option value="2">Admin</option>
					</select> <label class="Lato_normal_font label_font">Profile</label>
				</div>
			</div>
			<div class="row">
				<div class="col s12 m5 l5">
					<label class="Lato_normal_font label_font">Email</label> <input>
				</div>
				<div class="col s12 m5 l5">
					<label class="Lato_normal_font label_font">Home Phone</label> <input>
				</div>
			</div>
			<div class="row">
				<div class="col s12 m5 l5">
					<label class="Lato_normal_font label_font">Car Plate No</label> <input>
				</div>
			</div>
			<div class="row">
				<div class="col s12 m5 l5">
					<label class="Lato_normal_font label_font">Address 1</label> <input>
				</div>
				<div class="col s12 m5 l5">
					<label class="Lato_normal_font label_font">Address 2</label> <input>
				</div>
			</div>
			<div class="row">
				<div class="col s12 m5 l5">
					<label class="Lato_normal_font label_font">Poscode</label> <input>
				</div>
				<div class="col s12 m5 l5">
					<label class="Lato_normal_font label_font">City</label> <input>
				</div>
			</div>
			<div class="row">
				<div class="col s12 m5 l5">
					<label class="Lato_normal_font label_font">State</label> <input>
				</div>
				<div class="col s12 m5 l5">
					<label class="Lato_normal_font label_font">Country</label> <input>
				</div>
			</div>
			<div class="row">
				<div class="col l1"></div>
				<div class="col s12 m4 l4">
					<div class="center">
						<a class="waves-effect waves-light blue darken-4 btn center login_button Lato_normal_font"
							onclick="$(this).closest('form').submit();">Update</a>
					</div>
				</div>
				<div class="col s12 m4 l4">
					<div class="center">
						<a href="javascript:void(0)" onclick="switchStaffDiv(1);"
							class="waves-effect waves-light blue darken-4 btn center login_button Lato_normal_font">Cancel</a>

					</div>
				</div>
			</div>
		</div>
	</div>
</main>
<%@include file="footer.jsp"%>