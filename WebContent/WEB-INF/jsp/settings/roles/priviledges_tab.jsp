<div id="priviledgesTab" class="priviledgesTab">
	<div class="row">
		<div class="col s12 m12 l12">
			<div class="card">
				<div class="row priviledge_roles_row">
					<div class="col s12 m2 l2">
						<span class="Lato_normal_font priviledge_custom_label">Custom Roles:</span>
					</div>
					<div class="col s12 m4 l4">
						<select>
							<option value="" selected>Custom Teacher 1</option>
							<option value="">Custom Teacher 2</option>
						</select>
					</div>
					<div class="col s12 m3 offset-l1 l2">
						<a href="" class="waves-effect waves-teal btn categories_selection modal-trigger"><i
							class="material-icons left">add</i>Edit</a>
					</div>
					<div class="col s12 m3 l3">
						<a href="#cloneRoleModal"
							class="waves-effect waves-teal btn categories_selection modal-trigger"><i
							class="material-icons left">add</i>Clone Role</a>
					</div>
				</div>

				<div class="row">
					<div class="col s12 m12 l12">

						<ul class="collapsible" data-collapsible="accordion">
							<li>
								<div class="collapsible-header active">
									<i class="material-icons">filter_drama</i>People
								</div>
								<div class="collapsible-body">
									<div class="table_container">
										<%@include file="peopleTable.jsp"%>
									</div>
								</div>
							</li>
							<li>
								<div class="collapsible-header">
									<i class="material-icons">place</i>School
								</div>
								<div class="collapsible-body">
									<div class="table_container">
										<%@include file="schoolTable.jsp"%>
									</div>
								</div>
							</li>
							<li>
								<div class="collapsible-header">
									<i class="material-icons">whatshot</i>Broadcast
								</div>
								<div class="collapsible-body">
									<div class="table_container">
										<%@include file="broadcastTable.jsp"%>
									</div>
								</div>
							</li>
							<li>
								<div class="collapsible-header">
									<i class="material-icons">whatshot</i>Setting
								</div>
								<div class="collapsible-body">
									<div class="table_container">
										<%@include file="settingTable.jsp"%>
									</div>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>


		</div>

	</div>
</div>