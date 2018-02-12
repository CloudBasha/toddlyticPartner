<%@include file="header.jsp"%>
</head>
<body>
	<%@include file="login_nav.jsp"%>
	<main> <%@include file="school_main_menu.jsp"%>
	<div class="row container_margin">
		<div class="col s12 m4 l2">
			<div>
				<ul class="collapsible" data-collapsible="accordion">
					<li>
						<div class="collapsible-header active">
							<i class="material-icons">store</i> [Selected School]
						</div>
						<div class="collapsible-body">
							<div class="collapse_content">
								<a href="" class="waves-effect waves-teal btn-flat">Details</a>
							</div>
						</div>
					</li>
					<li>
						<div class="collapsible-header">
							<i class="material-icons">library_books</i> Programs
						</div>
						<div class="collapsible-body">
							<div class="collapse_content">
								<a href="" class="waves-effect waves-teal btn-flat">Infant Program</a> <a href=""
									class="waves-effect waves-teal btn-flat">Select Program</a>
							</div>
						</div>
					</li>
					<li>
						<div class="collapsible-header">
							<i class="material-icons">library_books</i> Holidays
						</div>
						<div class="collapsible-body">
							<div class="collapse_content">
								<a href="" class="waves-effect waves-teal btn-flat">View Holidays</a> <a href=""
									class="waves-effect waves-teal btn-flat">Add Holiday</a>
							</div>
						</div>
					</li>
					<li>
						<div class="collapsible-header">
							<i class="material-icons">payment</i>Billing
						</div>
						<div class="collapsible-body">
							<div class="collapse_content">
								<div class="switch center">
									<label> Off <input type="checkbox"> <span class="lever"></span> On
									</label>
								</div>
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
					<div class="col s12 m5 l5">
						<label class="Lato_normal_font">School Name</label> <input type="text"> <label
							class="Lato_normal_font">Address 1</label> <input> <label class="Lato_normal_font">Address
							2</label> <input> <label class="Lato_normal_font">Pos Code</label> <input type="number">
						<label class="Lato_normal_font">City</label> <input> <label class="Lato_normal_font">State</label>
						<input> <label class="Lato_normal_font">Country</label> <input> <label
							class="Lato_normal_font">Billing Address 1</label> <input> <label
							class="Lato_normal_font">Billing Address 2</label> <input> <label
							class="Lato_normal_font">Pos Code</label> <input type="number"> <label
							class="Lato_normal_font">City</label> <input> <label class="Lato_normal_font">State</label>
						<input> <label class="Lato_normal_font">Country</label> <input>
					</div>
					<div class="col s12 m5 l5">
						<label class="Lato_normal_font">Contact no</label> <input type="number"> <label
							class="Lato_normal_font">Mobile no</label> <input type="number"> <label
							class="Lato_normal_font">Fax no</label> <input type="number"> <label
							class="Lato_normal_font">Website</label> <input type="url"> <label
							class="Lato_normal_font">Calendar ID</label> <input type="number">
						<div class="file-field input-field">
							<div class="btn">
								<span>Logo</span> <input type="file">
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