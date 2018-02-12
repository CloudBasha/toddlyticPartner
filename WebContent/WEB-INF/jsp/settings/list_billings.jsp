<div id="settings_billing_div" class="settings_billing_div">
	<div class="row tabsHolderDiv form_view_row">
		<div class="col s12 m12 l12">
			<div class="row">
				<div class="col s12 m3 l2">
					<span class="Lato_normal_font priviledge_custom_label">School Name:</span>
				</div>
				<div class="col s12 m3 l3">
					<select>
						<option value="" selected>Q Dees Subang</option>
						<option value="">Q Dees Bangsar</option>
					</select>
				</div>
				<div class="col s12 m3 offset-l3 l2">
					<a href="" class="waves-effect waves-teal btn categories_selection modal-trigger"><i
						class="material-icons left">present_to_all</i>Upgrade Plan</a>
				</div>
				<div class="col s12 m3 l2">
					<a href="" class="waves-effect waves-teal btn categories_selection modal-trigger"><i
						class="material-icons left">payment</i>Payment</a>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<ul class="tabs">
			<li class="tab col s3"><a class="active" href="#collectionsTab">Collections</a></li>
			<li class="tab col s3"><a href="#chargesTab">Charges</a></li>
		</ul>
		<%@include file="billings/collectionsTab.jsp" %>
		<%@include file="billings/chargesTab.jsp" %>
	</div>
</div>