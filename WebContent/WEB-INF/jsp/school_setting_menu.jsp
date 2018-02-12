<div>
	<ul class="topnav" id="myTopnav">
		<li>
			<a id="school_dashboard" class="Lato_normal_font" href="<%=request.getContextPath()%>/school_dashboard">Schools</a>
		</li>
		<li>
			<a id="school_program" class="Lato_normal_font" href="<%=request.getContextPath()%>/school_program">Programs</a>
		</li>
		<li>
			<a id="recipe" class="Lato_normal_font" href="<%=request.getContextPath()%>/recipe">Meals</a>
		</li>
		<li>
			<a id="wizard" class="Lato_normal_font" href="<%=request.getContextPath()%>/wizard">Mobile</a>
		</li>
		<li>
			<a id="billing_r" class="Lato_normal_font" href="<%=request.getContextPath()%>/billing_rate">Rates</a>
		</li>
		<li>
			<a id="schoolSettings" class="Lato_normal_font" href="<%=request.getContextPath()%>/cms/schoolSettings/${id}">Settings</a>
		</li>
		<li class="icon">
			<a href="javascript:void(0);" onclick="myFunction()">
				<img src="<%=request.getContextPath()%>/images/menu_icon.png" height="30" width="30" />
			</a>
		</li>
	</ul>
</div>

<script>
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
document.getElementById(d[5]).className += " active";

</script>