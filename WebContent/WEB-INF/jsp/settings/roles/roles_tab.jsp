<div id="rolesTab" class="rolesTab">
	<div class="row">
		<div class="col s12 m9 l9">
			<ul class="collapsible" data-collapsible="accordion">
				<li>
					<div class="collapsible-header active">
						<i class="material-icons">filter_drama</i>Admin
					</div>
					<div class="collapsible-body">
						<div class="container">
							<div class="row">
								<div class="col s12 m12 l12">
									<table class="highlight bordered">
										<tr>
											<th>Fullname</th>
											<th>Email</th>
											<th>Status</th>
										</tr>
										<tr>
											<td>John Doe</td>
											<td>john@gmail.com</td>
											<td class="input-field"><input type="checkbox" class="filled-in" id="roleAction_id"
												disabled /><label for="roleAction_id" class="role_action_chkbox"></label></td>
										</tr>
									</table>

								</div>
							</div>
							<div class="row">
								<div class="col s12 m12 l12 right-align profile_edit_row">
									<a href="javascript:void(0)" onclick="" class="btn waves-effect">Edit</a>
								</div>
							</div>
						</div>
					</div>
				</li>
				<li>
					<div class="collapsible-header">
						<i class="material-icons">place</i>Teacher
					</div>
					<div class="collapsible-body">
						<div class="container">
							<div class="row">
								<div class="col s12 m12 l12">
									<table class="highlight bordered">
										<tr>
											<th>Fullname</th>
											<th>Email</th>
											<th>Status</th>
										</tr>
										<tr>
											<td>John Doe</td>
											<td>john@gmail.com</td>
											<td class="input-field"><input type="checkbox" class="filled-in" id="roleAction_id"
												disabled checked /><label for="roleAction_id" class="role_action_chkbox"></label></td>
										</tr>
									</table>

								</div>
							</div>
							<div class="row">
								<div class="col s12 m12 l12 right-align profile_edit_row">
									<a href="javascript:void(0)" onclick="" class="btn waves-effect">Edit</a>
								</div>
							</div>
						</div>
					</div>
				</li>
			</ul>
		</div>
		<div class="col s12 m3 l3">
			<div class="row sc_prog_right_options">
				<div class="col s12 m12 l12">
					<a href="#cloneRoleModal"
						class="waves-effect waves-teal btn categories_selection modal-trigger"><i
						class="material-icons left">add</i>Clone Role</a>
				</div>
			</div>
			<div class="row">
				<div class="col s12 m12 l12">
					<a href="#addUserModal" class="waves-effect waves-teal btn categories_selection modal-trigger"><i
						class="material-icons left">add</i>Add User</a>
				</div>
			</div>
		</div>
	</div>
</div>

<div id="cloneRoleModal" class="modal modal-fixed-footer cloneRoleModal">
	<div class="modal-content">
		<div class="row">
			<h5 class="Lato_normal_font">Clone Role</h5>
		</div>
		<div class="row form_view_row">
			<div class="col s12 m12 l12 input-field">
				<select id="roleSelect">
					<option value="0" selected>None</option>
					<option value="1">Admin</option>
					<option value="2">Teacher</option>
				</select><label>Role</label>
			</div>
		</div>
		<div class="row form_view_row">
			<div class="input-field col s12 m12 l12">
				<input id="roleNameInput" type="text" class="validate" id="newRoleName" /> <label
					for="newRoleName">New Role Name</label>
			</div>
		</div>
	</div>
	<div class="modal-footer">
		<a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Cancel</a> <a
			href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Create</a>
	</div>
	<script type="text/javascript">
		/* $("#roleSelect").change(function() {
			//alert($(this).val());
			var selectedVal = $(this).val();
			var roleNameInput = $('#roleNameInput');
			console.log("Selected Val: " + selectedVal);
			//console.log("Role name div: " + roleNameDiv);
			if(selectedVal==1 || selectedVal==2){
				console.log("If triggered");
				roleNameInput.prop("disabled", false);
			}else {
				console.log("Else triggered");
				roleNameInput.prop("disabled", true);
			}
		}) */
	</script>
</div>

<div id="addUserModal" class="modal modal-fixed-footer addUserModal">
	<div class="modal-content">
		<div class="row">
			<h5 class="Lato_normal_font">Add User</h5>
		</div>
		<div class="row form_view_row">
			<div class="col s12 m12 l12 input-field">
				<select id="roleSelect">
					<option value="1">Admin</option>
					<option value="2">Teacher</option>
				</select><label>Select Role</label>
			</div>
		</div>
		<div class="row form_view_row">
			<div class="input-field col s12 m12 l12">
				<input id="userName" type="text" class="autocomplete" /> <label for="userName">Name</label>
			</div>
		</div>
		<div class="row form_view_row">
			<div class="input-field col s12 m12 l12">
				<input id="userEmail" type="text" class="validate" value=" " disabled /> <label for="userEmail">Email</label>
			</div>
		</div>
	</div>
	<div class="modal-footer">
		<a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Cancel</a> <a
			href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Add</a>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			$('#userName').autocomplete({
				data : {
					"Mary" : null,
					"Apple" : null,
					"Microsoft" : null,
					"Google" : 'http://placehold.it/250x250'
				}
			});
		});

		$("#userName").change(function() {
			console.log("Change trigged");
			var str = "";
			str = $(this).val();
			if (str === 'Mary') {
				console.log("If statement: " + str);
				$('#userEmail').val('mary@gmail.com');
			} else {
				console.log("Else statement: " + str);
				$('#userEmail').val(' ');
			}
		}).change();
	</script>
</div>