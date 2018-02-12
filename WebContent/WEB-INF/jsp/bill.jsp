<%@include file="header.jsp"%>
<%@include file="login_nav.jsp"%>
<main> <%@include file="school_main_menu.jsp"%>

<div class="row container_margin">
	<div class="col s12 m6 l3 left_column">
		<div class="row">
			<div class="col s12 m12 l12">
				<div class="row">
					<div class="input-field col s12">
						<i class="material-icons prefix">textsms</i> <input type="text" id="autocomplete-input"
							class="autocomplete"> <label for="autocomplete-input">Search Rate</label>
					</div>
					<div id="slider" style="height: 574px !important;">
						<div class="slider-content">
							<ul>
								<li id="a"><a name="a" class="title">A</a>
									<ul>
										<li><a href=""> <img src="<%=request.getContextPath()%>/images/yuna.jpg"
												width="40px" height="40px" class="circle li_student_img" /> Adam
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
	</div>
	<div class="col s12 m6 l9">
		<div class="row">
		<div class="col s12 m4 l4">[Selected Student Name]</div>
		<div class="col s12 m4 l4">
			<div>
				<select>
					<option value="" disabled>Select month</option>
					<option value="">August</option>
					<option value="">September</option>
				</select>
			</div>
		</div>
		</div>
		<div class="row">
			<div class="col s12 m12 l12">
				<table class="responsive-table striped highlight">
					<thead>
						<tr>
							<th data-field="name">Item Name</th>
							<th data-field="price">Unit Price</th>
							<th data-field="datetime">Quantity</th>
							<th data-field="period">Start Time</th>
							<th>End Time</th>
							<th>Discount (%)</th>
							<th>Discount (Amount)</th>
							<th data-field="completion">Rate</th>

						</tr>
					</thead>

					<tbody>
						<tr>
							<td>Baby Programme</td>
							<td>700</td>
							<td>1</td>
							<td>-</td>
							<td>-</td>
							<td>0</td>
							<td>0</td>
							<td>700</td>
						</tr>
						<tr>
							<td>Meal Plan</td>
							<td>150</td>
							<td>1</td>
							<td>-</td>
							<td>-</td>
							<td>0</td>
							<td>0</td>
							<td>150</td>
						</tr>
						<tr>
							<td>AdHoc DropOff (Weekday)</td>
							<td>30</td>
							<td>3</td>
							<td>-</td>
							<td>-</td>
							<td>10</td>
							<td>0</td>
							<td>81</td>
						</tr>
						<tr>
							<td colspan="7">Total Rate</td>
							<td>931</td>
						</tr>
						<tr>
							<td colspan="7">GST(6%)</td>
							<td>55.86</td>
						</tr>
						<tr>
							<td colspan="7">Total need to be Paid</td>
							<td>986.86</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<%-- <div class="col s12 m6 l3 right_column ">
		<div class="row">
			<div class="col s12 m12 l12">Recent Items</div>
		</div>
		<%@include file="recent_item.jsp"%>
	</div> --%>
</div>
<%@include file="modal.jsp"%> </main>
<%@include file="footer.jsp"%>