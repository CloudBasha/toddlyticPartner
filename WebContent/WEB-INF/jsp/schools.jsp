<%@include file="header.jsp"%>
<%@include file="login_nav.jsp"%>

<main>
<div class="row">
	<div class="col s12 m2 l2 left_column">
		<div class="row">
			<div class="s12 m12 l12 input-field">
				<input id="searchInput" type="text" class="validate" /> <label for="searchInput">Search</label>
			</div>
		</div>
		<div class="row">
			<div id="categories" class="s12 m12 l12">
				<a id="cat_0" href="javascript:void(0)" onclick="swSchDiv(8);"
					class="categories_selection waves-effect waves-toddlyticBlue btn-flat categories_selection_active">School</a>
				<a id="cat_1" href="javascript:void(0)" onclick="swSchDiv(0);"
					class="categories_selection waves-effect waves-toddlyticBlue btn-flat">Programs</a> <a id="cat_2"
					href="javascript:void(0)" onclick="swSchDiv(1);"
					class="categories_selection waves-effect waves-toddlyticBlue btn-flat">Calendars</a> <a id="cat_3"
					href="javascript:void(0)" onclick="swSchDiv(2);"
					class="categories_selection waves-effect waves-toddlyticBlue btn-flat">Holidays</a> <a id="cat_4"
					href="javascript:void(0)" onclick="swSchDiv(3);"
					class="categories_selection waves-effect waves-toddlyticBlue btn-flat">Menus</a> <a id="cat_5"
					href="javascript:void(0)" onclick="swSchDiv(4);"
					class="categories_selection waves-effect waves-toddlyticBlue btn-flat">Packages</a> <a id="cat_6"
					href="javascript:void(0)" onclick="swSchDiv(5);"
					class="categories_selection waves-effect waves-toddlyticBlue btn-flat">Requests</a> <a id="cat_7"
					href="javascript:void(0)" onclick="swSchDiv(6);"
					class="categories_selection waves-effect waves-toddlyticBlue btn-flat">Rooms</a> <a id="cat_8"
					href="javascript:void(0)" onclick="swSchDiv(7);"
					class="categories_selection waves-effect waves-toddlyticBlue btn-flat">Services</a>
					<a id="cat_9"
					href="javascript:void(0)" onclick="swSchDiv(9);"
					class="categories_selection waves-effect waves-toddlyticBlue btn-flat">Enrollment</a>
			</div>
		</div>
	</div>
	<div class="col s12 m10 l10">
		<%@include file="schools/school_home.jsp"%>
		<%@include file="schools/school_program_div/schools_program_div.jsp"%>
		<%@include file="schools/list_calendar.jsp"%>
		<%@include file="schools/list_holidays.jsp"%>
		<%@include file="schools/list_menus.jsp"%>
		<%@include file="schools/list_packages.jsp"%>
		<%@include file="schools/list_requests.jsp"%>
		<%@include file="schools/list_rooms.jsp"%>
		<%@include file="schools/list_services.jsp"%>
		<%@include file="schools/list_enrollment.jsp"%>
	</div>
</div>
</main>
<script type="text/javascript">

	$(document).ready(function() {
		document.getElementById('school_calendar_div').style.display = 'none';
	});
	
	function reRenderCategories(){
		document.getElementById('categories').style.display = 'none';
		setTimeout(function(){
			document.getElementById('categories').style.display = 'block';
			/* $( "#book" ).animate({
			    opacity: 0.25,
			    left: "+=50",
			    height: "toggle"
			  }, 5000, function() {
			    // Animation complete.
			  }); */
		}, 10);
	}
	function swSchDiv(d) {
		switch (d) {
		case 0:
			document.getElementById('school_program_div').style.display = 'block';
			document.getElementById('school_calendar_div').style.display = 'none';
			document.getElementById('school_holidays_div').style.display = 'none';
			document.getElementById('school_menus_div').style.display = 'none';
			document.getElementById('school_packages_div').style.display = 'none';
			document.getElementById('school_requests_div').style.display = 'none';
			document.getElementById('school_rooms_div').style.display = 'none';
			document.getElementById('school_services_div').style.display = 'none';
			document.getElementById('school_home_div').style.display = 'none';
			document.getElementById('school_enrollment_div').style.display = 'none';
			document.getElementById('cat_0').classList.remove("categories_selection_active");
			$('#cat_1').addClass('categories_selection_active');
			document.getElementById('cat_2').classList.remove("categories_selection_active");
			document.getElementById('cat_3').classList.remove("categories_selection_active");
			document.getElementById('cat_4').classList.remove("categories_selection_active");
			document.getElementById('cat_5').classList.remove("categories_selection_active");
			document.getElementById('cat_6').classList.remove("categories_selection_active");
			document.getElementById('cat_7').classList.remove("categories_selection_active");
			document.getElementById('cat_8').classList.remove("categories_selection_active");
			$('ul.tabs').tabs();
			
			reRenderCategories();	
			break;
		case 1:
			document.getElementById('school_program_div').style.display = 'none';
			document.getElementById('school_calendar_div').style.display = 'block';
			document.getElementById('school_holidays_div').style.display = 'none';
			document.getElementById('school_menus_div').style.display = 'none';
			document.getElementById('school_packages_div').style.display = 'none';
			document.getElementById('school_requests_div').style.display = 'none';
			document.getElementById('school_rooms_div').style.display = 'none';
			document.getElementById('school_services_div').style.display = 'none';
			document.getElementById('school_home_div').style.display = 'none';
			document.getElementById('school_enrollment_div').style.display = 'none';
			document.getElementById('cat_0').classList.remove("categories_selection_active");
			document.getElementById('cat_1').classList.remove("categories_selection_active");
			$('#cat_2').addClass('categories_selection_active');
			document.getElementById('cat_3').classList.remove("categories_selection_active");
			document.getElementById('cat_4').classList.remove("categories_selection_active");
			document.getElementById('cat_5').classList.remove("categories_selection_active");
			document.getElementById('cat_6').classList.remove("categories_selection_active");
			document.getElementById('cat_7').classList.remove("categories_selection_active");
			document.getElementById('cat_8').classList.remove("categories_selection_active");
			
			reRenderCategories();
			break;
		case 2:
			document.getElementById('school_program_div').style.display = 'none';
			document.getElementById('school_calendar_div').style.display = 'none';
			document.getElementById('school_holidays_div').style.display = 'block';
			document.getElementById('school_menus_div').style.display = 'none';
			document.getElementById('school_packages_div').style.display = 'none';
			document.getElementById('school_requests_div').style.display = 'none';
			document.getElementById('school_rooms_div').style.display = 'none';
			document.getElementById('school_services_div').style.display = 'none';
			document.getElementById('school_home_div').style.display = 'none';
			document.getElementById('school_enrollment_div').style.display = 'none';
			document.getElementById('cat_0').classList.remove("categories_selection_active");
			document.getElementById('cat_1').classList.remove("categories_selection_active");
			document.getElementById('cat_2').classList.remove("categories_selection_active");
			$('#cat_3').addClass('categories_selection_active');
			document.getElementById('cat_4').classList.remove("categories_selection_active");
			document.getElementById('cat_5').classList.remove("categories_selection_active");
			document.getElementById('cat_6').classList.remove("categories_selection_active");
			document.getElementById('cat_7').classList.remove("categories_selection_active");
			document.getElementById('cat_8').classList.remove("categories_selection_active");
			
			$('ul.tabs').tabs();
			reRenderCategories();
			break;
		case 3:
			document.getElementById('school_program_div').style.display = 'none';
			document.getElementById('school_calendar_div').style.display = 'none';
			document.getElementById('school_holidays_div').style.display = 'none';
			document.getElementById('school_menus_div').style.display = 'block';
			document.getElementById('school_packages_div').style.display = 'none';
			document.getElementById('school_requests_div').style.display = 'none';
			document.getElementById('school_rooms_div').style.display = 'none';
			document.getElementById('school_services_div').style.display = 'none';
			document.getElementById('school_home_div').style.display = 'none';
			document.getElementById('school_enrollment_div').style.display = 'none';
			document.getElementById('cat_0').classList.remove("categories_selection_active");
			document.getElementById('cat_1').classList.remove("categories_selection_active");
			document.getElementById('cat_2').classList.remove("categories_selection_active");
			document.getElementById('cat_3').classList.remove("categories_selection_active");
			$('#cat_4').addClass('categories_selection_active');
			document.getElementById('cat_5').classList.remove("categories_selection_active");
			document.getElementById('cat_6').classList.remove("categories_selection_active");
			document.getElementById('cat_7').classList.remove("categories_selection_active");
			document.getElementById('cat_8').classList.remove("categories_selection_active");
			
			reRenderCategories();
			break;
		case 4:
			document.getElementById('school_program_div').style.display = 'none';
			document.getElementById('school_calendar_div').style.display = 'none';
			document.getElementById('school_holidays_div').style.display = 'none';
			document.getElementById('school_menus_div').style.display = 'none';
			document.getElementById('school_packages_div').style.display = 'block';
			document.getElementById('school_requests_div').style.display = 'none';
			document.getElementById('school_rooms_div').style.display = 'none';
			document.getElementById('school_services_div').style.display = 'none';
			document.getElementById('school_home_div').style.display = 'none';
			document.getElementById('school_enrollment_div').style.display = 'none';
			document.getElementById('cat_0').classList.remove("categories_selection_active");
			document.getElementById('cat_1').classList.remove("categories_selection_active");
			document.getElementById('cat_2').classList.remove("categories_selection_active");
			document.getElementById('cat_3').classList.remove("categories_selection_active");
			document.getElementById('cat_4').classList.remove("categories_selection_active");
			$('#cat_5').addClass('categories_selection_active');
			document.getElementById('cat_6').classList.remove("categories_selection_active");
			document.getElementById('cat_7').classList.remove("categories_selection_active");
			document.getElementById('cat_8').classList.remove("categories_selection_active");
			
			reRenderCategories();
			break;
		case 5:
			document.getElementById('school_program_div').style.display = 'none';
			document.getElementById('school_calendar_div').style.display = 'none';
			document.getElementById('school_holidays_div').style.display = 'none';
			document.getElementById('school_menus_div').style.display = 'none';
			document.getElementById('school_packages_div').style.display = 'none';
			document.getElementById('school_requests_div').style.display = 'block';
			document.getElementById('school_rooms_div').style.display = 'none';
			document.getElementById('school_services_div').style.display = 'none';
			document.getElementById('school_home_div').style.display = 'none';
			document.getElementById('school_enrollment_div').style.display = 'none';
			document.getElementById('cat_0').classList.remove("categories_selection_active");
			document.getElementById('cat_1').classList.remove("categories_selection_active");
			document.getElementById('cat_2').classList.remove("categories_selection_active");
			document.getElementById('cat_3').classList.remove("categories_selection_active");
			document.getElementById('cat_4').classList.remove("categories_selection_active");
			document.getElementById('cat_5').classList.remove("categories_selection_active");
			$('#cat_6').addClass('categories_selection_active');
			document.getElementById('cat_7').classList.remove("categories_selection_active");
			document.getElementById('cat_8').classList.remove("categories_selection_active");
			
			$('ul.tabs').tabs();
			reRenderCategories();
			break;
		case 6:
			document.getElementById('school_program_div').style.display = 'none';
			document.getElementById('school_calendar_div').style.display = 'none';
			document.getElementById('school_holidays_div').style.display = 'none';
			document.getElementById('school_menus_div').style.display = 'none';
			document.getElementById('school_packages_div').style.display = 'none';
			document.getElementById('school_requests_div').style.display = 'none';
			document.getElementById('school_rooms_div').style.display = 'block';
			document.getElementById('school_services_div').style.display = 'none';
			document.getElementById('school_home_div').style.display = 'none';
			document.getElementById('school_enrollment_div').style.display = 'none';
			document.getElementById('cat_0').classList.remove("categories_selection_active");
			document.getElementById('cat_1').classList.remove("categories_selection_active");
			document.getElementById('cat_2').classList.remove("categories_selection_active");
			document.getElementById('cat_3').classList.remove("categories_selection_active");
			document.getElementById('cat_4').classList.remove("categories_selection_active");
			document.getElementById('cat_5').classList.remove("categories_selection_active");
			document.getElementById('cat_6').classList.remove("categories_selection_active");
			$('#cat_7').addClass('categories_selection_active');
			document.getElementById('cat_8').classList.remove("categories_selection_active");
			
			reRenderCategories();
			break;
		case 7:
			document.getElementById('school_program_div').style.display = 'none';
			document.getElementById('school_calendar_div').style.display = 'none';
			document.getElementById('school_holidays_div').style.display = 'none';
			document.getElementById('school_menus_div').style.display = 'none';
			document.getElementById('school_packages_div').style.display = 'none';
			document.getElementById('school_requests_div').style.display = 'none';
			document.getElementById('school_rooms_div').style.display = 'none';
			document.getElementById('school_services_div').style.display = 'block';
			document.getElementById('school_home_div').style.display = 'none';
			document.getElementById('school_enrollment_div').style.display = 'none';
			document.getElementById('cat_0').classList.remove("categories_selection_active");
			document.getElementById('cat_1').classList.remove("categories_selection_active");
			document.getElementById('cat_2').classList.remove("categories_selection_active");
			document.getElementById('cat_3').classList.remove("categories_selection_active");
			document.getElementById('cat_4').classList.remove("categories_selection_active");
			document.getElementById('cat_5').classList.remove("categories_selection_active");
			document.getElementById('cat_6').classList.remove("categories_selection_active");
			document.getElementById('cat_7').classList.remove("categories_selection_active");
			$('#cat_8').addClass('categories_selection_active');
			
			reRenderCategories();
			break;
		case 8:
			document.getElementById('school_program_div').style.display = 'none';
			document.getElementById('school_calendar_div').style.display = 'none';
			document.getElementById('school_holidays_div').style.display = 'none';
			document.getElementById('school_menus_div').style.display = 'none';
			document.getElementById('school_packages_div').style.display = 'none';
			document.getElementById('school_requests_div').style.display = 'none';
			document.getElementById('school_rooms_div').style.display = 'none';
			document.getElementById('school_services_div').style.display = 'none';
			document.getElementById('school_home_div').style.display = 'block';
			document.getElementById('school_enrollment_div').style.display = 'none';
			document.getElementById('cat_1').classList.remove("categories_selection_active");
			document.getElementById('cat_2').classList.remove("categories_selection_active");
			document.getElementById('cat_3').classList.remove("categories_selection_active");
			document.getElementById('cat_4').classList.remove("categories_selection_active");
			document.getElementById('cat_5').classList.remove("categories_selection_active");
			document.getElementById('cat_6').classList.remove("categories_selection_active");
			document.getElementById('cat_7').classList.remove("categories_selection_active");
			document.getElementById('cat_8').classList.remove("categories_selection_active");
			$('#cat_0').addClass('categories_selection_active');
			
			reRenderCategories();
			break;
		case 9:
			document.getElementById('school_program_div').style.display = 'none';
			document.getElementById('school_calendar_div').style.display = 'none';
			document.getElementById('school_holidays_div').style.display = 'none';
			document.getElementById('school_menus_div').style.display = 'none';
			document.getElementById('school_packages_div').style.display = 'none';
			document.getElementById('school_requests_div').style.display = 'none';
			document.getElementById('school_rooms_div').style.display = 'none';
			document.getElementById('school_services_div').style.display = 'none';
			document.getElementById('school_home_div').style.display = 'none';
			document.getElementById('school_enrollment_div').style.display = 'block';
			document.getElementById('cat_1').classList.remove("categories_selection_active");
			document.getElementById('cat_2').classList.remove("categories_selection_active");
			document.getElementById('cat_3').classList.remove("categories_selection_active");
			document.getElementById('cat_4').classList.remove("categories_selection_active");
			document.getElementById('cat_5').classList.remove("categories_selection_active");
			document.getElementById('cat_6').classList.remove("categories_selection_active");
			document.getElementById('cat_7').classList.remove("categories_selection_active");
			document.getElementById('cat_8').classList.remove("categories_selection_active");
			$('#cat_0').addClass('categories_selection_active');
			
			reRenderCategories();
			break;
		}
	}
</script>
<%@include file="footer.jsp"%>