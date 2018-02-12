<div id="requestPurchasing" class="col s12 m12 l12">
	<div class="row">
		<div class="col s12 m9">
			<div class="col s12 m2">
				<a class="col s12 waves-effect waves-light btn requestSortButtons">Overdue</a>
			</div>
			<div class="col s12 m2">
				<a class="col s12 waves-effect waves-light btn requestSortButtons">Low</a>
			</div>
			<div class="col s12 m2">
				<a class="col s12 waves-effect waves-light btn requestSortButtons">High</a>
			</div>
			<div class="col s12 m2">
				<a class="col s12 waves-effect waves-light btn requestSortButtons">Critical</a>
			</div>
			<div class="col s12 m2">
				<a class="col s12 waves-effect waves-light btn requestSortButtons">Open</a>
			</div>
			<div class="col s12 m2">
				<a class="col s12 waves-effect waves-light btn requestSortButtons">Closed</a>
			</div>
		</div>
		<div class="col s12 m3">
			<div class="col s12">
				<a class="col s12 waves-effect waves-light btn modal-trigger" href="#reqPurchasingModal"><i class="material-icons left">add</i>Request Purchasing</a>
			</div>
		</div>
	</div>
	<div class="maintenanceTableDiv">
	  <table class="bordered centered">
        <thead>
          <tr>
              <th data-field="date">Date</th>
              <th data-field="time">Time</th>
              <th data-field="creator">Created By</th>
              <th data-field="desc">Description</th>
              <th data-field="qty">Qty</th>
              <th data-field="type">Type</th>
              <th data-field="due">Due</th>
              <th data-field="importance">Importance</th>
              <th data-field="status">Status</th>
              <th data-field="status"></th>
          </tr>
        </thead>

        <tbody>
          <tr id="purchaseRow_1">
            <td>20/01/16</td>
            <td>10:41 am</td>
            <td>Jon</td>
            <td>A4 Paper</td>
            <td>1</td>
            <td>Stationary</td>
            <td>31/01/16</td>
            <td>High</td>
            <td>Open</td>
            <td><a onclick="editRow('1')"><img src="<%=request.getContextPath()%>/images/edit.png" width="25px" height="25px" /></a> 
            	<a onclick="deleteRow('1')"><img src="<%=request.getContextPath()%>/images/delete.png" width="25px" height="25px" /></a></td>
          </tr>
          <tr id="purchaseRow_2">
            <td>20/01/16</td>
            <td>10:42 am</td>
            <td>Sean</td>
            <td>A4 Paper</td>
            <td>1</td>
            <td>Stationary</td>
            <td>31/01/16</td>
            <td>High</td>
            <td>Open</td>
            <td><a onclick="editRow('2')"><img src="<%=request.getContextPath()%>/images/edit.png" width="25px" height="25px" /></a> 
            	<a onclick="deleteRow('2')"><img src="<%=request.getContextPath()%>/images/delete.png" width="25px" height="25px" /></a></td>
          </tr>
          <tr id="purchaseRow_3">
            <td>20/01/16</td>
            <td>10:43 am</td>
            <td>Paul</td>
            <td>A4 Paper</td>
            <td>1</td>
            <td>Stationary</td>
            <td>31/01/16</td>
            <td>High</td>
            <td>Open</td>
            <td><a onclick="editRow('3')"><img src="<%=request.getContextPath()%>/images/edit.png" width="25px" height="25px" /></a> 
            	<a onclick="deleteRow('3')"><img src="<%=request.getContextPath()%>/images/delete.png" width="25px" height="25px" /></a></td>
          </tr>
        </tbody>
      </table>
	</div>	
</div>

<script type="text/javascript">
	function deleteRow(rowId){
		$('#purchaseRow_'+rowId).remove();

	}
</script>