<%@include file="header.jsp"%>
<%@include file="login_nav.jsp"%>
<main> <%@include file="school_main_menu.jsp"%>
<div class="row container_margin">
	<div class="col s12 m2 l2 left_column">
		<div class="row">
			<div class="col s12 m12 l12">
				<div class="row">
					<div class="input-field col s12">
						<i class="material-icons prefix">textsms</i>
						<input type="text" id="autocomplete-input" class="autocomplete">
						<label for="autocomplete-input">Search Meals</label>
					</div>
					<div class="col s12 m12 l12" style="margin-top: 40px;">
						<a class="waves-effect waves-teal btn-flat left_menu_btn modal-trigger" href="#health_record">Add Record</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="col s12 m10 l8">
		<table class="responsive-table">
			<thead>
				<tr>
					<th data-field="name">Student Name</th>
					<th data-field="price">Fever(Temp)</th>
					<th data-field="datetime">Rashes</th>
					<th data-field="completion">Mouth Ulcer</th>
					<th>Blister/Eruption on palms/soles/buttocks</th>
					<th>Drooling saliva</th>
					<th>Red &amp; Watery Eyes</th>
					<th>Cough</th>
					<th>Runny nose</th>
					<th>Virus</th>
					<th>Time</th>
					<th>Notify Contact</th>
				</tr>
			</thead>

			<tbody>
				<tr>
					<td>Alvin</td>
					<td>35.3</td>
					<td>-</td>
					<td>-</td>
					<td>-</td>
					<td>-</td>
					<td>-</td>
					<td>-</td>
					<td>-</td>
					<td>-</td>
					<td>1.35pm</td>
					<td><a class="waves-effect waves-light btn">Notify</a>
				</tr>
				<tr>
					<td>Alan</td>
					<td>35.3</td>
					<td>-</td>
					<td>-</td>
					<td>-</td>
					<td>-</td>
					<td>Yes</td>
					<td>Yes</td>
					<td>-</td>
					<td>-</td>
					<td>12.40pm</td>
					<td><a class="waves-effect waves-light btn">Notify</a>
				</tr>
				<tr>
					<td>John</td>
					<td>35.3</td>
					<td>-</td>
					<td>-</td>
					<td>-</td>
					<td>-</td>
					<td>-</td>
					<td>-</td>
					<td>-</td>
					<td>-</td>
					<td>10.05am</td>
					<td><a class="waves-effect waves-light btn">Notify</a>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="col s12 m6 l2 right_column ">
		<div class="row">
			<div class="col s12 m12 l12">Recent Items</div>
		</div>
		<%@include file="recent_item.jsp"%>
	</div>
</div>
<%@include file="modal.jsp" %>
</main>
<%@include file="footer.jsp"%>