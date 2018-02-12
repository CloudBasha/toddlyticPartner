<%@include file="header.jsp"%>
<%@include file="standard_nav.jsp"%>
<main>
	<div>
		<div class="container login_margin_top">
			<div class="row">
				<div class="registrationSelectDiv col s12 m12 l12">
					<h5 class="userOptionBut">Which best describes you?</h5>
					<div class="col s12 m5 l5">
						<a class="waves-effect waves-light btn col s12 m12 l12 lighten-1 userOptionBut" href="<%=request.getContextPath()%>/registrationPage">School</a>
					</div>
					<div class="col s12 m5 l5 offset-m2 offset-l2">
						<a class="waves-effect waves-light btn col s12 m12 l12 lighten-1 userOptionBut" href="<%=request.getContextPath()%>/registrationPage">Parent</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>
<%@include file="footer.jsp"%>