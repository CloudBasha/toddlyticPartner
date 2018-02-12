<%@include file="header.jsp"%>
<%@include file="login_nav.jsp"%>
<main>
<div class="row">
	<div class="col s12 m2 l2 left_column">
		<div class="row">
			<div class="s12 m12 l12 input-field">
				<input id="searchInput" type="text" class="validate" /> <label for="searchInput">Search</label>
			</div>
		</div>

		<div class="row">
			<div id="categories" class="s12 m12 l12">
				<a id="set_1" href="javascript:void(0)" onclick="swProgDiv(0);"
					class="categories_selection waves-effect waves-teal btn-flat categories_selection_active">My Profile</a> <a id="set_2"
					href="javascript:void(0)" onclick="swProgDiv(1);"
					class="categories_selection waves-effect waves-teal btn-flat">Billings</a> <a id="set_3"
					href="javascript:void(0)" onclick="swProgDiv(2);"
					class="categories_selection waves-effect waves-teal btn-flat">User Roles</a> <a id="set_4"
					href="javascript:void(0)" onclick="swProgDiv(3);"
					class="categories_selection waves-effect waves-teal btn-flat">System Locale</a>
					<a id="set_5" href="javascript:void(0)" onclick="swProgDiv(4);" class="categories_selection waves-effect waves-teal btn-flat">Enable Billing</a> 
			</div>
		</div>
	</div>
	<div class="col s12 m10 l10">
		<%@include file="settings/my_profile.jsp"%>
		<%@include file="settings/list_billings.jsp"%>
		<%@include file="settings/list_roles.jsp"%>
		<%@include file="settings/system_locale.jsp"%>
		<%@include file="settings/enable_billing.jsp" %>
	</div>
</div>
</main>

<script type="text/javascript">

function reRenderCategories(){
	document.getElementById('categories').style.display = 'none';
	setTimeout(function(){
		document.getElementById('categories').style.display = 'block';
	}, 10);
}
	function swProgDiv(d) {
		switch (d) {
		case 0:
			document.getElementById('my_profile_div').style.display = 'block';
			document.getElementById('settings_billing_div').style.display = 'none';
			document.getElementById('settings_role_div').style.display = 'none';
			document.getElementById('system_locale_div').style.display = 'none';
			document.getElementById('enable_billing_div').style.display = 'none';
			$('#set_1').addClass('categories_selection_active');
			document.getElementById('set_2').classList.remove("categories_selection_active");
			document.getElementById('set_3').classList.remove("categories_selection_active");
			document.getElementById('set_4').classList.remove("categories_selection_active");
			document.getElementById('set_5').classList.remove("categories_selection_active");

			reRenderCategories();
			break;
		case 1:
			document.getElementById('my_profile_div').style.display = 'none';
			document.getElementById('settings_billing_div').style.display = 'block';
			document.getElementById('settings_role_div').style.display = 'none';
			document.getElementById('system_locale_div').style.display = 'none';
			document.getElementById('enable_billing_div').style.display = 'none';
			$('#set_2').addClass('categories_selection_active');
			document.getElementById('set_1').classList.remove("categories_selection_active");
			document.getElementById('set_3').classList.remove("categories_selection_active");
			document.getElementById('set_4').classList.remove("categories_selection_active");
			document.getElementById('set_5').classList.remove("categories_selection_active");

			$('ul.tabs').tabs();
			reRenderCategories();
			break;
			
		case 2:
			document.getElementById('my_profile_div').style.display = 'none';
			document.getElementById('settings_billing_div').style.display = 'none';
			document.getElementById('settings_role_div').style.display = 'block';
			document.getElementById('system_locale_div').style.display = 'none';
			document.getElementById('enable_billing_div').style.display = 'none';
			$('#set_3').addClass('categories_selection_active');
			document.getElementById('set_1').classList.remove("categories_selection_active");
			document.getElementById('set_2').classList.remove("categories_selection_active");
			document.getElementById('set_4').classList.remove("categories_selection_active");
			document.getElementById('set_5').classList.remove("categories_selection_active");
			

			$('ul.tabs').tabs();
			reRenderCategories();
			break;
		case 3:
			document.getElementById('my_profile_div').style.display = 'none';
			document.getElementById('settings_billing_div').style.display = 'none';
			document.getElementById('settings_role_div').style.display = 'none';
			document.getElementById('system_locale_div').style.display = 'block';
			document.getElementById('enable_billing_div').style.display = 'none';
			$('#set_4').addClass('categories_selection_active');
			document.getElementById('set_1').classList.remove("categories_selection_active");
			document.getElementById('set_2').classList.remove("categories_selection_active");
			document.getElementById('set_3').classList.remove("categories_selection_active");
			document.getElementById('set_5').classList.remove("categories_selection_active");

			reRenderCategories();
			break;
		case 4:
			document.getElementById('my_profile_div').style.display = 'none';
			document.getElementById('settings_billing_div').style.display = 'none';
			document.getElementById('settings_role_div').style.display = 'none';
			document.getElementById('system_locale_div').style.display = 'none';
			document.getElementById('enable_billing_div').style.display = 'block';
			$('#set_5').addClass('categories_selection_active');
			document.getElementById('set_1').classList.remove("categories_selection_active");
			document.getElementById('set_2').classList.remove("categories_selection_active");
			document.getElementById('set_3').classList.remove("categories_selection_active");
			document.getElementById('set_4').classList.remove("categories_selection_active");

			reRenderCategories();
			break;
		}
	}
</script>
<%@include file="footer.jsp"%>