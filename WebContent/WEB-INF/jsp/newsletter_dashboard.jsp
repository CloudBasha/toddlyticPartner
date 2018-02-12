<%@include file="header.jsp"%>
<%@include file="login_nav.jsp"%>
<script type="text/javascript">
	document.getElementById("login_title_logo").src = "<%=request.getContextPath()%>/images/pre_school_logo.jpg";
</script>
<main> <%@include file="school_main_menu.jsp"%>
<div style="margin-top: 30px;">
	<div class="row">
		<div class="col s12 m4 l3 left_column">
			<div class="row">
				<div class="col s12 m12 l12">
					<div class="row">
						<div class="col s12 m12 l12" style="margin-top: 40px;">
							<a class="waves-effect waves-teal btn-flat left_menu_btn modal-trigger"
								href="#upload_newsletter">Add Newsletter</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col s12 m12 l1"></div>
		<div class="col s12 m8 l8">
			<div class="row">
				<div class="col s12 m4 l2">
					<div class="row center">
						<img class="" width="80px" src="<%=request.getContextPath()%>/images/report.png">
					</div>
					<div class="row center newsletter_name">Newsletter</div>
					<div class="row newsletter_func">
						<div class="col s4 m4 l4 center">
							<img src="<%=request.getContextPath()%>/images/view_photo.png" height="35px" width="35px" />
						</div>
						<div class="col s4 m4 l4 center">
							<img src="<%=request.getContextPath()%>/images/download.png" height="33px" width="33px" />
						</div>
						<div class="col s4 m4 l4 center">
							<img src="<%=request.getContextPath()%>/images/delete_2.png" height="35px" width="35px" />
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@include file="shortcut_div.jsp"%>
</div>
<%@include file="modal.jsp"%> </main>
<%@include file="footer.jsp"%>