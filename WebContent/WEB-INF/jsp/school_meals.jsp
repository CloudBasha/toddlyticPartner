<%@include file="header.jsp"%>
<%@include file="login_nav.jsp"%>
<main> <%@include file="school_main_menu.jsp"%>
<div class="row container_margin">
	<div class="col s12 m6 l2 left_column">
		<div class="row">
			<div class="col s12 m12 l12">
				<div class="row">
					<div class="input-field col s12">
						<i class="material-icons prefix">textsms</i>
						<input type="text" id="autocomplete-input" class="autocomplete">
						<label for="autocomplete-input">Search Meals</label>
					</div>
					<div class="col s12 m12 l12" style="margin-top: 40px;">
						<a class="waves-effect waves-teal btn-flat left_menu_btn modal-trigger" href="#meal_record">Add Record</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="col s12 m6 l8">
		<table class="responsive-table">
			<thead>
				<tr>
					<th data-field="name">Student Name</th>
					<th data-field="price">Type</th>
					<th data-field="datetime">DateTime</th>
					<th data-field="completion">Completion</th>
				</tr>
			</thead>

			<tbody>
				<tr>
					<td>Alvin</td>
					<td>Breakfast</td>
					<td>09.00am</td>
					<td>Finish</td>
				</tr>
				<tr>
					<td>Alan</td>
					<td>Lunch</td>
					<td>12.15pm</td>
					<td>Half</td>
				</tr>
				<tr>
					<td>John</td>
					<td>Snack</td>
					<td>03.00pm</td>
					<td>Finish</td>
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