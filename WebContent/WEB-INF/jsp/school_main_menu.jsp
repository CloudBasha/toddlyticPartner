<div id="menu_div">
	<ul class="topnav" id="myTopnav">
		<li>
			<a id="schoolHome" class="Lato_normal_font" href="<%=request.getContextPath()%>/cms/schoolHome/${id}">Home</a>
		</li>
		<%-- <li>
			<a id="list_student" class="Lato_normal_font" href="<%=request.getContextPath()%>/cms/list_student/${id}">Students</a>
		</li>
		<li>
			<a id="list_contact" class="Lato_normal_font" href="<%=request.getContextPath()%>/cms/list_contact/${id}">Contacts</a>
		</li> --%>
		<li>
			<a id="listPhoto" class="Lato_normal_font" href="<%=request.getContextPath()%>/list_people">People</a>
		</li>
		<li>
			<a id="listPhoto" class="Lato_normal_font" href="<%=request.getContextPath()%>/cms/listPhoto/${id}">Photos</a>
		</li>
		<li>
			<a id="list_newsletter_dashboard" class="Lato_normal_font" href="<%=request.getContextPath()%>/newsletter_dashboard">News</a>
		</li>
		<%-- <li>
			<a id="list_school_staff" class="Lato_normal_font" href="<%=request.getContextPath()%>/cms/list_school_staff/${id}">Staff</a>
		</li> --%>
		<%-- <li>
			<a id="list_school_staff" class="Lato_normal_font" href="<%=request.getContextPath()%>/school_staff/">Staff</a>
		</li> --%>
		<li>
			<a id="list_programs" class="Lato_normal_font" href="<%=request.getContextPath()%>/cms/list_programs">Programs</a>
		</li>
		<%-- <li>
			<a id="list_meals" class="Lato_normal_font" href="<%=request.getContextPath()%>/cms/list_meals">Meals</a>
		</li> --%>
		<li>
			<a id="list_messages" class="Lato_normal_font" href="">Messages</a>
		</li>
		<li>
			<a id="list_calendar" class="Lato_normal_font" href="<%=request.getContextPath()%>/list_calendar/">Events</a>
		</li>
		<li>
			<a id="bill" class="Lato_normal_font" href="<%=request.getContextPath()%>/bill">Bills</a>
		</li>
		<li>
			<a id="school_setting" class="Lato_normal_font" href="<%=request.getContextPath()%>/school_setting">Settings</a>
		</li>
		<li class="icon">
			<a href="javascript:void(0);" onclick="myFunction()">
				<img src="<%=request.getContextPath()%>/images/menu_icon.png" height="30" width="30" />
			</a>
		</li>
	</ul>
</div>

<script type="text/javascript">
var the_page = window.location.href;
var d = the_page.split("/");
//alert(the_page + " " +d[5]);
var ul = document.getElementById("myTopnav");
var items = ul.getElementsByTagName("li");
for (var i = 0; i < items.length; ++i) {
	var anc = items[i].getElementsByTagName("anchor")
	for(var j = 0; j < anc.length; ++j){
		anc[j].replace(" active", "");
	}
}
document.getElementById(d[4]).className += " active";

</script>