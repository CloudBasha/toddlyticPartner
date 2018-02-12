<%@include file="header.jsp"%>
<%@include file="login_nav.jsp"%>
<main>

<div class="row ng-cloak" ng-controller="peopleController">
	<div class="col s12 m3 l3 left_column">
		<div class="row">
			<div class="col s12 m12 l12">
				<div class="row">
					<div class="input-field col s12">
						<i class="material-icons prefix searchPeopleIcon">textsms</i> <input type="text" id="autocomplete-input"
							class="autocomplete searchPeopleInput"> <label class="searchPeopleInputLabel" ng-click="test()" for="autocomplete-input" id="searchPeopleInputLabel">Search Students</label>
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col s12 m12 l12">
				<%@include file="slider_nav.jsp"%>
			</div>
		</div>
	</div>

	<div class="col s12 m9 l9">
		<div class="row">
			<div class="col s12 tabsHolderDiv">
				<ul class="tabs">
					<li class="tab col s3"><a class="active" href="#studentTab">Students</a></li>
					<li class="tab col s3"><a href="#parentTab">Parents</a></li>
					<li class="tab col s3"><a href="#staffTab">Staff</a></li>
					<li class="tab col s3"><a href="#othersTab">Others</a></li>
				</ul>
			</div>
			<%@include file="listPeople/studentTab.jsp"%>
			<%@include file="listPeople/parentTab.jsp"%>
			<%@include file="listPeople/staffTab.jsp"%>
			<%@include file="listPeople/othersTab.jsp"%>
		</div>
	</div>

</div>

</main>
<%@include file="footer.jsp"%>