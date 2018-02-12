<%@include file="header.jsp"%>
<%@include file="login_nav.jsp"%>
<main> <%@include file="school_setting_menu.jsp"%>
<div class="row container_margin">
	<div class="col s12 m6 l2 left_column">
		<div class="row">
			<div class="col s12 m12 l12">
				<div class="row">
					<div class="input-field col s12">
						<i class="material-icons prefix">textsms</i>
						<input type="text" id="autocomplete-input" class="autocomplete">
						<label for="autocomplete-input">Search Staff</label>
					</div>
				</div>
			</div>
			<div class="" id="slider" style="height: 574px !important;">
				<div class="slider-content">
					<ul>
						<li id="a">
							<a name="a" class="title">A</a>
							<ul>
								<li>
									<a href="">
										<img src="<%=request.getContextPath()%>/images/yuna.jpg" width="40px" height="40px" class="circle li_student_img" />
										Adam
									</a>
								</li>
								<li>
									<a href="/">Alex</a>
								</li>
								<li>
									<a href="/">Ali</a>
								</li>
								<li>
									<a href="/">Apple</a>
								</li>
								<li>
									<a href="/">Arthur</a>
								</li>
								<li>
									<a href="/">Ashley</a>
								</li>
							</ul>
						</li>
						<li id="b">
							<a name="b" class="title">B</a>
							<ul>
								<li>
									<a href="/">Barry</a>
								</li>
								<li>
									<a href="/">Becky</a>
								</li>
								<li>
									<a href="/">Biff</a>
								</li>
								<li>
									<a href="/">Billy</a>
								</li>
								<li>
									<a href="/">Bozarking</a>
								</li>
								<li>
									<a href="/">Bryan</a>
								</li>
							</ul>
						</li>
						<li id="c">
							<a name="c" class="title">c</a>
							<ul>
								<li>
									<a href="/">Calista</a>
								</li>
								<li>
									<a href="/">Cathy</a>
								</li>
								<li>
									<a href="/">Chris</a>
								</li>
								<li>
									<a href="/">Cinderella</a>
								</li>
								<li>
									<a href="/">Corky</a>
								</li>
								<li>
									<a href="/">Cypher</a>
								</li>
							</ul>
						</li>
						<li id="d">
							<a name="d" class="title">d</a>
							<ul>
								<li>
									<a href="/">damien</a>
								</li>
								<li>
									<a href="/">danny</a>
								</li>
								<li>
									<a href="/">denver</a>
								</li>
								<li>
									<a href="/">devon</a>
								</li>
								<li>
									<a href="/">doug</a>
								</li>
								<li>
									<a href="/">dustin</a>
								</li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="col s12 m6 l8">
		<%-- <table class="responsive-table">
			<thead>
				<tr>
					<th>Staff Name</th>
					<th>Role</th>
					<th>Create School</th>
					<th>Read School</th>
					<th>Edit School</th>
					<th>Delete School</th>
					<th>Create Student</th>
					<th>Read Student</th>
					<th>Edit Student</th>
					<th>Delete Student</th>
					<th>Create Contact</th>
					<th>Read Contact</th>
					<th>Edit Contact</th>
					<th>Delete Contact</th>
					<th>Action</th>
				</tr>
			</thead>

			<tbody>
				<tr>
					<td>Alvin</td>
					<td>Teacher</td>
					<td class="center">
						<input type="checkbox" class="filled-in" id="fi1" disabled />
						<label for="fi1"></label>
					</td>
					<td class="center">
						<input type="checkbox" class="filled-in" id="fi2" disabled />
						<label for="fi2"></label>
					</td>
					<td class="center">
						<input type="checkbox" class="filled-in" id="fi3" disabled />
						<label for="fi3"></label>
					</td>
					<td class="center">
						<input type="checkbox" class="filled-in" id="fi4" disabled />
						<label for="fi4"></label>
					</td>
					<td class="center">
						<input type="checkbox" class="filled-in" id="fi5" checked="checked" disabled />
						<label for="fi5"></label>
					</td>
					<td class="center">
						<input type="checkbox" class="filled-in" id="fi6" checked="checked" disabled />
						<label for="fi6"></label>
					</td>
					<td class="center">
						<input type="checkbox" class="filled-in" id="fi7" checked="checked" disabled />
						<label for="fi7"></label>
					</td>
					<td class="center">
						<input type="checkbox" class="filled-in" id="fi8" checked="checked" disabled />
						<label for="fi8"></label>
					</td>
					<td class="center">
						<input type="checkbox" class="filled-in" id="fi9" checked="checked" disabled />
						<label for="fi9"></label>
					</td>
					<td class="center">
						<input type="checkbox" class="filled-in" id="fi10" checked="checked" disabled />
						<label for="fi10"></label>
					</td>
					<td class="center">
						<input type="checkbox" class="filled-in" id="fi11" checked="checked" disabled />
						<label for="fi11"></label>
					</td>
					<td class="center">
						<input type="checkbox" class="filled-in" id="fi12" checked="checked" disabled />
						<label for="fi12"></label>
					</td>
					<td class="center">
						<a class="modal-trigger" href="#edit_permission">
							<img src="<%=request.getContextPath()%>/images/view_report.png" width="30px" height="30px" />
						</a>
					</td>
				</tr>
				<tr>
					<td>Greg</td>
					<td>Admin</td>
					<td class="center">
						<input type="checkbox" class="filled-in" id="fi1" checked="checked" disabled />
						<label for="fi1"></label>
					</td>
					<td class="center">
						<input type="checkbox" class="filled-in" id="fi2" checked="checked" disabled />
						<label for="fi2"></label>
					</td>
					<td class="center">
						<input type="checkbox" class="filled-in" id="fi3" checked="checked" disabled />
						<label for="fi3"></label>
					</td>
					<td class="center">
						<input type="checkbox" class="filled-in" id="fi4" checked="checked" disabled />
						<label for="fi4"></label>
					</td>
					<td class="center">
						<input type="checkbox" class="filled-in" id="fi5" checked="checked" disabled />
						<label for="fi5"></label>
					</td>
					<td class="center">
						<input type="checkbox" class="filled-in" id="fi6" checked="checked" disabled />
						<label for="fi6"></label>
					</td>
					<td class="center">
						<input type="checkbox" class="filled-in" id="fi7" checked="checked" disabled />
						<label for="fi7"></label>
					</td>
					<td class="center">
						<input type="checkbox" class="filled-in" id="fi8" checked="checked" disabled />
						<label for="fi8"></label>
					</td>
					<td class="center">
						<input type="checkbox" class="filled-in" id="fi9" checked="checked" disabled />
						<label for="fi9"></label>
					</td>
					<td class="center">
						<input type="checkbox" class="filled-in" id="fi10" checked="checked" disabled />
						<label for="fi10"></label>
					</td>
					<td class="center">
						<input type="checkbox" class="filled-in" id="fi11" checked="checked" disabled />
						<label for="fi11"></label>
					</td>
					<td class="center">
						<input type="checkbox" class="filled-in" id="fi12" checked="checked" disabled />
						<label for="fi12"></label>
					</td>
					<td class="center">
						<a href="">
							<img src="<%=request.getContextPath()%>/images/view_report.png" width="30px" height="30px" />
						</a>
					</td>
				</tr>
			</tbody>
		</table> --%>
		<div class="row">
			<div class="col s12 m12 l1"></div>
			<div class="col s12 m12 l10">

				<h4>Adam</h4>
				<br />
				<p>School Permissions</p>
				<table class="responsive-table">
					<thead>
						<tr>
							<th>Create School</th>
							<th>Read School</th>
							<th>Edit School</th>
							<th>Delete School</th>
						</tr>
					</thead>

					<tbody>
						<tr>
							<td class="center">
								<input type="checkbox" class="filled-in" id="fi1" />
								<label for="fi1"></label>
							</td>
							<td class="center">
								<input type="checkbox" class="filled-in" id="fi2" />
								<label for="fi2"></label>
							</td>
							<td class="center">
								<input type="checkbox" class="filled-in" id="fi3" />
								<label for="fi3"></label>
							</td>
							<td class="center">
								<input type="checkbox" class="filled-in" id="fi4" />
								<label for="fi4"></label>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="col s12 m12 l1"></div>
		</div>
		<div class="row">
			<div class="col s12 m12 l1"></div>
			<div class="col s12 m12 l10">
				<p>Contact Permissions</p>
				<table class="responsive-table">
					<thead>
						<tr>
							<th>Create Contact</th>
							<th>Read Contact</th>
							<th>Edit Contact</th>
							<th>Delete Contact</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="center">
								<input type="checkbox" class="filled-in" id="fi5" checked="checked" />
								<label for="fi5"></label>
							</td>
							<td class="center">
								<input type="checkbox" class="filled-in" id="fi6" checked="checked" />
								<label for="fi6"></label>
							</td>
							<td class="center">
								<input type="checkbox" class="filled-in" id="fi7" checked="checked" />
								<label for="fi7"></label>
							</td>
							<td class="center">
								<input type="checkbox" class="filled-in" id="fi8" checked="checked" />
								<label for="fi8"></label>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="col s12 m12 l1"></div>
		</div>
		<div class="row">
			<div class="col s12 m12 l1"></div>
			<div class="col s12 m12 l10">
				<p>School Programme Permissions</p>
				<table class="responsive-table">
					<thead>
						<tr>
							<th>Create School Programme</th>
							<th>Read School Programme</th>
							<th>Edit School Programme</th>
							<th>Delete School Programme</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="center">
								<input type="checkbox" class="filled-in" id="fi9" checked="checked" />
								<label for="fi9"></label>
							</td>
							<td class="center">
								<input type="checkbox" class="filled-in" id="fi10" checked="checked" />
								<label for="fi10"></label>
							</td>
							<td class="center">
								<input type="checkbox" class="filled-in" id="fi11" checked="checked" />
								<label for="fi11"></label>
							</td>
							<td class="center">
								<input type="checkbox" class="filled-in" id="fi12" checked="checked" />
								<label for="fi12"></label>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<div class="col s12 m6 l2 right_column ">
		<div class="row">
			<div class="col s12 m12 l12">Recent Items</div>
		</div>
		<%@include file="recent_item.jsp"%>
	</div>
</div>
</main>
<%@include file="footer.jsp"%>