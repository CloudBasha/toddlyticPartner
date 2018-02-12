<%@include file="header.jsp"%>
<%@include file="login_nav.jsp"%>
<main> <%@include file="school_main_menu.jsp"%>
<div class="row container_margin">
	<div class="col s12 m4 l3 ">
		<div class="row">
			<div class="col s12 m12 l12">
				<div class="row">
					<div class="input-field col s12">
						<i class="material-icons prefix">textsms</i> <input type="text" id="autocomplete-input"
							class="autocomplete"> <label for="autocomplete-input">Search Program</label>
					</div>
				</div>
				<div class="" id="slider" style="height: 574px !important;">
					<div class="slider-content">
						<ul>
							<li id="a"><a name="a" class="title">A</a>
								<ul>
									<li><a href="javascript:void(0)" onclick="showContactDiv();"> <img
											src="<%=request.getContextPath()%>/images/yuna.jpg" width="40px" height="40px"
											class="circle li_student_img" /> Adam
									</a></li>
									<li><a href="/">Alex</a></li>
									<li><a href="/">Ali</a></li>
									<li><a href="/">Apple</a></li>
									<li><a href="/">Arthur</a></li>
									<li><a href="/">Ashley</a></li>
								</ul></li>
							<li id="b"><a name="b" class="title">B</a>
								<ul>
									<li><a href="/">Barry</a></li>
									<li><a href="/">Becky</a></li>
									<li><a href="/">Biff</a></li>
									<li><a href="/">Billy</a></li>
									<li><a href="/">Bozarking</a></li>
									<li><a href="/">Bryan</a></li>
								</ul></li>
							<li id="c"><a name="c" class="title">c</a>
								<ul>
									<li><a href="/">Calista</a></li>
									<li><a href="/">Cathy</a></li>
									<li><a href="/">Chris</a></li>
									<li><a href="/">Cinderella</a></li>
									<li><a href="/">Corky</a></li>
									<li><a href="/">Cypher</a></li>
								</ul></li>
							<li id="d"><a name="d" class="title">d</a>
								<ul>
									<li><a href="/">damien</a></li>
									<li><a href="/">danny</a></li>
									<li><a href="/">denver</a></li>
									<li><a href="/">devon</a></li>
									<li><a href="/">doug</a></li>
									<li><a href="/">dustin</a></li>
								</ul></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="col s12 m8 l9">
		<div class="row">
			<div class="col s12 l12">
				<div>
					<ul class="topnav" id="myTopnav">
						<li><a class="Lato_normal_font" href="#meal">Meal</a></li>
						<li><a class="Lato_normal_font" href="#health_check">Health Check</a></li>
						<li><a class="Lato_normal_font" href="#milk">Milk</a></li>
						<li class="icon"><a href="javascript:void(0);" onclick="myFunction()"> <img
								src="<%=request.getContextPath()%>/images/menu_icon.png" height="30" width="30" />
						</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="row" id="meal">
			<div class="row">
				<div class="col s9 m10 l10">
					<p class="Lato_bold_font">Meals</p>
				</div>
				<div class="col s3 m2 l2 center">
					<a class="modal-trigger" href="#meal_record"><img class="tooltipped"
						src="<%=request.getContextPath()%>/images/add.png" width="35px" height="35px"
						data-position="bottom" data-delay="50" data-tooltip="Add Meal Record" /></a>
				</div>
			</div>
			<div class="row">
				<div class="col s12 m12 l12"></div>
				<table class="responsive-table">
					<thead>
						<tr>
							<th data-field="price">Type</th>
							<th data-field="datetime">DateTime</th>
							<th data-field="completion">Completion</th>
							<th>Action</th>
						</tr>
					</thead>

					<tbody>
						<tr>
							<td>Breakfast</td>
							<td>09.00am</td>
							<td>Finish</td>
							<td><a href=""><img class="tooltipped" src="<%=request.getContextPath()%>/images/edit.png" width="25px" height="25px" data-position="left" data-delay="50" data-tooltip="Edit"/></a>
								<a href=""><img class="tooltipped" src="<%=request.getContextPath()%>/images/delete.png" width="25px" height="25px" data-position="right" data-delay="50" data-tooltip="Delete"/></a></td>

						</tr>
						<tr>
							<td>Lunch</td>
							<td>12.15pm</td>
							<td>Half</td>
							<td><img src="<%=request.getContextPath()%>/images/edit.png" width="25px" height="25px" />
								<img src="<%=request.getContextPath()%>/images/delete.png" width="25px" height="25px" /></td>
						</tr>
						<tr>
							<td>Snack</td>
							<td>03.00pm</td>
							<td>Finish</td>
							<td><img src="<%=request.getContextPath()%>/images/edit.png" width="25px" height="25px" />
								<img src="<%=request.getContextPath()%>/images/delete.png" width="25px" height="25px" /></td>
						</tr>
					</tbody>
				</table>
			</div>

		</div>
		<div class="row" id="health_check">
			<div class="row">
				<div class="col s9 m10 l10">
					<p class="Lato_bold_font">Health Check</p>
				</div>
				<div class="col s3 m2 l2 center">
					<a class="modal-trigger" href="#health_record"><img class="tooltipped"
						src="<%=request.getContextPath()%>/images/add.png" width="35px" height="35px"
						data-position="bottom" data-delay="50" data-tooltip="Add Health Record" /></a>
				</div>
			</div>
			<div class="row">
				<div class="col s12 m12 l12">
					<table class="responsive-table">
						<thead>
							<tr>
								<th data-field="price">Fever(Temp)</th>
								<th data-field="datetime">Rashes</th>
								<th data-field="completion">Mouth Ulcer</th>
								<th>B.E.S.B</th>
								<th>D.Saliva</th>
								<th>Red &amp; Watery Eyes</th>
								<th>Cough</th>
								<th>Runny nose</th>
								<th>Virus</th>
								<th>Time</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>35.3</td>
								<td>-</td>
								<td>-</td>
								<td>-</td>
								<td>-</td>
								<td>-</td>
								<td>-</td>
								<td>-</td>
								<td>-</td>
								<td>6/9/2016 1.35pm</td>
								<td><img src="<%=request.getContextPath()%>/images/edit.png" width="25px" height="25px" />
								<img src="<%=request.getContextPath()%>/images/delete.png" width="25px" height="25px" /></td>
							</tr>
							<tr>
								<td>35.3</td>
								<td>-</td>
								<td>-</td>
								<td>-</td>
								<td>-</td>
								<td>Yes</td>
								<td>Yes</td>
								<td>-</td>
								<td>-</td>
								<td>6/9/2016 12.40pm</td>
								<td><img src="<%=request.getContextPath()%>/images/edit.png" width="25px" height="25px" />
								<img src="<%=request.getContextPath()%>/images/delete.png" width="25px" height="25px" /></td>
							</tr>
							<tr>
								<td>35.3</td>
								<td>-</td>
								<td>-</td>
								<td>-</td>
								<td>-</td>
								<td>-</td>
								<td>-</td>
								<td>-</td>
								<td>-</td>
								<td>6/9/2016 10.05am</td>
								<td><img src="<%=request.getContextPath()%>/images/edit.png" width="25px" height="25px" />
								<img src="<%=request.getContextPath()%>/images/delete.png" width="25px" height="25px" /></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="row" id="milk">
			<div class="row">
				<div class="col s12 m6 l10">
					<p class="Lato_bold_font">Milk</p>
				</div>
				<div class="col s12 m4 l2 center">
					<img class="tooltipped" src="<%=request.getContextPath()%>/images/add.png" width="35px"
						height="35px" data-position="bottom" data-delay="50" data-tooltip="Add Health Record" />
				</div>
			</div>
			<div class="row">
				<div class="col s12 m12 l12">
					<table class="responsive-table">
						<thead>
							<tr>
								<th data-field="price">Time</th>
								<th data-field="datetime">Unit</th>
								<th data-field="completion">Time</th>
								<th>Unit</th>
								<th>Time</th>
								<th>Unit</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>6/9/2016 10.35am</td>
								<td>3 ounces</td>
								<td>6/9/2016 12.40pm</td>
								<td>5 ounces</td>
								<td>6/9/2016 3.05pm</td>
								<td>2 ounces</td>
								<td><img src="<%=request.getContextPath()%>/images/edit.png" width="25px" height="25px" />
								<img src="<%=request.getContextPath()%>/images/delete.png" width="25px" height="25px" /></td>
							</tr>
							<tr>
								<td>6/9/2016 10.35am</td>
								<td>3 ounces</td>
								<td>6/9/2016 12.40pm</td>
								<td>5 ounces</td>
								<td>6/9/2016 3.05pm</td>
								<td>2 ounces</td>
								<td><img src="<%=request.getContextPath()%>/images/edit.png" width="25px" height="25px" />
								<img src="<%=request.getContextPath()%>/images/delete.png" width="25px" height="25px" /></td>
							</tr>
							<tr>
								<td>6/9/2016 10.35am</td>
								<td>3 ounces</td>
								<td>6/9/2016 12.40pm</td>
								<td>5 ounces</td>
								<td>6/9/2016 3.05pm</td>
								<td>2 ounces</td>
								<td><img src="<%=request.getContextPath()%>/images/edit.png" width="25px" height="25px" />
								<img src="<%=request.getContextPath()%>/images/delete.png" width="25px" height="25px" /></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<%-- <div class="col s12 m6 l2 right_column ">
		<div class="row">
			<div class="col s12 m12 l12">Recent Items</div>
		</div>
		<%@include file="recent_item.jsp"%>
	</div> --%>
	</div>
	<%@include file="modal.jsp"%>
</main>
<%@include file="footer.jsp"%>