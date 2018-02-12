<%@include file="header.jsp"%>
</head>
<body>
<%@include file="login_nav.jsp"%>
<main> <%@include file="school_setting_menu.jsp"%>
<div class="row container_margin">
	<div class="col s12 m4 l2 left_column">
		<div>
			<ul class="collapsible" data-collapsible="accordion">
				<li>
					<div class="collapsible-header active">
						<i class="material-icons">filter_drama</i>
						Q-Dees Bangsar
					</div>
					<div class="collapsible-body">
						<div class="collapse_content">
							<a href="" class="waves-effect waves-teal btn-flat">Details</a>
							<a href="" class="waves-effect waves-teal btn-flat">Staff</a>
						</div>
					</div>
				</li>
				<li>
					<div class="collapsible-header">
						<i class="material-icons">place</i>
						Q-Dees Subang
					</div>
					<div class="collapsible-body">
						<div class="collapse_content">
							<a href="" class="waves-effect waves-teal btn-flat">Details</a>
							<a href="" class="waves-effect waves-teal btn-flat">Staff</a>
						</div>
					</div>
				</li>
				<li>
					<div class="collapsible-header">
						<i class="material-icons">whatshot</i>
						Q-Dees PJ
					</div>
					<div class="collapsible-body">
						<div class="collapse_content">
							<a href="" class="waves-effect waves-teal btn-flat">Details</a>
							<a href="" class="waves-effect waves-teal btn-flat">Staff</a>
						</div>
					</div>
				</li>
			</ul>
		</div>


	</div>
	<div class="col s12 m4 l8">
		<div class="school_info">
		<div class="row">
			<div class="col s12 m12 l1"></div>
			<div class="col s12 m12 l10"><h5>[Selected School Name]</h5></div>
		</div>
			<div class="row">
			<div class="col s12 m12 l1"></div>
				<div class="col s12 m5 l5">
					<label class="Lato_normal_font">School Name</label>
					<input type="text">
					<label class="Lato_normal_font">Address 1</label>
					<input>
					<label class="Lato_normal_font">Address 2</label>
					<input>
					<label class="Lato_normal_font">Pos Code</label>
					<input type="number">
					<label class="Lato_normal_font">City</label>
					<input>
					<label class="Lato_normal_font">State</label>
					<input>
					<label class="Lato_normal_font">Country</label>
					<input>
					<label class="Lato_normal_font">Billing Address 1</label>
					<input>
					<label class="Lato_normal_font">Billing Address 2</label>
					<input>
					<label class="Lato_normal_font">Pos Code</label>
					<input type="number">
					<label class="Lato_normal_font">City</label>
					<input>
					<label class="Lato_normal_font">State</label>
					<input>
					<label class="Lato_normal_font">Country</label>
					<input>
				</div>
				<div class="col s12 m5 l5">
					<label class="Lato_normal_font">Contact no</label>
					<input type="number">
					<label class="Lato_normal_font">Mobile no</label>
					<input type="number">
					<label class="Lato_normal_font">Fax no</label>
					<input type="number">
					<label class="Lato_normal_font">Website</label>
					<input type="url">
					<label class="Lato_normal_font">Calendar ID</label>
					<input type="number">
					<div class="file-field input-field">
						<div class="btn">
							<span>Logo</span>
							<input type="file">
						</div>
						<div class="file-path-wrapper">
							<input class="file-path validate" type="text">
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col s12 m4 l8"></div>
				<div class="col s3 m4 l2">
					<a class="waves-effect waves-light btn">Edit</a>
				</div>
				<div class="col s3 m4 l2">
					<a class="waves-effect waves-light btn">Cancel</a>
				</div>
			</div>
		</div>
	</div>
	<div class="col s12 m4 l2">
		<%-- <div class="row">
			<div class="col s12 m12 l12">Recent Items</div>
		</div>
		<%@include file="recent_item.jsp"%> --%>
	</div>
</div>
</main>
<%@include file="footer.jsp"%>