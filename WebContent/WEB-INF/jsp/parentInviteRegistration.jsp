<%@include file="header.jsp"%>
<%@include file="standard_nav.jsp"%>
<main>
	<div>
		<div class="container parentRegistationDiv">
			<div class="row">
				<div class="col s12 m12 l12 center">
					<h5>Parent Registration</h5>
				</div>
				<div class="container">
					<div class="row">
						<div class="col s12 m12 l12 offset-m1 offset-l1 registrationDiv">
							<div class="row">
							    <form class="col s12 m12 l12">
							      <div class="row">
							        <div class="input-field col s12 m10 l10">
							          <i class="material-icons prefix coloredIcons">email</i>
							          <input id="icon_prefix" type="text" class="validate registrationInput">
							          <label for="icon_prefix" class="registrationInputLabel">Email</label>
							        </div>
							      </div>
							      <div class="row">
							      	<div class="col s12 m10 l10 submitRegistrationBut">
							      		<a class="waves-effect waves-light btn modal-trigger" href="#verficationSuccessModal">Submit<i class="material-icons left">send</i></a>
							      	</div>
							      </div>
							    </form>
			      			</div>
				  		</div>
					</div>
				</div>
			</div>
		</div>
		
		<div id="verficationSuccessModal" class="modal">
		    <div class="modal-content">
		      <h4>Welcome to Toddlytic</h4>
		      <p>Your email address has been verified successfully. Please proceed to setup your password.</p>
		    </div>
		    <div class="modal-footer">
		      <a href="<%=request.getContextPath()%>/registerEmailVerification" class=" modal-action modal-close waves-effect waves-green btn-flat">Proceed</a>
		    </div>
  		</div>
	</div>
</main>
<%@include file="footer.jsp"%>