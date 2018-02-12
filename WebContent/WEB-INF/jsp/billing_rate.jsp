<%@include file="header.jsp"%>
<%@include file="login_nav.jsp"%>
<main> <%@include file="school_setting_menu.jsp"%>

<div class="row container_margin">
	<div class="col s12 m6 l2 left_column">
		<div class="row">
			<div class="col s12 m12 l12">
				<div class="row">
					<div class="input-field col s12">
						<i class="material-icons prefix">textsms</i> <input type="text" id="autocomplete-input"
							class="autocomplete"> <label for="autocomplete-input">Search Rate</label>
					</div>
					<div class="col s12 m12 l12" style="margin-top: 40px;">
						<a class="waves-effect waves-teal btn-flat left_menu_btn modal-trigger" href="#billing_rate">Add
							Rate</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="col s12 m6 l10">
		<div class="row">
			<div class="col s12 m12 l1"></div>
			<div class="col s12 m12 l10">
				<table class="responsive-table striped">
					<thead>
						<tr>
							<th data-field="name">Program Name</th>
							<th data-field="price">Unit Price</th>
							<th data-field="datetime">Description</th>
							<th data-field="completion">Period</th>
							<th data-field="period">Start Time</th>
							<th>End Time</th>
							<th>Billing Days</th>
						</tr>
					</thead>

					<tbody>
						<tr>
							<td>Baby Programme</td>
							<td>700</td>
							<td>Desciption 123</td>
							<td>Yearly</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
						</tr>
						<tr>
							<td>Meal Plan</td>
							<td>150</td>
							<td>Description 123</td>
							<td>Monthly</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
						</tr>
						<tr>
							<td>Meal Plan</td>
							<td>10</td>
							<td>One-Off</td>
							<td>Description 123</td>
							<td>-</td>
							<td>-</td>
							<td>Monday,Tuesday,Wednesday,Thursday,Friday</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<%-- <div class="col s12 m6 l3">
		<div class="row">
			<div class="col s12 m12 l12">Recent Items</div>
		</div>
		<%@include file="recent_item.jsp"%>
	</div> --%>
</div> </main>
<%@include file="footer.jsp"%>