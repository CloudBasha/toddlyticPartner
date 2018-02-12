<div id="newsletter_dash_div" class="school_home_div">
	<div class="row">
		<div class="col s12 m9 l9">
			<div class="row">
				<div class="col s12 m4 l2">
					<div class="row center">
						<img class="" width="80px" src="<%=request.getContextPath()%>/images/report.png">
					</div>
					<div class="row center newsletter_name">August 2016</div>
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
				<div class="col s12 m4 l2">
					<div class="row center">
						<img class="" width="80px" src="<%=request.getContextPath()%>/images/report.png">
					</div>
					<div class="row center newsletter_name">September 2016</div>
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
				<div class="col s12 m4 l2">
					<div class="row center">
						<img class="" width="80px" src="<%=request.getContextPath()%>/images/report.png">
					</div>
					<div class="row center newsletter_name">October 2016</div>
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
				<div class="col s12 m4 l2">
					<div class="row center">
						<img class="" width="80px" src="<%=request.getContextPath()%>/images/report.png">
					</div>
					<div class="row center newsletter_name">November 2016</div>
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
			<div class="row">
				<div id="newsletterChartContainer" class="col s12 m12 l12"></div>
			</div>
		</div>
		<div class="col s12 m3 l3">
			<div class="row sc_prog_right_options">
					<div class="col s12 m12 l12">
					<a href="#upload_newsletter" class="waves-effect waves-teal btn categories_selection modal-trigger">
						<i class="material-icons left">add</i>Newsletter
					</a>
				</div>
			</div>
		</div>
	</div>
</div>

<div id="upload_newsletter" class="modal" style="width: 20%">
	<form method="post" action="<%=request.getContextPath()%>/cms/createNewsLetter"
		enctype="multipart/form-data">
		<input type="hidden" name="schoolId" value="${id}">
		<div class="modal-content">
			<div class="row">
				<div class="col s12 m12 l12">
					<div class="input-field">
						<input id="name" name="name" type="text" class="validate"> <label for="name">Newsletter
							Name</label>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col s12 m12 l12">
					<div class="file-field input-field">
						<div class="btn">
							<span>File</span> <input type="file" name="newsletterFile" id="newsletterFile">
						</div>
						<div class="file-path-wrapper">
							<input class="file-path validate" type="text">
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="modal-footer">
			<a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Cancel</a> <a
				href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat"
				onclick="$(this).closest('form').submit();">Upload</a>
		</div>
	</form>
</div>