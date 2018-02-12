<%@include file="header.jsp"%>
<%@include file="standard_nav.jsp"%>
<main>
	<div>
		<div class="container login_margin_top">
			<div class="row">
				<div class="col s12 center">
					<h5>School Invitation</h5>
				</div>
				<div class="col s12 m12 l12 registrationDiv">
					<div class="row">
					    <form class="col s12 m12 l12">
					      <div class="row">
					        <div class="input-field col s12 m6 l6">
					          <i class="material-icons prefix coloredIcons">account_circle</i>
					          <input id="icon_prefix" type="text" class="validate registrationInput" required>
					          <label for="icon_prefix" class="registrationInputLabel">Parent Name</label>
					        </div>
					        <div class="input-field col s12 m6 l6">
					          <i class="material-icons prefix coloredIcons">email</i>
					          <input id="icon_prefix" type="email" class="validate registrationInput" required>
					          <label for="icon_prefix" class="registrationInputLabel">Parent Email</label>
					        </div>
					      </div>
					      <div class="row">
					        <div class="input-field col s12 m6 l6">
					          <i class="material-icons prefix coloredIcons">school</i>
					          <input id="icon_prefix" type="text" class="validate registrationInput" required>
					          <label for="icon_prefix" class="registrationInputLabel">School Name</label>
					        </div>
					        <div class="input-field col s12 m6 l6">
					          <i class="material-icons prefix coloredIcons">supervisor_account</i>
					          <input id="icon_telephone" type="text" class="validate registrationInput" required>
					          <label for="icon_telephone" class="registrationInputLabel">Contact Name</label>
					        </div>
					      </div>
					      <div class="row">
					        <div class="input-field col s12 m6 l6">
					          <i class="material-icons prefix coloredIcons">email</i>
					          <input id="icon_prefix" type="email" class="validate registrationInput" required>
					          <label for="icon_prefix" class="registrationInputLabel">School Email</label>
					        </div>
					        <div class="input-field col s12 m6 l6">
					          <i class="material-icons prefix coloredIcons">call</i>
					          <input id="icon_telephone" type="text" class="validate registrationInput" required>
					          <label for="icon_telephone" class="registrationInputLabel">School Telephone</label>
					        </div>
					      </div>
					      <div class="row">
					      	<div class="col s12 m12 l12 submitRegistrationBut">
					      		<a class="waves-effect waves-light btn modal-trigger" href="#inviteSchoolSuccessModal">Send Invite<i class="material-icons left">send</i></a>
					      	</div>
					      </div>
					    </form>
	      			</div>
		  		</div>
			</div>
		</div>
	</div>
	
	<div id="inviteSchoolSuccessModal" class="modal">
    <div class="modal-content">
      <h4>Thank you</h4>
      <p>Thank you for submitting this information to Toddlytic. We will get in touch with the school and try to get them onboard as fast as possible.</p>
    </div>
    <div class="modal-footer">
      <a href="<%=request.getContextPath()%>/" class=" modal-action modal-close waves-effect waves-green btn-flat">Close</a>
    </div>
  </div>
	
</main>
<%@include file="footer.jsp"%>