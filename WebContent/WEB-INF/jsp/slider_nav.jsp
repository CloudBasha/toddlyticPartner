<div class="" id="studentContactsSlider" style="height: 574px !important;">
	<div class="slider-content">
		<ul id="studentContacts-slider_ul">
			<li ng-if="studentAllLetters[letter] != undefined" ng-repeat="letter in alphabet" id="{{letter}}"><a name="{{letter}}" class="title">{{letter}}</a>
				<ul>
					<li ng-repeat="student in studentAllLetters[letter]"><a ng-click="selectStudent(student)"> <img
							src="<%=request.getContextPath()%>/images/yuna.jpg" width="40px" height="40px"
							class="circle li_student_img" />{{student.name}}
					</a></li>
				</ul>
			</li>
		</ul>
	</div>
</div>

<div class="" id="parentContactsSlider" style="height: 574px !important;">
	<div class="slider-content">
		<ul id="parentContacts-slider_ul">
			<li ng-if="parentAllLetters[letter] != undefined" ng-repeat="letter in alphabet" id="{{letter}}"><a name="{{letter}}" class="title">{{letter}}</a>
				<ul>
					<li ng-repeat="parent in parentAllLetters[letter]"><a ng-click="selectParent(parent)"> <img
							src="<%=request.getContextPath()%>/images/yuna.jpg" width="40px" height="40px"
							class="circle li_student_img" />{{parent.name}}
					</a></li>
				</ul>
			</li>
		</ul>
	</div>
</div>

<div class="" id="staffContactsSlider" style="height: 574px !important;">
	<div class="slider-content">
		<ul id="staffContacts-slider_ul">
			<%-- <li id="a"><a name="a" class="title">A</a>
				<ul>
					<li><a href="javascript:void(0)" onclick=""> <img
							src="<%=request.getContextPath()%>/images/yuna.jpg" width="40px" height="40px"
							class="circle li_student_img" /> John Smith
					</a></li>
				</ul></li> --%>

		</ul>
	</div>
</div>

<div class="" id="otherContactsSlider" style="height: 574px !important;">
	<div class="slider-content">
		<ul id="otherContacts-slider_ul">
			<%-- <li id="a"><a name="a" class="title">A</a>
				<ul>
					<li><a href="javascript:void(0)" onclick=""> <img
							src="<%=request.getContextPath()%>/images/yuna.jpg" width="40px" height="40px"
							class="circle li_student_img" /> John Smith
					</a></li>
				</ul></li> --%>

		</ul>
	</div>
</div>