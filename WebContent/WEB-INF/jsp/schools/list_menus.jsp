<div id="school_menus_div" class="school_menus_div" ng-controller="menuController">
	<div class="row">
		<div class="col s12 m9 l9">
			<ul class="collapsible" data-collapsible="accordion">
				<li ng-repeat="menu in menus track by $index">
					<div id="menuCollapse_{{$index}}" class="collapsible-header">
						<div class="row noMargin">
							<div class="col">
								<i class="material-icons">filter_drama</i>{{menu.menu.menuName}}
							</div>
							<div style="position: relative;top: 5px;" class="col right">
								<a ng-click="editMenu(menu)" class="tooltipped" data-position="bottom" data-delay="50"
								data-tooltip="Edit"><img src="<%=request.getContextPath()%>/images/edit.png"
									width="20px" height="20px" /></a> 
								<a ng-click="showDeleteMenuConfirm(menu)" class="tooltipped" data-position="bottom"
								data-delay="50" data-tooltip="Remove"><img
									src="<%=request.getContextPath()%>/images/delete.png" width="20px" height="20px" /></a>
							</div>
						</div>
					</div>
					<div class="collapsible-body">
						<div class="row">
							<div class="col s12 m12 l12">
								<table class="highlight">
									<thead>
										<tr>
											<th>Meal</th>
											<th>Recipes</th>
											<th>Action</th>
										</tr>
									</thead>
									<tbody>
										<tr ng-repeat="meal in menu.mealRecipeList">
											<td>{{meal.meal.mealName}}</td>
											<td>
												<span ng-if="meal.recipe.length == 1" ng-repeat="recipe in meal.recipe">{{recipe.name}}</span>
												<span ng-if="meal.recipe.length > 1" ng-repeat="recipe in meal.recipe">{{recipe.name}}, </span>
											</td>
											<td><a ng-click="editMeal(menu.menu, meal)" class="tooltipped" data-position="bottom" data-delay="50"
												data-tooltip="Edit"><img src="<%=request.getContextPath()%>/images/edit.png"
													width="20px" height="20px" /></a> 
												<a ng-click="showDeleteMealConfirm(meal)" class="tooltipped" data-position="bottom"
												data-delay="50" data-tooltip="Remove"><img
													src="<%=request.getContextPath()%>/images/delete.png" width="20px" height="20px" /></a></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</li>
			</ul>
		</div>
		<div class="col s12 m3 l3">
			<div class="row sc_prog_right_options">
				<div class="col s12 m12 l12">
					<a href="#createMenuModal"
						class="waves-effect waves-teal btn categories_selection modal-trigger"><i
						class="material-icons left">add</i>New Menu</a>
				</div>
			</div>
			<div class="row sc_prog_right_options">
				<div class="col s12 m12 l12">
					<a href="#createMealModal"
						class="waves-effect waves-teal btn categories_selection modal-trigger"><i
						class="material-icons left">add</i>New Meal</a>
				</div>
			</div>
		</div>
	</div>

	<div id="createMenuModal" class="modal modal-fixed-footer createMenuModal">
		<div class="modal-content">
			<div class="row">
				<h5 class="Lato_normal_font">New Menu</h5>
			</div>
			<div class="row sc_pro_row form_view_row">
				<div class="col s12 m12 l12 input-field">
					<input type="text" id="c_menuName" empty-input ng-model="menuName" /> <label for="c_menuName">Menu Name</label>
				</div>
			</div>
		</div>
		<div class="modal-footer">
			<a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Cancel</a> <a
				href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat" ng-click="createMenu()">Create</a>
		</div>
	</div>
	
	<div id="editMenuModal" class="modal modal-fixed-footer createMenuModal">
		<div class="modal-content">
			<div class="row">
				<h5 class="Lato_normal_font">Edit Menu</h5>
			</div>
			<div class="row sc_pro_row form_view_row">
				<div class="col s12 m12 l12 input-field">
					<input type="text" id="c_menuName" placeholder="Menu Name" empty-input ng-model="editMenuName" /> <label for="c_menuName">Menu Name</label>
				</div>
			</div>
		</div>
		<div class="modal-footer">
			<a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Cancel</a> <a
				href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat" ng-click="submitEditMenu()">Edit</a>
		</div>
	</div>
	
	<div id="deleteMenuConfirmModal" class="modal modal-fixed-footer deleteSchoolModal">
		<div class="modal-content">
			Are you sure you want to delete <b>{{deleteMenuName}}</b>?
		</div>
		<div class="modal-footer">
			<a href="#!"
				class=" modal-action modal-close waves-effect waves-green btn-flat">Cancel</a>
			<button
				class="btn-flat modal-action modal-close waves-effect waves-light" ng-click="deleteMenu()">Delete
			</button>
		</div>
	</div>
	
	<div id="createMealModal" class="modal modal-fixed-footer createMealModal">
		<div class="modal-content">
			<div class="row">
				<h5 class="Lato_normal_font">New Meal</h5>
			</div>
			<div class="row sc_pro_row form_view_row">
				<div class="col s12 m6 l6 input-field">
					<input type="text" id="c_mealName" ng-model="mealName" /> <label for="c_mealName">Meal Name</label>
				</div>
			</div>
			<div class="row">
				<div class="col s12 m6 l6 input-field">
					<select ng-model="menuId">
						<option value="" disabled selected>Select menu</option>
						<option ng-repeat="menu in menus" value="{{menu.menu.menuId}}">{{menu.menu.menuName}}</option>
					</select> <label>Menus</label>
				</div>
				<div class="col s10 m4 l4 input-field">
					<input type="text" class="validate" ng-model="recipeInfo[0]" id="menuRecipe" value="Chicken" /> <label for="menuRecipe">Recipe</label>
				</div>
				<div class="col s2 m1 l1 package_add_btn" id="recipeDiv">
					<a id="addRecipe" ng-click="addRecipe()" class="waves-effect btn-flat tooltipped"
						data-position="bottom" data-delay="50" data-tooltip="Add Recipe Row"><i
						class="material-icons">add</i></a>
				</div>
			</div>
		</div>
		<div class="modal-footer">
			<a class=" modal-action modal-close waves-effect waves-green btn-flat">Cancel</a> 
			<a class=" modal-action modal-close waves-effect waves-green btn-flat" ng-click="createMeal()">Create</a>
		</div>
	</div>
	
	<div id="editMealModal" class="modal modal-fixed-footer createMealModal">
		<div class="modal-content">
			<div class="row">
				<h5 class="Lato_normal_font">Edit Meal</h5>
			</div>
			<div class="row sc_pro_row form_view_row">
				<div class="col s12 m6 l6 input-field">
					<input type="text" placeholder="Meal Name" id="c_mealName" ng-model="editMealName" /> <label for="c_mealName">Meal Name</label>
				</div>
			</div>
			<div class="row">
				<div class="col s12 m6 l6 input-field">
					<select ng-model="editMenuId" ng-options="menu.menu.menuId as menu.menu.menuName for menu in menus">
					</select> <label>Menus</label>
				</div>
				<div class="col s10 m4 l4 input-field">
					<input type="text" placeholder="Recipe" class="validate" ng-model="editRecipeInfo[0]" id="menuRecipe" value="Chicken" /> <label for="menuRecipe">Recipe</label>
				</div>
				<div class="col s2 m1 l1 package_add_btn" id="editRecipeDiv">
					<a id="addRecipe" ng-click="addEditRecipe(editMealRecipes.length)" class="waves-effect btn-flat tooltipped"
						data-position="bottom" data-delay="50" data-tooltip="Add Recipe Row"><i
						class="material-icons">add</i></a>
				</div>
				<div ng-repeat="editRecipe in editMealRecipes" id="editRecipeDiv_{{$index}}" class="row">
					<div class="col s5 offset-s6 input-field">
						<input placeholder="Recipe" ng-model="editRecipe.name" type="text" class="validate col s9" id="editRecipeItem_{{$index}}"/>
					 	<label for="editRecipeItem_{{$index}}">Recipe</label><img class="activityModalsDeleteButton" ng-click="deleteServerEditRecipeItemEntryRow($index, editMealRecipes)" src="./images/remove.png" width="30px" height="30px" />
				 	</div>
			 	</div>
			</div>
		</div>
		<div class="modal-footer">
			<a class=" modal-action modal-close waves-effect waves-green btn-flat">Cancel</a> 
			<a class=" modal-action modal-close waves-effect waves-green btn-flat" ng-click="submitEditMeal()">Edit</a>
		</div>
	</div>
	
	<div id="deleteMealConfirmModal" class="modal modal-fixed-footer deleteSchoolModal">
		<div class="modal-content">
			Are you sure you want to delete <b>{{deleteMealName}}</b>?
		</div>
		<div class="modal-footer">
			<a href="#!"
				class=" modal-action modal-close waves-effect waves-green btn-flat">Cancel</a>
			<button
				class="btn-flat modal-action modal-close waves-effect waves-light" ng-click="deleteMeal()">Delete
			</button>
		</div>
	</div>
</div>