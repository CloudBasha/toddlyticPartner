<%@include file="header.jsp"%>
</head>
<body>
	<%@include file="standard_nav.jsp"%>
	<script>
function isDeleteMethod(isDelete) {
	var form = document.getElementById('editForm');
    if (isDelete){
        window.location.href="<%=request.getContextPath()%>/";
        return false;
    }
    else{
    	var url='<%=request.getContextPath()%>/checkCmsUserRegistration';
				var userName = $('#userName').val();
				var email = $('#email').val();
				var param = {
					userName : userName,
					email : email
				};
				$.ajax({
					url : url,
					data : param,
					type : "get",
					cache : false,
					success : function(data) {
						if (data == 'true') {
							form.submit();
							return true;
						} else {
							alert(data);
							return false;
						}
					}
				});

				return false;

			}
		}
	</script>
	<script>
		$.validator.setDefaults({
			submitHandler : function() {
				alert("submitted!");
			}
		});

		$().ready(function() {
			// validate the comment form when it is submitted
			//$("#commentForm").validate();

			// validate signup form on keyup and submit
			$("#editForm").validate({
				rules : {
					name : "required",
					contactNo : "required",
					username : {
						required : true,
						minlength : 2
					},
					password : {
						required : true,
						minlength : 5
					},
					confirm_password : {
						required : true,
						minlength : 5,
						equalTo : "#password"
					},
					email : {
						required : true,
						email : true
					},
					topic : {
						required : "#newsletter:checked",
						minlength : 2
					},
					agree : "required"
				},
				messages : {
					firstname : "Please enter your firstname",
					lastname : "Please enter your lastname",
					username : {
						required : "Please enter a username",
						minlength : "Your username must consist of at least 2 characters"
					},
					password : {
						required : "Please provide a password",
						minlength : "Your password must be at least 5 characters long"
					},
					confirm_password : {
						required : "Please provide a password",
						minlength : "Your password must be at least 5 characters long",
						equalTo : "Please enter the same password as above"
					},
					email : "Please enter a valid email address",
					agree : "Please accept our policy",
					topic : "Please select at least 2 topics"
				}
			});

			// propose username by combining first- and lastname
			$("#username").focus(function() {
				var firstname = $("#firstname").val();
				var lastname = $("#lastname").val();
				if (firstname && lastname && !this.value) {
					this.value = firstname + "." + lastname;
				}
			});
		});
	</script>
	<main>
	<form method="post" action="<%=request.getContextPath()%>/register" id="editForm"
		enctype="multipart/form-data">
		<div class="container">
			<div class="row">
					<div class="progress">
						<div class="determinate" style="width: 0%;">
							
						</div>
					</div>
			</div>

			<!-- <div class="row">
				<div class="col s12 m1 l1"></div>
				<div class="col s12 m4 l4">
					<div class="icon_beside_text">
						<i class="medium material-icons icon_beside_text">perm_identity</i>
					</div>
					<div class="icon_beside_text">
						<h5 class="Lato_normal_font icon_beside_text">Register as an Admin</h5>
					</div>
				</div>
				<div class="col s12 m4 l4"></div>
			</div> -->
			<div class="row">
				<div class="col s12 m1 l1"></div>
				<div class="col s12 m10 l10">
					<ul class="collapsible" data-collapsible="accordion">
						<li>
							<div class="collapsible-header active">
								<i class="material-icons">perm_identity</i>Org Administrator Information
							</div>
							<div class="collapsible-body">
								<div class="container container_margin_top">
									<div class="row">
										<div class="col s12 m6 l6">
											<label for="name" class="Lato_normal_font label_font">Name</label> <input required
												type="text" name="name" id="name" tabindex="1">
										</div>
										<div class="col s12 m6 l6">
											<label for="email" class="Lato_normal_font label_font" data-error="Email incorrect"
												data-success="">Email</label> <input required type="email" name="email" id="email"
												class="validate" tabindex="2">
										</div>
									</div>
									<div class="row">
										<div class="col s12 m6 l6">
											<label for="contactNo" class="Lato_normal_font label_font">Mobile No</label> <input
												required type="tel" name="contactNo" id="contactNo" class="validate" tabindex="3">
										</div>
										<div class="col s12 m6 l6"></div>
									</div>
									<div class="row">
										<div class="col s12 m6 l6">
											<label class="Lato_normal_font label_font">Password</label> <input required
												type="password" name="password" id="password" tabindex="4">
										</div>
										<div class="col s12 m6 l6">
											<label class="Lato_normal_font label_font">Confirm Password</label> <input required
												type="password" name="confirmPassword" id="confirmPassword" tabindex="5">
										</div>
									</div>
								</div>
							</div>
						</li>
						<li>
							<div class="collapsible-header">
								<i class="material-icons">business</i>Organization Information
							</div>
							<div class="collapsible-body">
								<div class="container container_margin_top">
									<div class="row">
										<div class="col s12 m6 l6">
											<label for="orgname" class="Lato_normal_font label_font">Organization Name</label> <input
												type="text" name="orgname" id="orgname" tabindex="6">
										</div>
										<div class="col s12 m6 l6">
											<label class="Lato_normal_font label_font">Company No</label> <input type="text"
												name="comNo" id="comNo">
										</div>
									</div>
									<div class="row">
										<div class="col s12 m6 l6">
											<label class="Lato_normal_font label_font">Contact no</label> <input type="text"
												name="contactNo" id="contactNo">
										</div>
										<div class="col s12 m6 l6">
											<label class="Lato_normal_font label_font">Fax no</label> <input type="text" name="faxNo"
												id="faxNo">
										</div>
									</div>
									<div class="row">
										<div class="col s12 m6 l6">
											<label class="Lato_normal_font label_font">Address 1</label> <input type="text"
												name="address1" id="address1">
										</div>
										<div class="col s12 m6 l6">
											<label class="Lato_normal_font label_font">Address 2</label> <input type="text"
												name="address2" id="address2">
										</div>
									</div>
									<div class="row">
										<div class="col s12 m6 l6">
											<label class="Lato_normal_font label_font">Post Code</label> <input type="text"
												name="postCode" id="postCode">
										</div>
										<div class="col s12 m6 l6">
											<label class="Lato_normal_font label_font">City</label> <input type="text" name="city"
												id="city">
										</div>
									</div>
									<div class="row">
										<div class="col s12 m6 l6">
											<label class="Lato_normal_font label_font">State</label> <input type="text" name="state"
												id="state">
										</div>
										<div class="col s12 m6 l6">
											<label class="Lato_normal_font label_font">Country</label> <input type="text"
												name="country" id="country">
										</div>
									</div>
									<div class="row">
										<div class="col s12 m6 l6">
											<label class="Lato_normal_font label_font">Website</label> <input type="text"
												name="website" id="website">
										</div>
										<div class="col s12 m6 l6">
											<div class="file-field input-field org_reg_logo">
												<div class="btn">
													<span>Logo</span> <input type="file" name="logo" id="logo">
												</div>
												<div class="file-path-wrapper">
													<input class="file-path validate" type="text">
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</li>
					</ul>
				</div>
			</div>


			<div class="row">
				<div class="col s12 m4 l4"></div>
				<div class="col s12 m4 l4">
					<div class="center">
						<a class="waves-effect waves-light blue darken-4 btn center login_button Lato_normal_font"
							onclick="return isDeleteMethod(false);">Submit</a>
					</div>
				</div>
				<div class="col s12 m4 l4"></div>
			</div>
		</div>
	</form>
	</main>
	<%@include file="footer.jsp"%>