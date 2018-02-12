<%-- <div class="row nav_container nav_margin_bot">
	<div class="nav_div col s12 m6 l7">
		<div class="row">
			<div class="col s7 m4 l3">
				<img class="title_img"
					src="<%=request.getContextPath()%>/images/title.PNG" width="172"
					height="44" />
			</div>
			<!-- <div class="col s1 m1 l1 line-div">
				<hr width="1" style="height: 80px;">
				<div class="line-border"></div>
			</div>
			<div class="col s12 m6 l5 org-name-div org-name">
				<h5>[School Name]</h5>
			</div> -->
		</div>
	</div>
	<div class="nav_div col s12 m6 l5">
		<div class="row">
			<div class="col s12 m4 l4">
				<div id="sc-sel" class="input-field sc-sel">
					<select>
						<option value="1" selected>[Selected School]</option>
						<option value="2">Option 2</option>
						<option value="3">Option 3</option>
					</select>
				</div>
			</div>
			<div class="col s12 m8 l8">
				<a class='dropdown-button btn nav_user right blue lighten-2' href='#'
					data-activates='dropdown1'><i class="material-icons right">ic_keyboard_arrow_down</i>${logInName}</a>
				<ul id='dropdown1' class='dropdown-content'>
					<li><a
						href="<%=request.getContextPath()%>/cms/school_selection">Schools</a></li>
					<li class="divider"></li>
					<li><a
						href="<%=request.getContextPath()%>/cms/school_dashboard/${id}">Organization</a></li>
					<li class="divider"></li>
					<li><a href="${baseUrl}j_spring_security_logout">Log Out</a></li>
				</ul>
			</div>
		</div>
	</div>
</div> --%>
<nav class="nav_color">
	<div class="nav-wrapper ">
		<a href="#" class="brand-logo"><img class="title_img"
			src="<%=request.getContextPath()%>/images/title.PNG" width="172" height="44" /></a> <a href="#"
			data-activates="mobile-demo" class="button-collapse"><i class="material-icons">menu</i></a>
		<ul id="nav-mobile" class="right hide-on-med-and-down">
			<li id="l1"><a href="<%=request.getContextPath()%>/home">Home</a></li>
			<li id="l2"><a href="<%=request.getContextPath()%>/list_people">People</a></li>
			<li id="l3"><a href="<%=request.getContextPath()%>/schools">Schools</a></li>
			<li id="l4"><a href="<%=request.getContextPath()%>/broadcast">Broadcast</a></li>
			<li id="l5"><a href="<%=request.getContextPath()%>/settings">Settings</a></li>
			<li><a href="${baseUrl}j_spring_security_logout">Sign Out</a></li>
		</ul>
		<ul class="side-nav" id="mobile-demo">
			<li id="l7"><a href="<%=request.getContextPath()%>/home">Home</a></li>
			<li id="l8"><a href="<%=request.getContextPath()%>/list_people">People</a></li>
			<li id="l9"><a href="<%=request.getContextPath()%>/schools">Schools</a></li>
			<li id="l10"><a href="<%=request.getContextPath()%>/broadcast">Broadcast</a></li>
			<li id="l11"><a href="<%=request.getContextPath()%>/settings">Settings</a></li>
			<li><a href="${baseUrl}j_spring_security_logout">Sign Out</a></li>
		</ul>
	</div>
</nav>

<script>
	var the_page = window.location.href;
	var d = the_page.split("/");
	var menuPosition = d[4];
	
	switch(menuPosition){
	case 'home':
		$('#l1').addClass('active');
		$('#l7').addClass('active');
		break;
	case 'list_people':
		$('#l2').addClass('active');
		$('#l8').addClass('active');
		break;
	case 'schools':
		$('#l3').addClass('active');
		$('#l9').addClass('active');
		break;
	case 'broadcast':
		$('#l4').addClass('active');
		$('#l10').addClass('active');
		break;
	case 'settings':
		$('#l5').addClass('active');
		$('#l11').addClass('active');
		break;
	}
	/* if (menuPosition == 'school_selection' || menuPosition == 'create_school' || menuPosition == 'school_dashboard' || menuPosition == 'school_program' || menuPosition == 'billing_rate' || menuPosition == 'recipe' || menuPosition == 'wizard' || menuPosition == 'schoolSettings')
		document.getElementById('sc-sel').style.display = 'none';
	else
		document.getElementById('sc-sel').style.display = 'block'; */
</script>