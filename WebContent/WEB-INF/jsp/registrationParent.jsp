<%@include file="header.jsp"%>
<%@include file="standard_nav.jsp"%>
<main>
	<div>
		<div class="container login_margin_top">
			<div class="row">
				<div class="col s12 m12 l12 center">
					<h5>Parent Registration</h5>
				</div>
				<div class="registrationSelectDiv col s12 m12 l12">
					<div class=" col col s12 m5 l5">
						<a class="waves-effect waves-light btn lighten-1 col s12 m12 l12 userOptionBut" href="<%=request.getContextPath()%>/parentInviteRegistration">I have an invitation</a>
					</div>
					<div class=" col col s12 m5 l5 offset-m2 offset-l2">
						<a class="waves-effect waves-light btn lighten-1 btn col s12 m12 l12 userOptionBut" href="<%=request.getContextPath()%>/inviteSchoolDetails">Invite a school</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>
<%@include file="footer.jsp"%>