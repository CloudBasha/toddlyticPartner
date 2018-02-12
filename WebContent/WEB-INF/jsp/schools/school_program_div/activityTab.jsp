<script type="text/javascript">
	var count = 0;
	function createNewItemRow() {
		if (count == 0) {
			count++;
			$('#firstItemRow').after('<div id="firstItemRow_'+count+'" class="row"><div class="col s9 m9 l9 input-field"><input id="itemName_'+ count +'" type="text" placeholder="Item Name" /></div>' + '<div class="col s3 m3 l3 input-field">' + '<a href="javascript:void(0)" onclick="createNewItemRow();" class="waves-effect btn-flat tooltipped" data-position="bottom"' + 'data-delay="50" data-tooltip="Add Item Row"><i class="material-icons">add</i></a></div></div>');
		} else if (count > 0) {
			var tempCount = count + 1;
			$('#firstItemRow_' + count).after('<div id="firstItemRow_'+tempCount+'" class="row">' + '<div class="col s9 m9 l9 input-field"><input id="itemName_'+ tempCount +'" type="text" placeholder="Item Name" /></div>' + '<div class="col s3 m3 l3 input-field">' + '<a href="javascript:void(0)" onclick="createNewItemRow();" class="waves-effect btn-flat tooltipped" data-position="bottom"' + 'data-delay="50" data-tooltip="Add Item Row"><i class="material-icons">add</i></a></div></div>');
			count++;
		}
	}
</script>
<div id="activityTab" ng-controller="programActivityController">
	<div class="row">
		<div class="col s12 m12 l12">
			<ul class="collapsible" data-collapsible="accordion">
				<li ng-repeat="activity in programActivities">
					<div class="collapsible-header">
						<i class="material-icons">filter_drama</i>{{activity.programName}}
					</div>
					<div class="collapsible-body">
						<div class="sc_pro_container">
							<div class="row sc_pro_row">
								<div class="col s12 m12 l12">
									<table class="highlight">
										<thead>
											<tr>
												<th data-field="id">Name</th>
												<th data-field="name">Type</th>
												<th></th>
											</tr>
										</thead>

										<tbody>
											<tr ng-repeat="item in activity.activityWithItems">
												<td>{{item.activity.activityName}}</td>
												<td>{{item.activity.activityType}}</td>
												<td><a tooltipped ng-if="item.activity.activityType == 'Activity'" ng-click="editActivity(item)" data-position="bottom" data-delay="50"
													data-tooltip="Edit"><img src="<%=request.getContextPath()%>/images/edit.png"
													width="20px" height="20px" /></a>
													<a tooltipped ng-if="item.activity.activityType == 'Checklist'" ng-click="viewChecklistItems(item)" data-position="bottom" data-delay="50"
													data-tooltip="View Checklist"><img src="<%=request.getContextPath()%>/images/view_photo.png"
													width="20px" height="20px" /></a>
													<a tooltipped ng-if="item.activity.activityType == 'Checklist'" ng-click="editChecklist(item)" data-position="bottom" data-delay="50"
													data-tooltip="Edit"><img src="<%=request.getContextPath()%>/images/edit.png"
													width="20px" height="20px" /></a>
													<a tooltipped ng-click="showDeleteActivityConfirm(item)" data-position="bottom" data-delay="50"
													data-tooltip="Remove"><img src="<%=request.getContextPath()%>/images/delete.png"
													width="20px" height="20px" /></a>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col s12 m12 l12 right-align">
								<a tooltipped ng-click="createChecklist(activity)"
									class="waves-effect waves-teal btn-flat" data-position="bottom"
									data-delay="50" data-tooltip="Create Checklist"><i class="medium material-icons">toc</i></a>
								<a tooltipped ng-click="createActivity(activity)"
									class="waves-effect waves-teal btn-flat" data-position="bottom"
									data-delay="50" data-tooltip="Create Activity"><i class="medium material-icons">mode_edit</i></a>
							</div>
						</div>
					</div>
				</li>
			</ul>
		</div>
	</div>

	<div id="createChecklistModal" class="modal createChecklistModal">
		<div class="modal-content">
			<div class="row">
				<h5 class="Lato_normal_font">New Checklist</h5>
			</div>
			<div class="row">
				<div class="col s12 m12 l12 input-field">
					<input id="checklistName" class="validate" type="text" ng-model="checklistName"/> <label for="checklistName">Name</label>
				</div>
			</div>
			<div id="firstItemRow" class="row">
				<div class="col s9 m9 l9 input-field">
					<input id="itemName" type="text" placeholder="Item Name" ng-model="activityItems[0]"/>
				</div>
				<div class="col s3 m3 l3 input-field" id="activityItemDiv">
					<a ng-click="addChecklistItem()"
						class="waves-effect btn-flat tooltipped" data-position="bottom" data-delay="50"
						data-tooltip="Add Item Row"><i class="material-icons">add</i></a>
				</div>
			</div>
	
		</div>
		<div class="modal-footer">
			<a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Cancel</a>
			<a ng-click="submitCreateActivity('checklist')" class=" modal-action modal-close waves-effect waves-green btn-flat">Save</a>
		</div>
	</div>
	
	<div id="createActivityModal" class="modal createActivityModal">
		<div class="modal-content">
			<div class="row">
				<h5 class="Lato_normal_font">New Activity</h5>
			</div>
			<div class="row">
				<div class="col s12 m12 l12 input-field">
					<input id="activityName" class="validate" type="text" ng-model="activityName"/> <label for="activityName">Name</label>
				</div>
				<div class="col s12 m12 l12 input-field">
					<textarea id="activityNote" class="materialize-textarea" ng-model="activityNote"></textarea>
					<label for="activityNote">Note</label>
				</div>
			</div>
		</div>
		<div class="modal-footer">
			<a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Cancel</a> 
			<a ng-click="submitCreateActivity('activity')" class=" modal-action modal-close waves-effect waves-green btn-flat">Save</a>
		</div>
	</div>
	
	<div id="editActivityModal" class="modal createActivityModal">
		<div class="modal-content">
			<div class="row">
				<h5 class="Lato_normal_font">Edit Activity</h5>
			</div>
			<div class="row">
				<div class="col s12 m12 l12 input-field">
					<input id="editActivityName" class="validate" type="text" ng-model="editActivityName"/> <label for="editActivityName">Name</label>
				</div>
				<div class="col s12 m12 l12 input-field">
					<textarea id="editActivityNote" class="materialize-textarea" ng-model="editActivityNote"></textarea>
					<label for="editActivityNote">Note</label>
				</div>
			</div>
		</div>
		<div class="modal-footer">
			<a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Cancel</a> 
			<a ng-click="submitEditActivity('activity')" class=" modal-action modal-close waves-effect waves-green btn-flat">Save</a>
		</div>
	</div>
	
	<div id="editChecklistModal" class="modal createChecklistModal">
		<div class="modal-content">
			<div class="row">
				<h5 class="Lato_normal_font">New Checklist</h5>
			</div>
			<div class="row">
				<div class="col s12 m12 l12 input-field">
					<input id="editChecklistName" class="validate" type="text" ng-model="editChecklistName"/> <label for="editChecklistName">Name</label>
				</div>
			</div>
			<div id="firstItemRow" class="row">
				<div class="col s9 m9 l9 input-field">
					<input id="itemName" type="text" placeholder="Item Name" ng-model="editActivityItemsArray[0]"/>
				</div>
				<div class="col s3 m3 l3 input-field" id="editActivityItemDiv">
					<a ng-click="addEditChecklistItem()"
						class="waves-effect btn-flat tooltipped" data-position="bottom" data-delay="50"
						data-tooltip="Add Item Row"><i class="material-icons">add</i></a>
				</div>
				<div ng-repeat="editActivityItem in editActivityItems" id="editActivityItemDiv_{{$index}}" class="row">
					<div class="col s12 input-field">
						<input placeholder="Recipe" ng-model="editActivityItem.itemName" type="text" class="validate col s9" id="editActivityItem_{{$index}}"/>
					 	<label for="editActivityItem_{{$index}}">Item Name</label><img class="activityModalsDeleteButton" ng-click="deleteServerEditActivityItemEntryRow($index, editActivityItems)" src="./images/remove.png" width="30px" height="30px" />
				 	</div>
			 	</div>
			</div>
	
		</div>
		<div class="modal-footer">
			<a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Cancel</a>
			<a ng-click="submitEditActivity('checklist')" class=" modal-action modal-close waves-effect waves-green btn-flat">Save</a>
		</div>
	</div>
	
	<div id="viewCheclistItemsModal" class="modal modal-fixed-footer">
		<div class="modal-content">
			<div ng-repeat="item in checklistItems">
				{{item.itemName}}
			</div>
		</div>
		<div class="modal-footer">
			<a class=" modal-action modal-close waves-effect waves-green btn-flat">Close</a>
		</div>
	</div>
	
	<div id="deleteActivityConfirmModal" class="modal modal-fixed-footer deleteSchoolModal">
		<div class="modal-content">
			Are you sure you want to delete <b>{{deleteActivityName}}</b>?
		</div>
		<div class="modal-footer">
			<a href="#!"
				class=" modal-action modal-close waves-effect waves-green btn-flat">Cancel</a>
			<button
				class="btn-flat modal-action modal-close waves-effect waves-light" ng-click="deleteActivity()">Delete
			</button>
		</div>
	</div>
</div>
