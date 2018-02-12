<div id="mobilestats_dash_div" class="school_home_div">
	<div class="row">
		<div class="col s12 m12 l12">
			<div class="row">
				<h4>Mobile App</h4>
			</div>
			<div class="col s12 m6 l6">
				<div class="row">
					<img width="30%" src="<%=request.getContextPath()%>/images/yuna.jpg"/>
					<img width="30%" src="<%=request.getContextPath()%>/images/yuna.jpg"/>
				</div>
				<div class="row">
					<div class="col s6 m4 l4">
						<span>Published Date: </span>
					</div>
					<div class="col s6 m8 l8">
						<span>12 January 2016</span>
					</div>
				</div>
				<div class="row">
					<div class="col s6 m4 l4">
						<span>Privacy Policy: </span>
					</div>
					<div class="col s6 m8 l8">
						<span>12 January 2016 - <a href="http://www.google.com" target="_blank">Click Here</a></span>
					</div>
				</div>
				<div class="row">
					<div class="col s6 m4 l4">
						<span>Website: </span>
					</div>
					<div class="col s6 m8 l8">
						<span><a href="http://system.toddlytic.com/toddlytic/home" target="_blank">Click Here</a></span>
					</div>
				</div>
			</div>
			<div class="col s12 m6 l6">
				<div class="row">
					<div class="col s6 m4 l4">
						<span>Mobile App: </span>
					</div>
					<div class="col s6 m8 l8">
						<span><a id="mobileAppEnableButton" class="btn" onclick="mobileAppEnable()">Enable</a></span>
					</div>
				</div>
				<div class="row">
					<div class="col s6 m4 l4">
						<span>Color: </span>
					</div>
					<div class="col s6 m8 l8">
						<span>White</span>
					</div>
				</div>
				<div class="row">
					<div class="col s6 m4 l4">
						<span>Share: </span>
					</div>
					<div class="col s6 m3 l3">
						<span><a href="mailto:someone@example.com?Subject=Toddlytic Is An Awesome Product" target="_top" class="waves-effect waves-teal btn categories_selection modal-trigger">
							<i class="material-icons left">share</i>Share WebApp</a></span>
					</div>
				</div>
				<div class="row">
					<div class="col s6 m4 l4">
						<span>Version: </span>
					</div>
					<div class="col s6 m8 l8">
						<span>1.0.0</span>
					</div>
				</div>
				<div class="row">
					<div class="col s6 m4 l4">
						<span>Author: </span>
					</div>
					<div class="col s6 m8 l8">
						<span>Kana Sabaratnam</span>
					</div>
				</div>
				<div class="row">
					<div class="col s6 m4 l4">
						<span>Status: </span>
					</div>
					<div class="col s6 m8 l8">
						<span>Activated</span>
					</div>
				</div>
				<div class="row">
					<div class="col s6 m4 l4">
						<span>Download: </span>
					</div>
					<div class="col s6 m4 l4">
						<span><i class="material-icons left">android</i><a href="http://system.toddlytic.com/toddlytic/home" target="_blank">iOS</a></span>
					</div>
					<div class="col s6 m4 l4">
						<span><i class="material-icons left">android</i><a href="http://system.toddlytic.com/toddlytic/home" target="_blank">Android</a></span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col s12 m6 l6">
			<div id="mobileAppStatsChartContainer"></div>
		</div>
		<div class="col s12 m6 l6">
			<div class="col s12 m12 l12">
				<span class="s12 m12 l12 activityLabel">Active Users</span>
			</div>
			<div class="col s12 m10 l10">
				<table>
			        <thead>
			          <tr>
			              <th data-field="id">Name</th>
			              <th data-field="name">Platform</th>
			              <th data-field="price">Cum. Mins</th>
			          </tr>
			        </thead>
			
			        <tbody>
			          <tr>
			            <td>Alvin</td>
			            <td>iOS</td>
			            <td>100</td>
			          </tr>
			          <tr>
			           	<td>Martin</td>
			            <td>Android</td>
			            <td>200</td>
			          </tr>
			          <tr>
			            <td>Thomas</td>
			            <td>Windows</td>
			            <td>50</td>
			          </tr>
			        </tbody>
			      </table>
			</div>
		</div>
	</div>
</div>