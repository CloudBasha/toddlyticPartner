<%@include file="header.jsp"%>
<%@include file="login_nav.jsp"%>
<main> <%@include file="school_setting_menu.jsp"%>
<div class="row container_margin">
	<div class="col s12 m4 l2 left_column">
		<div>
			<ul class="collapsible" data-collapsible="accordion">
				<li>
					<div class="collapsible-header active">
						<i class="material-icons">place</i>
						Teacher Profile
					</div>
					<div class="collapsible-body">
						<div class="collapse_content">
							<a href="" class="waves-effect waves-teal btn-flat">Permissions</a>
						</div>
					</div>
				</li>
				<li>
					<div class="collapsible-header">
						<i class="material-icons">place</i>
						Admin Profile
					</div>
					<div class="collapsible-body">
						<div class="collapse_content">
							<a href="" class="waves-effect waves-teal btn-flat">Permissions</a>
						</div>
					</div>
				</li>
				<li>
					<div class="collapsible-header">
						<a href="#new_profile" class="staff_menu_add modal-trigger">
							<i class="material-icons">place</i>
							Add Profile
						</a>
					</div>
				</li>
			</ul>
		</div>
	</div>
	<div class="col s12 m4 l8">
		<div class="row">
			<div class="col s12 m12 l1"></div>
			<div class="col s12 m12 l10">
				<p>School Permissions</p>
				<table class="responsive-table">
					<thead>
						<tr>
							<th>Create School</th>
							<th>Read School</th>
							<th>Edit School</th>
							<th>Delete School</th>
						</tr>
					</thead>

					<tbody>
						<tr>
							<td class="center">
								<input type="checkbox" class="filled-in" id="fi1" />
								<label for="fi1"></label>
							</td>
							<td class="center">
								<input type="checkbox" class="filled-in" id="fi2" />
								<label for="fi2"></label>
							</td>
							<td class="center">
								<input type="checkbox" class="filled-in" id="fi3" />
								<label for="fi3"></label>
							</td>
							<td class="center">
								<input type="checkbox" class="filled-in" id="fi4" />
								<label for="fi4"></label>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="col s12 m12 l1"></div>
		</div>
		<div class="row">
			<div class="col s12 m12 l1"></div>
			<div class="col s12 m12 l10">
				<p>Contact Permissions</p>
				<table class="responsive-table">
					<thead>
						<tr>
							<th>Create Contact</th>
							<th>Read Contact</th>
							<th>Edit Contact</th>
							<th>Delete Contact</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="center">
								<input type="checkbox" class="filled-in" id="fi5" checked="checked" />
								<label for="fi5"></label>
							</td>
							<td class="center">
								<input type="checkbox" class="filled-in" id="fi6" checked="checked" />
								<label for="fi6"></label>
							</td>
							<td class="center">
								<input type="checkbox" class="filled-in" id="fi7" checked="checked" />
								<label for="fi7"></label>
							</td>
							<td class="center">
								<input type="checkbox" class="filled-in" id="fi8" checked="checked" />
								<label for="fi8"></label>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="col s12 m12 l1"></div>
		</div>
		<div class="row">
			<div class="col s12 m12 l1"></div>
			<div class="col s12 m12 l10">
				<p>School Programme Permissions</p>
				<table class="responsive-table">
					<thead>
						<tr>
							<th>Create School Programme</th>
							<th>Read School Programme</th>
							<th>Edit School Programme</th>
							<th>Delete School Programme</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="center">
								<input type="checkbox" class="filled-in" id="fi9" checked="checked" />
								<label for="fi9"></label>
							</td>
							<td class="center">
								<input type="checkbox" class="filled-in" id="fi10" checked="checked" />
								<label for="fi10"></label>
							</td>
							<td class="center">
								<input type="checkbox" class="filled-in" id="fi11" checked="checked" />
								<label for="fi11"></label>
							</td>
							<td class="center">
								<input type="checkbox" class="filled-in" id="fi12" checked="checked" />
								<label for="fi12"></label>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="col s12 m12 l1"></div>
		</div>
	</div>
	<div class="col s12 m4 l2 right_column ">
		<%-- <div class="row">
			<div class="col s12 m12 l12">Recent Items</div>
		</div>
		<%@include file="recent_item.jsp"%> --%>
	</div>
</div>

</main>
<%@include file="footer.jsp"%>