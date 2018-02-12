<%@include file="header.jsp"%>
<%@include file="login_nav.jsp"%>
<script type="text/javascript">
	document.getElementById("login_title_logo").src = "<%=request.getContextPath()%>/images/pre_school_logo.jpg";
</script>
<main>
<div style="margin-top: 30px;">
	<div class="row">

		<!-- Left Column Div -->
		<!-- <div class="col s12 m4 l2 left_column"> -->
		<div class="col s12 m4 l2">
			<!-- <div class="row">
				<div class="col s12 m12 l12">
					<div class="row">
						<div class="input-field col s12">
							<i class="material-icons prefix">textsms</i>
							<input type="text" id="autocomplete-input" class="autocomplete">
							<label for="autocomplete-input">Search Student</label>
						</div>
					</div>
				</div>
			</div>
			<div id="slider" style="height: 574px !important;">
				<div class="slider-content">
					<ul>
						<li id="a">
							<a name="a" class="title">A</a>
							<ul>
								<li>
									<a href="/">Adam</a>
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
			</div> -->
		</div>

		<!-- Mid Column Div -->
		<div class="col s12 m6 l6">
			<div class="row">
				<div class="col s12 m12 l1"></div>
				<div class="col s12 m12 l10">
					<div class="row">
						<p class="Lato_bold_font">Today's Event</p>
					</div>
					<div class="row">
						<div class="col s12 m6 l6">
							<div class="card">
								<div class="card-image">
									<img src="<%=request.getContextPath()%>/images/birthday1.jpg">
									<span class="card-title black-text">John's Birthday Party</span>
								</div>
								<div class="card-content">
									<p>John's Birthday Party Lorem Ipsum</p>
								</div>
								<div class="card-action">
									<a href="#">Event Info</a>
								</div>
							</div>
						</div>
						<div class="col s12 m7 l6">
							<div class="card">
								<div class="card-image">
									<img src="<%=request.getContextPath()%>/images/snack_day.jpg">
									<span class="card-title black-text">Snack's Day</span>
								</div>
								<div class="card-content">
									<p>Snack's Day Lorem Ipsum</p>
								</div>
								<div class="card-action">
									<a href="#">Event Info</a>
								</div>
							</div>
						</div>
					</div>
					
					<div class="row">
						<p class="Lato_bold_font">Upcoming Events</p>
					</div>
					<div class="row">
						<div class="col s12 m6 l6">
							<div class="card">
								<div class="card-image">
									<img src="<%=request.getContextPath()%>/images/swim.jpg">
									<span class="card-title black-text">Swimming Activity</span>
								</div>
								<div class="card-content">
									<p>Swimming Lorem Ipsum</p>
								</div>
								<div class="card-action">
									<a href="#">Event Info</a>
								</div>
							</div>
						</div>
						<%-- <div class="col s12 m6 l6">
							<div class="card">
								<div class="card-image">
									<img src="<%=request.getContextPath()%>/images/snack_day.jpg">
									<span class="card-title black-text">Snack's Day</span>
								</div>
								<div class="card-content">
									<p>Snack's Day Lorem Ipsum</p>
								</div>
								<div class="card-action">
									<a href="#">Event Info</a>
								</div>
							</div>
						</div> --%>
					</div>
					<div class="row" style="border-bottom: 1px #bdbdbd solid;"></div>
					<div class="row">
						<p class="Lato_bold_font">School Stats</p>
						<div class="col s12 m12 l12">
							<div id="chart_div"></div>
						</div>
					</div>
				</div>
				<div class="col l1"></div>
			</div>
		</div>

		<%-- <div class="col s12 m4 l2 right_column">
			<div class="row">
				<div class="col s12 m12 l12">Recent Items</div>
			</div>
			<%@include file="recent_item.jsp"%> --%>
		</div>
	</div>

	<%@include file="shortcut_div.jsp"%>
</div>
</main>
<%@include file="footer.jsp"%>