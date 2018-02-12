<%@include file="header.jsp"%>
<%
String action = (String) request.getAttribute("action");
String availableTags = (String) request.getAttribute("studentData");
%>
<style type="text/css">
.ui-autocomplete {
    z-index: 5000;
}
</style>
<script>
var lastSelectedName = '';
var lastSelectedId = '';

function addStudentToPhoto(){
	$('#tags').val('');
	$('#selectedStudent').append('<p id="'+lastSelectedId+'">'+lastSelectedName+'&nbsp; <a href="#" onclick="deleteSelectedStudent('+lastSelectedId+')">&nbsp;<img src="<%=request.getContextPath() %>/images/delete.png" width="20" height="20"></a></p>');
	 $('<input />').attr('type', 'hidden')
     .attr('name', "selectedStudents")
     .attr('id', lastSelectedId)
     .attr('value', lastSelectedId)
     .appendTo('#addPhotoForm');
	 lastSelectedName = '';
	 lastSelectedId = '';
}

function deleteSelectedStudent(studentId){
	$("#"+studentId).remove();
}

$(document).ready(function(){
	var action ='<%=action%>';
	if(action=='listAlbum'){
		$("#albumLink").addClass("active");
		$('#albumLink').click();
	}
	else if(action=='addPhoto'){
		$('#photo').openModal();
	}
	else{
		$("#photoLink").addClass("active");
	}
	
	$('#photoLink').click(function(event){
		window.location.href="<%=request.getContextPath()%>/cms/listPhoto/${id}";
	});
	
	$('#albumLink').click(function(event){
		window.location.href="<%=request.getContextPath()%>/cms/listAlbum/${id}";
	});
	
});

$(function() {
  <%=availableTags%>
  function split( val ) {
    return val.split( /,\s*/ );
  }
  function extractLast( term ) {
    return split( term ).pop();
  }

  $( "#tags" )
    // don't navigate away from the field on tab when selecting an item
    .on( "keydown", function( event ) {
      if ( event.keyCode === $.ui.keyCode.TAB &&
          $( this ).autocomplete( "instance" ).menu.active ) {
    	  
        event.preventDefault();
      }
    })
    .autocomplete({
      minLength: 0,
      source: availableTags,
      focus: function() {
        // prevent value inserted on focus
        return false;
      },
      select: function( event, ui ) {
        lastSelectedId=ui.item.id;
        lastSelectedName=ui.item.value;
      },
      change: function (event, ui) {
          if (!ui.item) {
              this.value = '';
          }
      }
    });
} );


</script>
</head>
<body>

<%@include file="login_nav.jsp"%>
<script type="text/javascript">
	document.getElementById("login_title_logo").src = "<%=request.getContextPath()%>/images/pre_school_logo.jpg";
</script>
<main> <%@include file="school_main_menu.jsp"%>
<div style="margin-top: 30px;">
	<div class="row">
		<div class="col s12 m4 l3 left_column">
			<div class="row">
				<div class="col s12 m12 l12">
					<div class="row">
						<div class="input-field col s12">
							<i class="material-icons prefix">textsms</i>
							<input type="text" id="autocomplete-input" class="autocomplete">
							<label for="autocomplete-input">Search Photo</label>
						</div>

						<div class="col s12 m12 l12" style="margin-top: 40px;">
							<!-- <a class="waves-effect waves-teal btn-flat left_menu_btn modal-trigger" href="#photo">Add Photo</a> -->
							<a class="waves-effect waves-teal btn-flat left_menu_btn modal-trigger" href="<%=request.getContextPath()%>/cms/addPhoto/${id}">Add Photo</a> 
						</div>

						<div class="col s12 m12 l12">
							<a class="waves-effect waves-teal btn-flat left_menu_btn modal-trigger" href="#album">Create New Album</a>
						</div>
					</div>
					
					<div id="slider" style="height: 574px !important;">
				<div class="slider-content">
					<ul>
						<li id="a">
							<a name="a" class="title">A</a>
							<ul>
								<li>
									<a href="javascript:void(0)" onclick="showPhotoDiv();">
										<img src="<%=request.getContextPath()%>/images/yuna.jpg" width="40px" height="40px" class="circle li_student_img" />
										Adam
									</a>
								</li>
								<li>
									<a href="/">Alex</a>
								</li>
								<li>
									<a href="/">Ali</a>
								</li>
								<li>
									<a href="/">Apple</a>
								</li>
								<li>
									<a href="/">Arthur</a>
								</li>
								<li>
									<a href="/">Ashley</a>
								</li>
							</ul>
						</li>
						<li id="b">
							<a name="b" class="title">B</a>
							<ul>
								<li>
									<a href="/">Barry</a>
								</li>
								<li>
									<a href="/">Becky</a>
								</li>
								<li>
									<a href="/">Biff</a>
								</li>
								<li>
									<a href="/">Billy</a>
								</li>
								<li>
									<a href="/">Bozarking</a>
								</li>
								<li>
									<a href="/">Bryan</a>
								</li>
							</ul>
						</li>
						<li id="c">
							<a name="c" class="title">c</a>
							<ul>
								<li>
									<a href="/">Calista</a>
								</li>
								<li>
									<a href="/">Cathy</a>
								</li>
								<li>
									<a href="/">Chris</a>
								</li>
								<li>
									<a href="/">Cinderella</a>
								</li>
								<li>
									<a href="/">Corky</a>
								</li>
								<li>
									<a href="/">Cypher</a>
								</li>
							</ul>
						</li>
						<li id="d">
							<a name="d" class="title">d</a>
							<ul>
								<li>
									<a href="/">damien</a>
								</li>
								<li>
									<a href="/">danny</a>
								</li>
								<li>
									<a href="/">denver</a>
								</li>
								<li>
									<a href="/">devon</a>
								</li>
								<li>
									<a href="/">doug</a>
								</li>
								<li>
									<a href="/">dustin</a>
								</li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
				</div>
			</div>
		</div>
		<div class="col s12 m12 l1"></div>
		<!-- 
		<div id="student_photo_div" class="col s12 m6 l6 student_photo_div">
		<div class="col s12">
				<ul class="tabs">
					<li class="tab col s3">
						<a class="active" href="#studentPhoto">Photo</a>
					</li>
					<li class="tab col s3">
						<a href="#studentAlbum">Album</a>
					</li>
				</ul>
			</div>
			<div id="studentPhoto" class="col s12 m12 l12 photo_content_margin">
				<div class="row">
					<div class="col s12 m4 l3">
						<img class="materialboxed" width="100%" src="<%=request.getContextPath()%>/images/birthday1.jpg">
					</div>
					<div class="col s12 m4 l3">
						<img class="materialboxed" width="100%" src="<%=request.getContextPath()%>/images/birthday1.jpg">
					</div>
					<div class="col s12 m4 l3">
						<img class="materialboxed" width="100%" src="<%=request.getContextPath()%>/images/snack_day.jpg">
					</div>
					<div class="col s12 m4 l3">
						<img class="materialboxed" width="100%" src="<%=request.getContextPath()%>/images/sample-1.jpg">
					</div>
				</div>
			</div>
			<div id="studentAlbum" class="col s12 m12 l12 photo_content_margin">
				<div class="row">
					<c:forEach items="${albumsList}" var="album">
					<div class="col s12 m4 l3">
						<img width="100%" src="<%=request.getContextPath()%>/images/album.png">
						<p class="center">${album.name}</p>
					</div>
					</c:forEach>
				</div>
			</div>
		
		</div>
		 -->
		 
		<div id="default_photo_div" class="col s12 m6 l6 default_photo_div">
			<div class="col s12">
				<ul class="tabs">
					<li class="tab col s3">
						<!-- <a class="active" href="#defaultPhoto" id="photoLink">Photo</a>-->
						<a class="active" href="#" id="photoLink">Photo</a>
					</li>
					<li class="tab col s3">
					<a id="albumLink" href="#">Album</a>
						<!-- <a href="#defaultAlbum" id="albumLink" href="<%=request.getContextPath()%>/cms/listAlbum/${id}"> Album </a> -->
					</li>
				</ul>
			</div>
			<div id="defaultPhoto" class="col s12 m12 l12 photo_content_margin">
				<div class="row">
					<c:forEach items="${photosList}" var="photo">
					<div class="col s12 m4 l3">
						<a class="modal-trigger" href="#view_photo"><img width="100%" src="<%=request.getContextPath()%>/cms/albumphoto?id=${photo.photoId}"></a>
					</div>
					</c:forEach>
				</div>
			</div>
			<div id="defaultAlbum" class="col s12 m12 l12 photo_content_margin">
				<div class="row">
					<c:forEach items="${albumsList}" var="album">
					<div class="col s12 m4 l3">
						<img width="100%" src="<%=request.getContextPath()%>/images/album.png">
						<p class="center">${album.name}</p>
					</div>
					</c:forEach>
				</div>
			</div>
		</div>
		<div class="col s12 m12 l3"></div>
		
	</div>

	<%@include file="shortcut_div.jsp"%>
</div>

</main>
<%@include file="footer.jsp"%>