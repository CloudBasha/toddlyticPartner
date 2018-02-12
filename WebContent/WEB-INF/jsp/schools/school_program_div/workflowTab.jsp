<div id="workflowTab">
	<div class="row">
		<div class="col s12 m9 l9">
			<table class="highlight">
				<thead>
					<tr>
						<th data-field="id">Program</th>
						<th data-field="name">Activity</th>
						<th>Notify</th>
						<th>When</th>
						<th>Action</th>
					</tr>
				</thead>

				<tbody>
					<tr>
						<td>Infant Program</td>
						<td>Milk</td>
						<td>Parent</td>
						<td>Milk Qty &gt; 0ml and &lt; 100ml</td>
						<td><a href="" class="tooltipped" data-position="bottom" data-delay="50"
							data-tooltip="Edit"><img src="<%=request.getContextPath()%>/images/edit.png" width="25px"
								height="25px" /></a> <a href="" class="tooltipped" data-position="bottom" data-delay="50"
							data-tooltip="Remove"><img src="<%=request.getContextPath()%>/images/delete.png"
								width="25px" height="25px" /></a></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="col s12 m3 l3">
			<div class="row sc_prog_right_options">
				<div class="col s12 m12 l12">
					<a href="#workflowModal" class="waves-effect waves-teal btn categories_selection modal-trigger"><i
						class="material-icons left">add</i>Add Workflow</a>
				</div>
			</div>
		</div>
	</div>
</div>

<div id="workflowModal" class="modal modal-fixed-footer workflowModal">
	<div class="modal-content">
		<div class="row">
			<h5 class="Lato_normal_font">New Workflow</h5>
		</div>
		<div class="row">
			<div class="col s12 m8 l8 input-field">
				<select>
					<option value="" disabled selected>Select activity</option>
					<option value="1">Meal</option>
					<option value="2">Health Check</option>
					<option value="3">Bottle Feeding</option>
				</select> <label>Activity</label>
			</div>
		</div>
		<div class="row">
			<div class="col s12 m6 l4">
				<input type="checkbox" id="npChk" class="filled-in" /> <label for="npChk">Notify Parent</label>
			</div>
			<div class="col s12 m6 l4">
				<input type="checkbox" id="ntChk" class="filled-in" /> <label for="ntChk">Notify
					Teacher</label>
			</div>
		</div>
		<div class="row">
			<div class="col s6 m3 l2 input-field">
				<select>
					<option value="" disabled selected>Select field</option>
					<option value="1">Field 1</option>
					<option value="2">Field 2</option>
					<option value="3">Field 3</option>
				</select> <label>Field</label>
			</div>
			<div class="col s6 m3 l3 input-field">
				<select>
					<option value="" disabled selected>Select operator</option>
					<option value="1">less than</option>
					<option value="2">greather than</option>
					<option value="3">equal</option>
					<option value="4">not equal</option>
				</select> <label>Operator</label>
			</div>
			<div class="col s6 m3 l2 input-field">
				<input type="text" id="workValue" class="validate" /> <label for="workValue">Value</label>
			</div>
			<div class="col s6 m3 l3 input-field">
				<select>
					<option value="" disabled selected>Select conjunction</option>
					<option value="1">and</option>
					<option value="2">or</option>
				</select> <label>Conjunction</label>
			</div>
			<div class="col s6 m3 l2 center-align">
				<a href="javascript:void(0)" onclick=""
					class="waves-effect btn-flat tooltipped" data-position="bottom" data-delay="50"
					data-tooltip="Add Item Row"><i class="material-icons">add</i></a>
			</div>
		</div>
	</div>
	<div class="modal-footer">
		<a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Cancel</a> <a
			href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Create</a>
	</div>
</div>