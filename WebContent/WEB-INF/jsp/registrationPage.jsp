<%@include file="header.jsp"%>
<%@include file="standard_nav.jsp"%>
<main> <script type="text/javascript">
	
<%String formUrl = request.getContextPath() + "/regOwner";%>
	function submitForm() {
		$("#regOwnerForm").submit(function(e) {
			console.log('Ajax triggered');
			$.ajax({
				url : '<%=request.getContextPath()%>/regOwner',
				type : 'post',
				data : $("#regOwnerForm").serialize(),
				success : function() {
					alert("${status}");
				},
				fail : function() {
					alert("Fail");
					console.log("ajax fail");
				}
			})
		});
	}
	
	$(document).ready(function(){
		console.log('First Cp');
		if("${status}" == 'failed'){
			alert('Fail: ' + "${reason}");
			console.log('Fail');
		}
	});
</script>
<div>
	<%-- <div>${status}</div> --%>
	<div class="container login_margin_top">
		<div class="row">
			<div class="col s12 m12 l12 center">
				<h5>Registration</h5>
			</div>
			<div class="col s12 m12 l12 registrationDiv">
				<div class="row">
					<form id="regOwnerForm" class="col s12 m12 l12 offset-m2" method="post">
						<div class="row">
							<div class="input-field col s12 m8 l8 offset-l2">
								<i class="material-icons prefix coloredIcons">account_circle</i> <input
									name="ownerFirstName" id="icon_prefix" type="text" class="validate registrationInput"
									required> <label for="icon_prefix" class="registrationInputLabel">First
									Name</label>
							</div>
						</div>
						<div class="row">
							<div class="input-field col s12 m8 l8 offset-l2">
								<i class="material-icons prefix coloredIcons">account_circle</i> <input name="ownerLastName"
									id="icon_prefix" type="text" class="validate registrationInput" required> <label
									for="icon_prefix" class="registrationInputLabel">Last Name</label>
							</div>
						</div>
						<div class="row">
							<div class="input-field col s12 m8 l8 offset-l2">
								<i class="material-icons prefix coloredIcons">email</i> <input name="ownerEmail"
									id="icon_telephone" type="email" class="validate registrationInput" required> <label
									for="icon_telephone" class="registrationInputLabel">Email Address</label>
							</div>
						</div>
						<div class="row">
							<div class="col s12 m8 l8 offset-l2 submitRegistrationBut">
								<!-- <a class="waves-effect waves-light btn"
									onclick="submitForm();">Register<i
									class="material-icons left">send</i></a>
									document.getElementById('regOwnerForm').submit(); -->
								<button class="btn waves-effect waves-light" onclick="submitForm()" name="action">
									Register <i class="material-icons left">send</i>
								</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

<div id="schoolRegistrationSuccessHasInviteModal" class="modal">
	<div class="modal-content">
		<h4>Thank you for your registering your school {{nameOfSchool}} with Toddlytic.</h4>
		<p>Please verify the account with the email sent to the registered email account.</p>
	</div>
	<div class="modal-footer">
		<a href="<%=request.getContextPath()%>/"
			class=" modal-action modal-close waves-effect waves-green btn-flat">Ok</a>
	</div>
</div>

<div id="schoolRegistrationSuccessNoInviteModal" class="modal">
	<div class="modal-content">
		<h4>Thank you for your interest in Toddlytic</h4>
		<p>Please verify the account with the email sent to the registered email account.</p>
	</div>
	<div class="modal-footer">
		<a href="<%=request.getContextPath()%>/"
			class=" modal-action modal-close waves-effect waves-green btn-flat">Ok</a>
	</div>
</div>


<div id="parentRegistrationSuccessHasInviteModal" class="modal">
   <div class="modal-content">
     <h4>Welcome to Toddlytic</h4>
     <p>Your email address has been verified successfully. Please proceed to setup your password.</p>
   </div>
   <div class="modal-footer">
     <a href="<%=request.getContextPath()%>/registerEmailVerification" class=" modal-action modal-close waves-effect waves-green btn-flat">Proceed</a>
   </div>
</div>
	
</main>
<%@include file="footer.jsp"%>