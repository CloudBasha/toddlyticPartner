<%@include file="header.jsp"%>
</head>
<body>
<%@include file="login_nav.jsp"%>
<script>
function isDeleteMethod(isDelete) {
	var form = document.getElementById('editForm');
    if (isDelete){
       
    }
    else{
		    		form.submit();
		            return true;
    }
}

$(document).ready(function(){
	$('.modal-trigger').on('click',function(event){
	    event.preventDefault(); // prevent the default handling
	    var schoolId = $(this).attr('title');
	    var url='<%=request.getContextPath()%>/cms/getSchoolById';
	    var param = {schoolId:schoolId};
	    $.ajax({url:url,data:param,type: "get", cache: false,dataType: 'json', contentType: 'application/json',
		    mimeType: 'application/json',success:function(data){
	    	$('#schoolId').val(data.schoolId);
	    	$('#schoolName').val(data.schoolName);
	    	$('#address').val(data.contactStreetAddressOne);
	    	$('#addressTwo').val(data.contactStreetAddressTwo);
	    	$('#postCode').val(data.contactAddressPostCode);
	    	$('#city').val(data.contactAddressCity);
	    	$('#state').val(data.contactAddressState);
	    	$('#contactAddressCountry').val(data.contactAddressCountry);
	    	$('#schoolNameSpan').val(data.schoolName)
	    	$('#billingAddress').val(data.billingAddressOne);
	    	$('#billingAddressTwo').val(data.billingAddressTwo);
	    	$('#billingAddressPostCode').val(data.billingAddressPostCode);
	    	$('#billingAddressCity').val(data.billingAddressCity);
	    	$('#billingAddressState').val(data.billingAddressState);
	    	$('#billingAddressCountry').val(data.billingAddressCountry);
	    	
	    	$('#contactNumber').val(data.contactNumber);
	    	$('#mobileNumber').val(data.mobileNumber);
	    	$('#faxNumber').val(data.faxNumber);
	    	$('#website').val(data.website);
	    	$('#calendarId').val(data.calendarId);
	    	$('#currency').val(data.currency);
	    	$('#billThresholdDue').val(data.billThresholdDue);
	    	
	    	if(data.imageUrl!='' && data.imageUrl.length >0){
	    		var imageUrl ='<%=request.getContextPath()%>/cms/image?schoolId=' + data.schoolId;
						var text = 'Logo';
						$("div#imageSection").append('<a target="_blank" href="' + imageUrl + '">' + text + '</a>');
					}
				}
			});
		});
	});
</script>

<main>
<div class="container login_margin_top">
	<div class="row">
		<div class="col s12 m12 l12 center">
			<span class="Lato_normal_font add_school_txt" >Add School</span><a class="btn-floating btn-large waves-effect waves-light blue lighten-1" data-position="left" data-delay="300" data-tooltip="Add School"
			href="<%=request.getContextPath()%>/cms/create_school">
			<i class="material-icons">add</i>
		</a>
		</div>
	</div>
	<div class="row center school_row_margin_bottom">
	
	<c:forEach items="${schoolList}" var="school">
		<div class="col s12 m4 l4 school_div">
			<a href="<%=request.getContextPath()%>/cms/schoolHome/${school.schoolId}">
			<img src="<%=request.getContextPath()%>/images/school_ico.png" width="50px" height="50px" /><br/>
			${school.schoolName}
			</a>
			
			<ol class="school_progress_ul">
				<li>Add Staffs</li>
				<li>Select Programs</li>
				<li>Select Meals</li>
				<li>Add Students</li>
			</ol>
		</div>
	</c:forEach>	
	</div>
</div>

<%-- <div class="fixed-action-btn" style="bottom: 45px; right: 24px;">
	<div class="col s12 m2 l2">
		<a class="btn-floating btn-large waves-effect waves-light blue lighten-1 tooltipped" data-position="left" data-delay="300" data-tooltip="Add School"
			href="<%=request.getContextPath()%>/cms/create_school">
			<i class="material-icons">add</i>
		</a>
	</div>
</div> --%>
</main>
<%@include file="footer.jsp"%>