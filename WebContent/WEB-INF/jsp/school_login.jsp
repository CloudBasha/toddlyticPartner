<%@include file="header.jsp"%>
<%@include file="standard_nav.jsp"%>
<main> <script type="text/javascript">
	/* $().ready(function() {
		$("#login_form").validate({
			rules : {
				j_username : {
					required : true,
					email : true
				},
				j_password : {
					required : true,
					minlength : 8,
					alphanumeric : true
				}
			},
			messages : {
				j_username : "Please enter correct email",
				j_password : {
					required : "Password cannot be empty",
					minlength : "Password needs at least 8 characters",
					alphanumeric : "Password needs to be in alphabets and numbers"
				}
			}
		});
	}); */

	/* function validateForm(){
	 var username = document.getElementById('j_username');
	 var password = document.getElementById('j_password');
	 if(username.value.length == 0){
		 alert("Email is empty");
	 }
	} */
</script>
<form ng-submit="sendPost()" ng-controller="loginController">
	<div class="container login_margin_top">
		<div class="row form_view_row">
			<div class="col s12 m4 l4"></div>
			<div class="col s12 m4 l4">
				<div>
					<label class="Lato_normal_font label_font">Email</label>
					<input ng-model="loginObj.email"/>
				</div>
			</div>
			<div class="col s12 m4 l4"></div>
		</div>

		<div class="row form_view_row">
			<div class="col s12 m4 l4"></div>
			<div class="col s12 m4 l4">
				<label class="Lato_normal_font label_font">Password</label>
				<input tabindex="2" ng-model="loginObj.password" type="password" class="center email_password_input" size="50">
			</div>
			<div class="col s12 m4 l4"></div>
		</div>

		<div class="row">
			<div class="col s12 m4 l4"></div>
			<div class="col s12 m4 l4">
				<div class="center">
					<input tabindex="3" name="login" type="submit" value="Log In"
						class="waves-effect waves-light btn center login_button">
				</div>
			</div>
			<div class="col s12 m4 l4"></div>
		</div>

		<div class="row">
			<div class="col s12 m4 l4"></div>
			<div class="col s12 m4 l4">
				<div>
					<input type="checkbox" class="filled-in" id="filled-in-box" checked />
					<label for="filled-in-box">Remember me</label>
					<br />
					<br />
					<a class="Lato_normal_font" href="<%=request.getContextPath()%>/forgot_password">Forgot Your
						Password?</a>
				</div>
			</div>
			<div class="col s12 m4 l4"></div>
		</div>
		<br />
		<div class="row">
			<div class="col s12 m4 l4"></div>
			<div class="col s12 m4 l4">
				<div class="center">
					<label class="Lato_normal_font not_a_customer" style="color: black;">Try for free</label>
					&nbsp;&nbsp;&nbsp;
					<a class="waves-effect waves-light btn-flat center try_free_button"
						href="<%=request.getContextPath()%>/registrationSelection">Register</a>
				</div>
			</div>
			<div class="col s12 m4 l4"></div>
		</div>


	</div>
</form>
</main>
<%@include file="footer.jsp"%>