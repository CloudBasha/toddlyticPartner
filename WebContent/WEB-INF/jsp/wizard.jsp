<%@include file="header.jsp"%>
</head>
<body>
<%@include file="login_nav.jsp"%>

<main> 
<%@include file="school_setting_menu.jsp"%>
<div class="container login_margin_top">
	<div class="row">
		<div class="col s12 m3 l3"></div>
		<div class="col s12 m6 l6">
			<table class="Lato_normal_font highlight bordered responsive-table">
			<tr>
			<td align="right">
			<a href="<%=request.getContextPath()%>/cms/generateApk/${id}" class=" modal-action modal-close waves-effect waves-green btn-flat">Generate APK</a>
			<a href="<%=request.getContextPath()%>/cms/wizard/${id}" class=" modal-action modal-close waves-effect waves-green btn-flat">Refresh Page</a>
			</td>
			</tr>
			</table>
			<table class="Lato_normal_font highlight bordered responsive-table">
			
			<thead>
					<tr>
						<th data-field="name">Date of Generation</th>
						<th data-field="age">Status</th>
						<th data-field="photos">Download</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${wizardGenerationHistories}" var="wizardGenerationHistory">
				<tr>
				<td>
				<p><fmt:formatDate pattern="dd-MM-yyyy" value="${wizardGenerationHistory.createdDate}" /></p>
				</td>
				<td>
				${wizardGenerationHistory.status}
				</td>
				<td>
				<c:choose>
				<c:when test="${wizardGenerationHistory.status=='SUCCESS'}">
				<a href="<%=request.getContextPath()%>/cms/downloadApk?id=${wizardGenerationHistory.wizardGenerationHistoryId}&schoolId=${id}" target="_blank">Download</a>
				</c:when>
				<c:otherwise>
				&nbsp;
				</c:otherwise>
				</c:choose>
				</td>
				</tr>
				</c:forEach>
				
				</tbody>
			</table>
		</div>
	</div>
	<div class="col s12 m3 l3"></div>

</div>
 </main>
<%@include file="footer.jsp"%>