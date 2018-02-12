<div class="fixed-action-btn horizontal click-to-toggle" style="bottom: 45px; right: 24px;">
	<a class="btn-floating btn-large red">
		<i class="material-icons">menu</i>
	</a>
	<ul>
		<li>
			<a class="btn-floating red modal-trigger tooltipped" data-position="left" data-delay="300" data-tooltip="Add Student" href="<%=request.getContextPath()%>/cms/createStudent/${id}">
				<i class="material-icons">assignment_ind</i>
			</a>
		</li>
		<li>
			<a class="btn-floating yellow darken-1 tooltipped" data-position="left" data-delay="300" data-tooltip="Add Contact" href="<%=request.getContextPath()%>/cms/create_contact/${id}">
				<i class="material-icons">supervisor_account</i>
			</a>
		</li>
		<li>
			<a class="btn-floating green tooltipped" data-position="left" data-delay="300" data-tooltip="Upload Photo" href="#modal2">
				<i class="material-icons">perm_media</i>
			</a>
		</li>
		<li>
			<a class="btn-floating blue tooltipped" data-position="left" data-delay="300" data-tooltip="Upload Progress Report">
				<i class="material-icons">trending_up</i>
			</a>
		</li>
	</ul>
</div>