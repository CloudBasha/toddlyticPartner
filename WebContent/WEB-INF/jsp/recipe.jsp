<%@include file="header.jsp"%>
<%@include file="login_nav.jsp"%>
<main> <%@include file="school_setting_menu.jsp"%>
<div class="row container_margin">
	<div class="col s12 m6 l3">
		<div class="row">
			<div class="col s12 m12 l12">
				<div class="row">
					<div class="input-field col s12">
						<i class="material-icons prefix">textsms</i> <input type="text" id="autocomplete-input"
							class="autocomplete"> <label for="autocomplete-input">Search Recipe</label>
					</div>
				</div>
				<ul class="collapsible" data-collapsible="accordion">
					<li>
						<div class="collapsible-header active">
							<i class="material-icons">library_books</i> Recipes
						</div>
						<div class="collapsible-body">
							<div class="collapse_content">
								<a href="" class="waves-effect waves-teal btn-flat">View Recipes</a> <a
									class="waves-effect waves-teal btn-flat left_menu_btn modal-trigger" href="#new_recipe">Add
									Recipe</a>
							</div>
						</div>
					</li>
					<li>
						<div class="collapsible-header">
							<i class="material-icons">store</i> Meals
						</div>
						<div class="collapsible-body">
							<div class="collapse_content">
								<a href="" class="waves-effect waves-teal btn-flat">View Meals</a> <a href="#add_meal"
									class="waves-effect waves-teal btn-flat modal-trigger">Add Meal</a>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<div id="view_meal_info" class="view_meal_info col s12 m6 l8">
		<div class="row">
			<div class="col s12 m12 l1"></div>
			<div class="col s12 m12 l10">
				<table class="responsive-table">
					<thead>
						<tr>
							<th data-field="name">Meal Name</th>
							<th data-field="price">Description</th>
							<th data-field="datetime">Recipes</th>
							<th>Action</th>
						</tr>
					</thead>

					<tbody>
						<tr>
							<td>Lunch Meal</td>
							<td>Lorem Ipsum</td>
							<td><a href="#recipe_pop_up" class="modal-trigger"><img
									src="<%=request.getContextPath()%>/images/food.png" width="30px" height="30px" /></a></td>
						</tr>
						<tr>
							<td>Blackberry Cheese Cake</td>
							<td>Blackberry, Cheese</td>
							<td>200</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<div id="view_recipe_info" class="col s12 m6 l8 view_recipe_info">
		<div class="row">
			<div class="col s12 m12 l1"></div>
			<div class="col s12 m12 l10">
				<table class="responsive-table">
					<thead>
						<tr>
							<th data-field="name">Recipe Name</th>
							<th data-field="price">Ingredients</th>
							<th data-field="datetime">Calories</th>
						</tr>
					</thead>

					<tbody>
						<tr>
							<td>Blueberry Cheese Cake</td>
							<td>Blueberry, Cheese</td>
							<td>100</td>
						</tr>
						<tr>
							<td>Blackberry Cheese Cake</td>
							<td>Blackberry, Cheese</td>
							<td>200</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>

<div id="recipe_pop_up" class="modal" style="width: 15%;">
	<div class="modal-content">
		<div class="row form_view_row">
			<div class="col s12 m12 l12">
				<p class="Lato_bold_font recipe_popup_name">Recipes</p>
			</div>
		</div>
		<div class="row form_view_row">
			<div class="col s12 m12 l12">
				<p class="Lato_normal_font">Bluecheese Cake</p>
			</div>
		</div>
		<div class="row form_view_row">
			<div class="col s12 m12 l12">
				<p class="Lato_normal_font">Coca Cola</p>
			</div>
		</div>
	</div>
</div>
<div id="add_meal" class="modal" style="width: 80%">
	<div class="modal-content">
		<div class="row">
			<div class="col s12 m5 l4 left_column">
				<div class="row">
					<div class="col s12 m12 l12">
						<h5 class="Lato_normal_font">Meal Info</h5>
					</div>
				</div>
				<div class="row">
					<div class="input-field col s12 m12 l12">
						<input id="student_name" type="text" class="validate"> <label for="student_name">Meal
							Name</label>
					</div>
				</div>
				<div class="row">
					<div class="input-field col s12 m12 l12">
						<textarea id="meal_desc" class="materialize-textarea"></textarea>
						<label for="meal_desc">Description</label>
					</div>
				</div>
			</div>
			<div class="col s12 m7 l8">
				<div class="row">
					<div class="col s12 m12 l12">
						<h5 class="Lato_normal_font">Select Recipes</h5>
					</div>
				</div>
				<div class="row">
					<div class="col s12 m4 l3">
						<input type="checkbox" class="filled-in" id="filled-in-box" /> <label for="filled-in-box">Cheese
							Cake</label>
					</div>
					<div class="col s12 m4 l3">
						<input type="checkbox" class="filled-in" id="filled-in-box_1" /> <label for="filled-in-box_1">Cake</label>
					</div>
					<div class="col s12 m4 l3">
						<input type="checkbox" class="filled-in" id="filled-in-box_2" /> <label for="filled-in-box_2">Chocolate</label>
					</div>
					<div class="col s12 m4 l3">
						<input type="checkbox" class="filled-in" id="filled-in-box_3" /> <label for="filled-in-box_3">Jelly</label>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col s12 m4 l3"></div>
		</div>
	</div>
	<div class="modal-footer">
		<a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Cancel</a> <a
			href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Add</a>
	</div>
</div>
<div id="new_recipe" class="modal" style="width: 20%">
	<div class="modal-content">
		<div class="row">
			<div class="input-field col s12 m12 l12">
				<input id="student_name" type="text" class="validate"> <label for="student_name">Recipe
					Name</label>
			</div>
			<div class="input-field col s12 m12 l12">
				<textarea id="textarea1" class="materialize-textarea" length="120"></textarea>
				<label for="textarea1">Ingredients</label>
			</div>
			<div class="input-field col s12 m12 l12">
				<textarea id="textarea1" class="materialize-textarea" length="120"></textarea>
				<label for="textarea1">Calories</label>
			</div>
		</div>
	</div>
	<div class="modal-footer">
		<a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Cancel</a> <a
			href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Add</a>
	</div>
</div>
</main>
<%@include file="footer.jsp"%>