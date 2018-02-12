<%@include file="header.jsp"%>
</head>
<body>
	<%@include file="standard_nav.jsp"%>
	<main> <script type="text/javascript">
		$(document).ready(function() {
			var welcomeModal = $('#welcome');

			if ($.cookie('noShowWelcome'))
				welcomeModal.closeModal();
			else {
				welcomeModal.openModal();
			}

			$("#close-welcome").click(function() {
				welcomeModal.closeModal();
				$.cookie('noShowWelcome', true);
			});
		});

		function transitDiv(whichDiv) {
			switch (whichDiv) {
			case 0:
				$('#gs_school_div').fadeIn('slow', function() {
					$('#gs_program_div').fadeOut('slow');
					$('#gs_teacher_div').fadeOut('slow');
					$('#gs_student_div').fadeOut('slow');
					$('#gs_parent_div').fadeOut('slow');
				});

				break;
			case 1:
				$('#gs_program_div').fadeIn('slow', function() {
					$('#gs_school_div').fadeOut('slow');
					$('#gs_teacher_div').fadeOut('slow');
					$('#gs_student_div').fadeOut('slow');
					$('#gs_parent_div').fadeOut('slow');
				});
				document.getElementById('gs_1_chk').style.display = 'block';
				break;
			case 2:
				$('#gs_teacher_div').fadeIn('slow', function() {
					$('#gs_school_div').fadeOut('slow');
					$('#gs_program_div').fadeOut('slow');
					$('#gs_student_div').fadeOut('slow');
					$('#gs_parent_div').fadeOut('slow');
				});
				document.getElementById('gs_2_chk').style.display = 'block';
				break;
			case 3:
				$('#gs_student_div').fadeIn('slow', function() {
					$('#gs_school_div').fadeOut('slow');
					$('#gs_teacher_div').fadeOut('slow');
					$('#gs_program_div').fadeOut('slow');
					$('#gs_parent_div').fadeOut('slow');
				});
				document.getElementById('gs_3_chk').style.display = 'block';
				break;
			case 4:
				$('#gs_parent_div').fadeIn('slow', function() {
					$('#gs_school_div').fadeOut('slow');
					$('#gs_teacher_div').fadeOut('slow');
					$('#gs_program_div').fadeOut('slow');
					$('#gs_student_div').fadeOut('slow');
				});
				document.getElementById('gs_4_chk').style.display = 'block';
				break;
			}
		}

		function gsComplete() {
			Materialize.toast('You have completed the basic setup!', 3000, 'rounded');
		}

		var count = 0;
		var tCount = 0;

		function createNewStudentRow() {
			if (count == 0) {
				count++;
				$('#stu_first_row').after('<div id="stu_first_row_'+count+'" class="row">'
				+ '<div class="col s3 m3 l3 input-field"><input id="gs_stu_fn_'+count+'" type="text" class="validate">'
				+ '<label for="gs_stu_fn_'+count+'">First Name</label></div>'
				+ '<div class="col s3 m3 l3 input-field"><input id="gs_stu_ln_'+count+'" type="text" class="validate">'
				+ '<label for="gs_stu_ln_'+count+'">Last Name</label></div>'
				+ '<div class="col s3 m4 l4 input-field"><input id="gs_stu_dob_'+count+'" type="date" class="datepicker"> <label for="gs_stu_dob_'+count+'">Date of Birth</label></div>'
				+ '<div class="col s3 m2 l2 center"><a href="javascript:void(0)" onclick="createNewStudentRow();">'
				+ '<img class="gs_summary_stu_addBtn" src="<%=request.getContextPath()%>/images/add.png" width="30px" height="30px" /></a></div></div>');
			} else if (count > 0) {
				var tempCount = count + 1;
				$('#stu_first_row_'+count).after('<div id="stu_first_row_'+tempCount+'" class="row">'
						+ '<div class="col s3 m3 l3 input-field"><input id="gs_stu_fn_'+tempCount+'" type="text" class="validate">'
						+ '<label for="gs_stu_fn_'+tempCount+'">First Name</label></div>'
						+ '<div class="col s3 m3 l3 input-field"><input id="gs_stu_ln_'+tempCount+'" type="text" class="validate">'
						+ '<label for="gs_stu_ln_'+tempCount+'">Last Name</label></div>'
						+ '<div class="col s3 m4 l4 input-field"><input id="gs_stu_dob_'+tempCount+'" type="date" class="datepicker"> <label for="gs_stu_dob_'+tempCount+'">Date of Birth</label></div>'
						+ '<div class="col s3 m2 l2 center"><a href="javascript:void(0)" onclick="createNewStudentRow();">'
						+ '<img class="gs_summary_stu_addBtn" src="<%=request.getContextPath()%>/images/add.png" width="30px" height="30px" /></a></div></div>');
				count++;
			}
			$('.datepicker').pickadate({
				selectMonths : true, // Creates a dropdown to control month
				selectYears : 15
			// Creates a dropdown of 15 years to control year
			});
		}
		
		function createNewTeacherRow(){
			if (tCount == 0) {
				tCount++;
				$('#par_first_row').after('<div id="par_first_row_'+tCount+'" class="row">'
						+ '<div class="col s10 m10 l10 input-field"><input id="gs_par_email_'+tCount+'" type="text" class="validate">'
						+ '<label for="gs_par_email_'+tCount+'">Email</label></div>'
						+ '<div class="col s2 m2 l2 center"><a href="javascript:void(0)" onclick="createNewTeacherRow();">'
						+ '<img class="gs_summary_stu_addBtn" src="<%=request.getContextPath()%>/images/add.png" width="30px" height="30px" /></a>'
						+ '</div></div>');
			} else if(tCount > 0){
				var ttCount = tCount + 1;
				$('#par_first_row').after('<div id="par_first_row_'+ttCount+'" class="row">'
						+ '<div class="col s10 m10 l10 input-field"><input id="gs_par_email_'+ttCount+'" type="text" class="validate">'
						+ '<label for="gs_par_email_'+ttCount+'">Email</label></div>'
						+ '<div class="col s2 m2 l2 center"><a href="javascript:void(0)" onclick="createNewTeacherRow();">'
						+ '<img class="gs_summary_stu_addBtn" src="<%=request.getContextPath()%>/images/add.png" width="30px" height="30px" /></a>' + '</div></div>');

				tCount++;
			}
		}
	</script>

	<div class="container">
		<!-- Welcome Div -->
		<div id="welcome" class="modal" style="width: 30%;">
			<div class="modal-content">
				<div class="row">
					<div class="col s12 m12 l12 center">
						<span class="Lato_normal_font welcome_text">Hi (Name), <br />Welcome to Toddlytic!<br />
							Let's get started on the basic setup!
						</span>
					</div>
				</div>
			</div>
			<div class="modal-footer center">
				<a id="close-welcome" href="javascript:void(0)"
					class="modal-action modal-close waves-effect waves-green btn-flat welcome_footer">START</a>
			</div>
		</div>


		<div class="row">
			<div class="col s12 m6 l5">
				<div class="row">
					<div class="col s12 m12 l12">
						<h5 class="Lato_light_font">Getting Started</h5>
					</div>
				</div>
				<div class="row">
					<div class="col s10 m10 l10">
						<a href="javascript:void(0)" onclick=""
							class="waves-effect waves-light btn blue lighten-2 getting_start_btn">1. School Details</a>
					</div>
					<div id="gs_1_chk" class="col s2 m2 l2 gs_1_chk">
						<input type="checkbox" id="gs_1_chk_b" checked="checked" disabled /> <label for="gs_1_chk_b"></label>
					</div>
				</div>
				<div class="row">
					<div class="col s10 m10 l10">
						<a href="javascript:void(0)" onclick=""
							class="waves-effect waves-light btn blue lighten-2 getting_start_btn">2. Select Programs</a>
					</div>
					<div id="gs_2_chk" class="col s2 m2 l2 gs_2_chk">
						<input type="checkbox" id="gs_2_chk_b" checked="checked" disabled /> <label for="gs_2_chk_b"></label>
					</div>
				</div>
				<div class="row">
					<div class="col s10 m10 l10">
						<a href="javascript:void(0)" onclick=""
							class="waves-effect waves-light btn blue lighten-2 getting_start_btn">3. Invite Teachers</a>
					</div>
					<div id="gs_3_chk" class="col s2 m2 l2 gs_3_chk">
						<input type="checkbox" id="gs_3_chk_b" checked="checked" disabled /> <label for="gs_3_chk_b"></label>
					</div>
				</div>
				<div class="row">
					<div class="col s10 m10 l10">
						<a href="javascript:void(0)" onclick=""
							class="waves-effect waves-light btn blue lighten-2 getting_start_btn">4. Add Students</a>
					</div>
					<div id="gs_4_chk" class="col s2 m2 l2 gs_4_chk">
						<input type="checkbox" id="gs_4_chk_b" checked="checked" disabled /> <label for="gs_4_chk_b"></label>
					</div>
				</div>
				<div class="row">
					<div class="col s10 m10 l10">
						<a href="javascript:void(0)" onclick=""
							class="waves-effect waves-light btn blue lighten-2 getting_start_btn">5. Launch Toddlytic</a>
					</div>
					<div id="gs_5_chk" class="col s2 m2 l2 gs_5_chk">
						<input type="checkbox" id="gs_5_chk_b" checked="checked" disabled /> <label for="gs_5_chk_b"></label>
					</div>
				</div>
			</div>
			<div class="col s12 m6 l7">
				<!-- School Div -->
				<div id="gs_school_div" class="card-panel gs_school_div">
					<div class="row">
						<div class="col s12 m12 l12 input-field">
							<h5 class="Lato_light_font">School Details</h5>
						</div>
					</div>
					<div class="row">
						<div class="col s12 m12 l12 input-field">
							<input id="school_name" type="text" class="validate"> <label for="school_name">School
								Name</label>
						</div>
					</div>
					<div class="row">
						<div class="col s12 m12 l12  file-field input-field">
							<div class="btn">
								<span>Logo</span> <input type="file">
							</div>
							<div class="file-path-wrapper">
								<input class="file-path validate" type="text">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col s12 m12 l12 gs_col_next">
							<a id="firstNext" href="javascript:void(0)" onclick="transitDiv(1);"
								class="waves-effect waves-light btn" onkeyup="submitClick(0);">Next</a>
						</div>
					</div>
				</div>

				<!-- Program Div -->
				<div id="gs_program_div" class="gs_program_div">
					<div class="card-panel">
						<div class="row">
							<div class="col s12 m12 l12 input-field">
								<h5 class="Lato_light_font">Select Programs</h5>
							</div>
						</div>
						<div class="row">
							<div class="col s12 m16 l6">
								<p>
									<input type="checkbox" class="filled-in" id="gs_infant" checked="checked" /> <label
										for="gs_infant">Infant Program</label>
								</p>
								<p>
									<input type="checkbox" class="filled-in" id="gs_toddler" checked="checked" /> <label
										for="gs_toddler">Toddler Program</label>
								</p>
							</div>
							<div class="col s12 m16 l6">
								<p>
									<input type="checkbox" class="filled-in" id="gs_pre" checked="checked" /> <label
										for="gs_pre">Pre School Program</label>
								</p>
								<p>
									<input type="checkbox" class="filled-in" id="gs_daycare" checked="checked" /> <label
										for="gs_daycare">Daycare Program</label>
								</p>
							</div>
						</div>
						<div class="row">
							<div class="col s6 offset-m2 m5 offset-l5 l3">
								<a href="javascript:void(0)" onclick="transitDiv(0);" class="waves-effect waves-light btn">Back</a>
							</div>
							<div class="col s6 m5 l3">
								<a id="secondNext" href="javascript:void(0)" onclick="transitDiv(2);"
									class="waves-effect waves-light btn">Next</a>
							</div>
						</div>
					</div>
				</div>
				<!-- Teacher Div -->
				<div id="gs_teacher_div" class="gs_teacher_div">
					<div class="card-panel">
						<div class="row">
							<div class="col s12 m12 l12 input-field">
								<h5 class="Lato_light_font">Invite Teachers</h5>
							</div>
						</div>
						<div class="row">
							<div class="col s12 m12 l12">
								<div id="par_first_row" class="row par_first_row">
									<div class="col s10 m10 l0 input-field">
										<input id="gs_par_email" type="text" class="validate"> <label for="gs_par_email">Email</label>
									</div>
									<div class="col s3 m2 l2 center">
										<a href="javascript:void(0)" onclick="createNewTeacherRow();"><img
											class="gs_summary_stu_addBtn" src="<%=request.getContextPath()%>/images/add.png"
											width="30px" height="30px" /></a>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col s12 offset-m6 m3 offset-l6 l3">
								<a href="javascript:void(0)" onclick="transitDiv(1);" class="waves-effect waves-light btn">Back</a>
							</div>
							<div class="col s12 m3 l3">
								<a id="thirdNext" href="javascript:void(0)" onclick="transitDiv(3);"
									class="waves-effect waves-light btn">Next</a>
							</div>
						</div>
					</div>
				</div>
				<!-- Student Div -->
				<div id="gs_student_div" class=" gs_student_div">
					<div class="card-panel">
						<div class="row">
							<div class="col s12 m12 l12 input-field">
								<h5 class="Lato_light_font">Add Students</h5>
							</div>
						</div>
						<div class="row">
							<div class="col s12 m12 l12">
								<div id="stu_first_row" class="row stu_first_row">
									<div class="col s3 m13 l3 input-field">
										<input id="gs_stu_fn" type="text" class="validate"> <label for="gs_stu_fn">First
											Name</label>
									</div>
									<div class="col s3 m13 l3 input-field">
										<input id="gs_stu_ln" type="text" class="validate"> <label for="gs_stu_ln">Last
											Name</label>
									</div>
									<!-- <div class="col s3 m14 l4 input-field">
										<select>
											<option value="" disabled selected>Select Program</option>
											<option value="1">Infant Program</option>
											<option value="2">Pre School Program</option>
										</select>
									</div> -->
									<div class="col s3 m14 l4 input-field">
										<input id="gs_stu_dob" type="date" class="datepicker"> <label for="gs_stu_dob">Date
											of Birth</label>
									</div>
									<div class="col s3 m12 l2 center">
										<a href="javascript:void(0)" onclick="createNewStudentRow();"><img
											class="gs_summary_stu_addBtn" src="<%=request.getContextPath()%>/images/add.png"
											width="30px" height="30px" /></a>
									</div>
								</div>
							</div>

						</div>
						<div class="row">
							<div class="col s12 offset-m6 m3 offset-l6 l3">
								<a href="javascript:void(0)" onclick="transitDiv(2);" class="waves-effect waves-light btn">Back</a>
							</div>
							<div class="col s12 m3 l3">
								<a id="fourthNext" href="javascript:void(0)" onclick="transitDiv(4);"
									class="waves-effect waves-light btn">Next</a>
							</div>
						</div>
					</div>
				</div>
				<!-- Parent Div -->
				<div id="gs_parent_div" class="card-panel gs_parent_div">
					<div class="row">
						<div class="col s12 m12 l12 input-field">
							<h5 class="Lato_light_font">Summary</h5>
						</div>
					</div>
					<div class="row">
						<div class="col s12 m12 l12">
							<div class="row">
								<div class="col s5 m4 l4">
									<div class="gs_summary_schName">
										<span class="Lato_normal_font">School Name: </span>
									</div>
								</div>
								<div class="col s7 m8 l8">
									<input type="text" disabled value="Q Dees Subang" />
								</div>
							</div>
							<div class="row">
								<div class="col s5 m4 l4">
									<div class="">
										<span class="Lato_normal_font">School Logo: </span>
									</div>
								</div>
								<div class="col s7 m8 l8">
									<img src="<%=request.getContextPath()%>/images/pre_school_logo.jpg" class="responsive-img" />
								</div>
							</div>
							<div class="row">
								<div class="col s5 m4 l4 input-field">
									<div class="gs_summary_progName">
										<span class="Lato_normal_font">Programs: </span>
									</div>
								</div>
								<div class="col s7 m8 l8 input-field gs_summary_prog_chkbox">
									<p>
										<input type="checkbox" class="filled-in" id="gs_infant" checked="checked" disabled /> <label
											for="gs_infant">Infant Program</label>
									</p>
									<p>
										<input type="checkbox" class="filled-in" id="gs_toddler" checked="checked" disabled /> <label
											for="gs_toddler">Toddler Program</label>
									</p>
								</div>
							</div>
							<div class="row">
								<div class="col s5 m4 l4">
									<div>
										<span class="Lato_normal_font">Invited Teachers: </span>
									</div>
								</div>
								<div class="col s7 m8 l8">
									<span class="Lato_light_font">mark@gmail.com</span><br /> <span class="Lato_light_font">alice@yahoo.com</span><br />
									<span class="Lato_light_font">johny@john.com</span><br /> <span class="Lato_light_font">good@one.com</span><br />
								</div>
							</div>

							<div class="row">
								<div class="col s5 m4 l4">
									<div>
										<span class="Lato_normal_font">Added Students: </span>
									</div>
								</div>
								<div class="col s7 m8 l8">
									<span class="Lato_light_font">John Smith (8 September 2016)</span><br /> <span
										class="Lato_light_font">Jane Smith (9 September 2016)</span><br /> <span
										class="Lato_light_font">Adam Smith (10 September 2016)</span><br /> <span
										class="Lato_light_font">Kevin Smith (11 September 2016)</span><br />
								</div>
							</div>
						</div>

					</div>
					<div class="row">
						<div class="col s12 offset-m6 m3 offset-l6 l3">
							<a href="javascript:void(0)" onclick="transitDiv(3);" class="waves-effect waves-light btn">Back</a>
						</div>
						<div class="col s12 m3 l3">
							<a id="fifthNext" href="javascript:void(0)" onclick="gsComplete();"
								class="waves-effect waves-light btn">Launch</a>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
	</main>
	<%@include file="footer.jsp"%>