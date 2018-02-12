<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<spring:url value="/" var="baseUrl" />
<!doctype html>
<html ng-app="toddlyticApp">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0" />
<title>Toddlytic</title>

<!-- CSS  -->
<link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Lato" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/jquery-ui.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/jquery.ui.theme.css" />
<script src="<%=request.getContextPath()%>/bower_components/jquery/dist/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/bower_components/jquery-ui/jquery-ui.min.js"></script>
<link href="<%=request.getContextPath()%>/css/slidernav.css" type="text/css" rel="stylesheet"
	media="screen,projection" />
<link href="<%=request.getContextPath()%>/bower_components/materialize/dist/css/materialize.css"
	type="text/css" rel="stylesheet" media="screen,projection" />
<link
	href="<%=request.getContextPath()%>/bower_components/materialize-clockpicker/dist/css/materialize.clockpicker.css"
	type="text/css" rel="stylesheet" media="screen,projection" />
<link href="<%=request.getContextPath()%>/css/master.css" type="text/css" rel="stylesheet"
	media="screen,projection" />
<link href="<%=request.getContextPath()%>/css/fullcalendar.min.css" type="text/css" rel="stylesheet" />
<link href="<%=request.getContextPath()%>/css/fullcalendar.print.css" type="text/css"
	rel="stylesheet" media="print" />
<link href="<%=request.getContextPath()%>/css/bootstrap-social.css" type="text/css" rel="stylesheet" />
<link href="<%=request.getContextPath()%>/css/font-awesome.css" type="text/css" rel="stylesheet" />
<link href="<%=request.getContextPath()%>/bower_components/angular-material/angular-material.css"
	type="text/css" rel="stylesheet" media="screen,projection" />
<script src="<%=request.getContextPath()%>/bower_components/materialize/dist/js/materialize.js"
	type="text/javascript"></script>
<script
	src="<%=request.getContextPath()%>/bower_components/materialize-clockpicker/dist/js/materialize.clockpicker.js"
	type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/slidernav.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/moment.min.js" type="text/javascript"></script>
<%-- <script src="<%=request.getContextPath()%>/js/fullcalendar.min.js" type="text/javascript"></script> --%>
<script src="<%=request.getContextPath()%>/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/alphanumeric.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/jquery.canvasjs.min.js" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.0.1/fullcalendar.min.js"
	type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/bower_components/moment/src/moment.js"
	type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/jquery.steps.min.js"
	type="text/javascript"></script>
	
<script
	src="<%=request.getContextPath()%>/bower_components/angular/angular.js"
	type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/bower_components/a0-angular-storage/dist/angular-storage.js"
	type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/bower_components/angular-material/angular-material.js"
	type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/bower_components/angular-materialize/src/angular-materialize.js"
	type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/bower_components/lodash/dist/lodash.js"
	type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/angularControllers.js"
	type="text/javascript"></script>
<!-- 
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
 -->
<script>
	function myFunction() {
		var x = document.getElementById("myTopnav");
		if (x.className === "topnav") {
			x.className += " responsive";
		} else {
			x.className = "topnav";
		}
	}

	$(document).ready(function() {
		$(".button-collapse").sideNav();
		$('select').material_select();
		$('.tooltipped').tooltip({
			delay : 50
		});
		$('.modal-trigger').leanModal({
			dismissible : true
		});
		$('ul.tabs').tabs();
		$('.datepicker').pickadate({
			selectMonths : true,
			selectYears : 15
		});
		$('#slider').sliderNav();
		$('.carousel.carousel-slider').carousel({
			full_width : true
		});
		$('.materialboxed').materialbox();

		$('.collapsible').collapsible({
			accordion : false
		// A setting that changes the collapsible behavior to expandable instead of the default accordion style
		});
		$('.scrollspy').scrollSpy();
	});
</script>
<!-- 
<script type="text/javascript">
	google.charts.load('current', {
		'packages' : [ 'line' ]
	});
	google.charts.setOnLoadCallback(drawChart);

	function drawChart() {

		var data = new google.visualization.DataTable();
		data.addColumn('number', 'Count');
		data.addColumn('number', 'Parent Login');
		data.addColumn('number', 'School Activity');
		data.addColumn('number', 'Student Attendance');

		data.addRows([ [ 1, 37.8, 80.8, 41.8 ], [ 2, 30.9, 69.5, 32.4 ], [ 3, 25.4, 57, 25.7 ], [ 4, 11.7, 18.8, 10.5 ], [ 5, 11.9, 17.6, 10.4 ], [ 6, 8.8, 13.6, 7.7 ], [ 7, 7.6, 12.3, 9.6 ], [ 8, 12.3, 29.2, 10.6 ], [ 9, 16.9, 42.9, 14.8 ], [ 10, 12.8, 30.9, 11.6 ], [ 11, 5.3, 7.9, 4.7 ], [ 12, 6.6, 8.4, 5.2 ], [ 13, 4.8, 6.3, 3.6 ], [ 14, 4.2, 6.2, 3.4 ] ]);

		var options = {
			chart : {
				title : 'School Stats',
				subtitle : 'in counts'
			},
			width : 900,
			height : 500
		};

		var chart = new google.charts.Line(document.getElementById('chart_div'));

		chart.draw(data, options);
	}
</script>
 -->
<script type="text/javascript">
	function showStudentDiv() {
		document.getElementById('landing_div').style.display = 'none';
		document.getElementById('student_info').style.display = 'block';
	}

	function showContactDiv() {
		document.getElementById('c_landing_div').style.display = 'none';
		document.getElementById('contact_info').style.display = 'block';
	}

	function showPhotoDiv() {
		document.getElementById('default_photo_div').style.display = 'none';
		document.getElementById('student_photo_div').style.display = 'block';
	}

	function showProgrammeDiv(x) {
		if (x == 1) {
			document.getElementById('org_info_div').style.display = 'block';
			document.getElementById('daily_prog_div').style.display = 'none';
			document.getElementById('sc_prog_div').style.display = 'none';
			document.getElementById('sc_prog_edit_div').style.display = 'none';
			document.getElementById('daily_prog_edit_div').style.display = 'none';
		} else if (x == 2) {
			document.getElementById('org_info_div').style.display = 'none';
			document.getElementById('daily_prog_div').style.display = 'block';
			document.getElementById('sc_prog_div').style.display = 'none';
			document.getElementById('sc_prog_edit_div').style.display = 'none';
			document.getElementById('daily_prog_edit_div').style.display = 'none';
		} else if (x == 3) {
			document.getElementById('org_info_div').style.display = 'none';
			document.getElementById('daily_prog_div').style.display = 'none';
			document.getElementById('sc_prog_div').style.display = 'block';
			document.getElementById('sc_prog_edit_div').style.display = 'none';
			document.getElementById('daily_prog_edit_div').style.display = 'none';
		} else if (x == 4) {
			document.getElementById('org_info_div').style.display = 'none';
			document.getElementById('daily_prog_div').style.display = 'none';
			document.getElementById('sc_prog_div').style.display = 'none';
			document.getElementById('sc_prog_edit_div').style.display = 'block';
			document.getElementById('daily_prog_edit_div').style.display = 'none';
		} else if (x == 5) {
			document.getElementById('org_info_div').style.display = 'none';
			document.getElementById('daily_prog_div').style.display = 'none';
			document.getElementById('sc_prog_div').style.display = 'none';
			document.getElementById('sc_prog_edit_div').style.display = 'none';
			document.getElementById('daily_prog_edit_div').style.display = 'block';
		}
	}

	function showProfileDiv() {
		document.getElementById('org_info_div').style.display = 'none';
		document.getElementById('school_global_div').style.display = 'block';
	}

	function switchStaffDiv(a) {
		if (a == 1) {
			document.getElementById('staff_info_div').style.display = 'block';
			document.getElementById('staff_info_edit_div').style.display = 'none';
		} else if (a == 2) {
			document.getElementById('staff_info_div').style.display = 'none';
			document.getElementById('staff_info_edit_div').style.display = 'block';
		}
	}

	function switchStuInfoDiv(sCase) {
		switch (sCase) {
		case 1:
			document.getElementById('view_student_info').style.display = 'none';
			document.getElementById('student_landing_div').style.display = 'none';
			document.getElementById('student_info').style.display = 'block';
			document.getElementById('student_func').style.display = 'none';
			break;
		case 2:
			document.getElementById('view_student_info').style.display = 'block';
			document.getElementById('student_landing_div').style.display = 'none';
			document.getElementById('student_func').style.display = 'block';
			document.getElementById('student_info').style.display = 'none';
			break;
		default:
			document.getElementById('student_landing_div').style.display = 'block';
			document.getElementById('student_info').style.display = 'none';
			document.getElementById('student_func').style.display = 'none';
			document.getElementById('view_student_info').style.display = 'none';
			break;
		}
	}

	function switchConInfoDiv(sCase) {
		switch (sCase) {
		case 1:
			document.getElementById('view_contact_info').style.display = 'none';
			document.getElementById('c_landing_div').style.display = 'none';
			document.getElementById('contact_info').style.display = 'block';
			break;
		case 2:
			document.getElementById('view_contact_info').style.display = 'block';
			document.getElementById('c_landing_div').style.display = 'none';
			document.getElementById('contact_info').style.display = 'none';
			break;
		default:
			document.getElementById('c_landing_div').style.display = 'block';
			document.getElementById('contact_info').style.display = 'none';
			document.getElementById('view_contact_info').style.display = 'none';
			break;
		}
	}
</script>
</head>
<body>