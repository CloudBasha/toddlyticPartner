<%@include file="header.jsp"%>
<%@include file="standard_nav.jsp"%>
<main>
	<div>
		<div class="container">
			<div class="row">
				<div class="col s12 m12 l12">
					<div class="row">
						<div class="col s12 m12 l12 center">
							<h5>Password Setup</h5>
						</div>
					    <form class="col s12 m12 l12 offset-l2 registrationDiv" action="<%=request.getContextPath()%>/createPass">
					      <div class="row">
					        <div class="input-field col s12 m8 l8 offset-m2">
					          <i class="material-icons prefix coloredIcons">email</i>
					          <input name="ownerEmail" disabled id="icon_prefix" type="text" class="validate registrationInput" value="tharindu.gamage@gmail.com">
					          <label for="icon_prefix disabled" class="registrationInputLabel">Email</label>
					        </div>
					      </div>
					      <div class="row">
					        <div class="input-field col s12 m8 l8 offset-m2">
					          <i class="material-icons prefix coloredIcons">lock</i>
					          <input name="ownerPassword" id="icon_prefix" type="password" class="validate registrationInput">
					          <label for="icon_prefix" class="registrationInputLabel">Enter New Password</label>
					        </div>
					      </div>
					      <div class="row">
					        <div class="input-field col s12 m8 l8 offset-m2">
					          <i class="material-icons prefix coloredIcons">lock</i>
					          <input name="ownerConfPassword" id="icon_telephone" type="password" class="validate registrationInput">
					          <label for="icon_telephone" class="registrationInputLabel">Confirm Password</label>
					        </div>
					      </div>
					      <div class="row">
					      	<div class="col s12 m10 l8 submitRegistrationBut">
					      		<a class="waves-effect waves-light btn modal-trigger" href="#verficationSuccessModal">Submit<i class="material-icons left">send</i></a>
					      	</div>
					      </div>
					    </form>
	      			</div>
		  		</div>
			</div>
		</div>
	</div>
	
	<div id="verficationSuccessModal" class="modal">
	    <div class="modal-content">
	      <h4>Welcome to Toddlytic</h4>
	      <p>Your account has been successfully created. Please proceed to the login page.</p>
	    </div>
	    <div class="modal-footer">
	      <a href="<%=request.getContextPath()%>/" class=" modal-action modal-close waves-effect waves-green btn-flat">Login Now</a>
	    </div>
  	</div>
	
</main>
<%@include file="footer.jsp"%>