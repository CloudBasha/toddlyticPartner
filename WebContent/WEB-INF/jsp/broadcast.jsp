<%@include file="header.jsp" %>
<%@include file="login_nav.jsp" %>
<main>
<div class="row">
	<div class="col s12 m2 l2 left_column">
		<div class="row">
			<div class="s12 m12 l12 input-field">
				<input id="searchInput" type="text" class="validate" />
				<label for="searchInput">Search</label>
			</div>
		</div>
		
		<div class="row">
			<div class="s12 m12 l12">
				<a class="categories_selection waves-effect waves-teal btn-flat" onclick="swSchDiv(0);">Announcements</a>
				<a class="categories_selection waves-effect waves-teal btn-flat" onclick="swSchDiv(1);">Newsletters</a>
				<a class="categories_selection waves-effect waves-teal btn-flat" onclick="swSchDiv(2);">Photos</a>
				<a class="categories_selection waves-effect waves-teal btn-flat" onclick="swSchDiv(3);">Messages</a>
				<a class="categories_selection waves-effect waves-teal btn-flat" onclick="swSchDiv(4);">Web Stat</a>
				<a class="categories_selection waves-effect waves-teal btn-flat" onclick="swSchDiv(5);">Mobile</a>
			</div>
		</div>
		
	</div>
	<div id="broadcast_home_div" class="col s12 m10 l10">
		<div class="row">
			<div class="col s12 m9 l9">
				 <ul class="collapsible" data-collapsible="accordion">
				    <li>
				      <div class="collapsible-header active"><i class="material-icons">filter_drama</i>School 1</div>
				      <div class="collapsible-body broadcastAccordionDiv">
				      	<div class="row">
					      	<div class="col s12 m6">	
						      	<div id="broadcastChartContainer1"></div>
	       					</div>
	       					<div class="col s12 m6">	
						      	<div class="row">
						      		<span class="activityLabel">Newsletter</span>
						      	</div>
						      	<div class="row">
						      		<div class="col s4">
							      		<div class="col s12">
							      			<img style="width:100px;height:150px;" src="https://www.cigital.com/wp-content/uploads/2016/01/newsletter-january-2016-1.png"></img>
							      		</div>
							      		<div style="text-align:center" class="col s12">
							      			<span>November</span>
							      		</div>
							      	</div>
						      		<div class="col s4">
							      		<div class="col s12">
							      			<img style="width:100px;height:150px;" src="https://www.ecology.co.uk/img/news/newsletter46.jpg"></img>
							      		</div>
							      		<div style="text-align:center" class="col s12">
							      			<span>October</span>
							      		</div>
							      	</div>
							      	<div class="col s4">
							      		<div class="col s12">
							      			<img style="width:100px;height:150px;" src="http://www.wordmstemplates.com/wp-content/uploads/2015/06/newsletter-template-11.jpg"></img>
							      		</div>
							      		<div style="text-align:center" class="col s12">
							      			<span>September</span>
							      		</div>
							      	</div>
						      	</div>
	       					</div>
       					</div>
       					<div class="row">
						  	<div class="parentTableDiv col s12">
							  	<h5 class="black-text">Photos</h5>
								<div class="carousel studentPhotoCarousel">
								  <a class="carousel-item" href="#one!"><img src="http://lorempixel.com/400/200/food/1"></a>
								  <a class="carousel-item" href="#two!"><img src="http://lorempixel.com/400/200/food/2"></a>
								  <a class="carousel-item" href="#three!"><img src="http://lorempixel.com/400/200/food/3"></a>
								  <a class="carousel-item" href="#four!"><img src="http://lorempixel.com/400/200/food/4"></a>
								</div>
							</div>
						</div>
						<div class="row">
					      	<div class="col s12 m6">	
						      	<div id="mobUsageChartContainer1"></div>
	       					</div>
	       					<div class="col s12 m6">	
						      	<div id="webUsageChartContainer1"></div>
	       					</div>
	       				</div>
  					  </div>
				    </li>
				    <li>
				      <div class="collapsible-header"><i class="material-icons">place</i>School 2</div>
				      <div class="collapsible-body broadcastAccordionDiv">
				      		<div class="row">
					      	<div class="col s12 m6">	
						      	<div id="broadcastChartContainer2"></div>
	       					</div>
	       					<div class="col s12 m6">	
						      	<div class="row">
						      		<span class="activityLabel">Newsletter</span>
						      	</div>
						      	<div class="row">
						      		<div class="col s4">
							      		<div class="col s12">
							      			<img style="width:100px;height:150px;" src="https://www.cigital.com/wp-content/uploads/2016/01/newsletter-january-2016-1.png"></img>
							      		</div>
							      		<div style="text-align:center" class="col s12">
							      			<span>November</span>
							      		</div>
							      	</div>
						      		<div class="col s4">
							      		<div class="col s12">
							      			<img style="width:100px;height:150px;" src="https://www.ecology.co.uk/img/news/newsletter46.jpg"></img>
							      		</div>
							      		<div style="text-align:center" class="col s12">
							      			<span>October</span>
							      		</div>
							      	</div>
							      	<div class="col s4">
							      		<div class="col s12">
							      			<img style="width:100px;height:150px;" src="http://www.wordmstemplates.com/wp-content/uploads/2015/06/newsletter-template-11.jpg"></img>
							      		</div>
							      		<div style="text-align:center" class="col s12">
							      			<span>September</span>
							      		</div>
							      	</div>
						      	</div>
	       					</div>
       					</div>
       					<div class="row">
						  	<div class="parentTableDiv col s12">
							  	<h5 class="black-text">Photos</h5>
								<div class="carousel studentPhotoCarousel">
								  <a class="carousel-item" href="#one!"><img src="http://lorempixel.com/400/200/food/1"></a>
								  <a class="carousel-item" href="#two!"><img src="http://lorempixel.com/400/200/food/2"></a>
								  <a class="carousel-item" href="#three!"><img src="http://lorempixel.com/400/200/food/3"></a>
								  <a class="carousel-item" href="#four!"><img src="http://lorempixel.com/400/200/food/4"></a>
								</div>
							</div>
						</div>
						<div class="row">
					      	<div class="col s12 m6">	
						      	<div id="mobUsageChartContainer2"></div>
	       					</div>
	       					<div class="col s12 m6">	
						      	<div id="webUsageChartContainer2"></div>
	       					</div>
	       				</div>
   					   </div>
				    </li>
				    <li>
				      <div class="collapsible-header"><i class="material-icons">whatshot</i>School 3</div>
				      <div class="collapsible-body broadcastAccordionDiv">
				      		<div class="row">
						      	<div class="col s12 m6">	
							      	<div id="broadcastChartContainer3"></div>
		       					</div>
		       					<div class="col s12 m6">	
							      	<div class="row">
							      		<span class="activityLabel">Newsletter</span>
							      	</div>
							      	<div class="row">
							      		<div class="col s4">
								      		<div class="col s12">
								      			<img style="width:100px;height:150px;" src="https://www.cigital.com/wp-content/uploads/2016/01/newsletter-january-2016-1.png"></img>
								      		</div>
								      		<div style="text-align:center" class="col s12">
								      			<span>November</span>
								      		</div>
								      	</div>
							      		<div class="col s4">
								      		<div class="col s12">
								      			<img style="width:100px;height:150px;" src="https://www.ecology.co.uk/img/news/newsletter46.jpg"></img>
								      		</div>
								      		<div style="text-align:center" class="col s12">
								      			<span>October</span>
								      		</div>
								      	</div>
								      	<div class="col s4">
								      		<div class="col s12">
								      			<img style="width:100px;height:150px;" src="http://www.wordmstemplates.com/wp-content/uploads/2015/06/newsletter-template-11.jpg"></img>
								      		</div>
								      		<div style="text-align:center" class="col s12">
								      			<span>September</span>
								      		</div>
								      	</div>
							      	</div>
		       					</div>
	       					</div>
	       					<div class="row">
							  	<div class="parentTableDiv col s12">
								  	<h5 class="black-text">Photos</h5>
									<div class="carousel studentPhotoCarousel">
									  <a class="carousel-item" href="#one!"><img src="http://lorempixel.com/400/200/food/1"></a>
									  <a class="carousel-item" href="#two!"><img src="http://lorempixel.com/400/200/food/2"></a>
									  <a class="carousel-item" href="#three!"><img src="http://lorempixel.com/400/200/food/3"></a>
									  <a class="carousel-item" href="#four!"><img src="http://lorempixel.com/400/200/food/4"></a>
									</div>
								</div>
							</div>
							<div class="row">
						      	<div class="col s12 m6">	
							      	<div id="mobUsageChartContainer3"></div>
		       					</div>
		       					<div class="col s12 m6">	
							      	<div id="webUsageChartContainer3"></div>
		       					</div>
		       				</div>
   					   </div>
				    </li>
				  </ul>
			</div>
			<div class="col s12 m3 l3">
				<div class="row sc_prog_right_options">
					<div class="col s12 m12 l12">
						<a href="#addAnnouncementModal" class="waves-effect waves-teal btn categories_selection modal-trigger">
							<i class="material-icons left">add</i>Announcement
						</a>
					</div>
				</div>
				<div class="row">
					<div class="col s12 m12 l12">
						<a href="#"
							class="waves-effect waves-teal btn categories_selection modal-trigger"><i
							class="material-icons left">add</i>Newsletter</a>
					</div>
				</div>
				<div class="row ">
					<div class="col s12 m12 l12">
						<a href="#reqPurchasingModal"
							class="waves-effect waves-teal btn categories_selection modal-trigger"><i
							class="material-icons left">add</i>Photo</a>
					</div>
				</div>
				<div class="row ">
					<div class="col s12 m12 l12">
						<a href="#schoolHolidayModal"
							class="waves-effect waves-teal btn categories_selection modal-trigger"><i
							class="material-icons left">add</i>Push Notification</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="col s12 m10 l10">
		<%@include file="broadcast/newsletter_dashboard.jsp"%>
		<%@include file="broadcast/photo_dashboard.jsp"%>
		<%@include file="broadcast/messages_dashboard.jsp"%>
		<%@include file="broadcast/webstats_dashboard.jsp"%>
		<%@include file="broadcast/mobilestats_dashboard.jsp"%>
	</div>
</div>

<div id="addAnnouncementModal" class="modal">
   	<div class="modal-content">
	     <h4>Create Announcement/Email</h4>
	     <div class="row">
		     <div class="input-field col s12">
			     <select multiple>
			      <option value="" disabled>Choose your option</option>
			      <option value="1">All Parents</option>
			      <option value="2">All Teachers</option>
			      <option value="3">Infant Program Parents</option>
			      <option value="4">Toddler Program Parents</option>
			      <option value="5">Day Care Program Parents</option>
			      <option value="6">Play School Program Parents</option>
			      <option value="7">Pre School Program Parents</option>
			      <option value="8">All</option>
			    </select>
			     <label for="name">To</label>
		     </div>
	     </div>
	     <div class="row">
		     <div class="input-field col s12">
			     <select>
			      <option value="" disabled>Choose your option</option>
			      <option value="1">Template 1</option>
			      <option value="2">Template 2</option>
			      <option value="3">Template 3</option>
			      <option value="4">Template 4</option>
			      <option value="5">Template 5</option>
			    </select>
			     <label for="name">Choose Template</label>
		     </div>
	     </div>
	     <div class="row">
		     <img style="width: 100%;height: 400px;" src="http://i0.wp.com/www.wordstemplates.org/wp-content/uploads/2012/09/Announcement-letter-template.jpg"></img>
	     </div>
	     <div class="row">
			<input type="checkbox" id="test5" />
			<label class="black-text" for="test5">Save as Template</label>
		 </div>
		 <div class="row">
			<div style="padding:0;" class="input-field col s12">
	          <input placeholder="Template Name" id="template_name" type="text" class="validate">
	          <label style="left: 0;" class="activityLabel" for="template_name">Template Name</label>
	        </div>
		 </div>
		<div class="modal-footer">
			<a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat ">Cancel</a>
		   	<a class=" modal-action modal-close waves-effect waves-green btn-flat modal-trigger" href="#reviewAnnouncementModal">Review</a>
		</div>
	</div>
</div>

<div id="reviewAnnouncementModal" class="modal">
   	<div class="modal-content">
	     <h4>Review Announcement</h4>
	     <div class="row">
		     <div class="input-field col s12">
			     <select multiple disabled>
			      <option value="" disabled>Choose your option</option>
			      <option value="1" selected>All Parents</option>
			      <option value="2">All Teachers</option>
			      <option value="3">Infant Program Parents</option>
			      <option value="4">Toddler Program Parents</option>
			      <option value="5">Day Care Program Parents</option>
			      <option value="6">Play School Program Parents</option>
			      <option value="7">Pre School Program Parents</option>
			      <option value="8">All</option>
			    </select>
			     <label for="name">To</label>
		     </div>
	     </div>
	     <div class="row">
		     <img style="width: 100%;height: 400px;" src="http://i0.wp.com/www.wordstemplates.org/wp-content/uploads/2012/09/Announcement-letter-template.jpg"></img>
	     </div>
		<div class="modal-footer">
			<a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat ">Cancel</a>
		   	<a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Send</a>
		</div>
	</div>
</div>
</main>

<script type="text/javascript">
	document.getElementById('newsletter_dash_div').style.display = 'none';
	document.getElementById('photo_dash_div').style.display = 'none';
	document.getElementById('messages_dash_div').style.display = 'none';
	document.getElementById('webstats_dash_div').style.display = 'none';
	document.getElementById('mobilestats_dash_div').style.display = 'none';
	$(document).ready(function() {
		$('.collapsible').collapsible({
		  accordion: false
		});
	  
	  	$('.carousel').carousel();
		window.setInterval(function(){$('.carousel').carousel('next')},2000);	
	});
	
	var chart1 = new CanvasJS.Chart("broadcastChartContainer1",
	{
	  width: 400,
	  height: 200,
	  title:{
	  text: "Announcement"
	  },
	   data: [
	  {        
	    type: "spline",
	    
	    dataPoints: [
	    { x: new Date(2016, 00, 1), y: 1352 },
	    { x: new Date(2016, 01, 1), y: 1514 },
	    { x: new Date(2016, 02, 1), y: 1321 },
	    { x: new Date(2016, 03, 1), y: 1163 },
	    { x: new Date(2016, 04, 1), y: 950 },
	    { x: new Date(2016, 05, 1), y: 1201 },
	    { x: new Date(2016, 06, 1), y: 1186 },
	    { x: new Date(2016, 07, 1), y: 1281 },
	    { x: new Date(2016, 08, 1), y: 1438 },
	    { x: new Date(2016, 09, 1), y: 1305 },
	    { x: new Date(2016, 10, 1), y: 1480 },
	    { x: new Date(2016, 11, 1), y: 1291 }        
	    ]
	  }       
	    
	  ]
	});
	var chart11 = new CanvasJS.Chart("mobUsageChartContainer1",
	{
	  width: 400,
	  height: 200,
	  title:{
	  text: "Mobile Usage"
	  },
	   data: [
	  {        
	    type: "spline",
	    
	    dataPoints: [
	    { x: new Date(2016, 00, 1), y: 1352 },
	    { x: new Date(2016, 01, 1), y: 1514 },
	    { x: new Date(2016, 02, 1), y: 1321 },
	    { x: new Date(2016, 03, 1), y: 1163 },
	    { x: new Date(2016, 04, 1), y: 950 },
	    { x: new Date(2016, 05, 1), y: 1201 },
	    { x: new Date(2016, 06, 1), y: 1186 },
	    { x: new Date(2016, 07, 1), y: 1281 },
	    { x: new Date(2016, 08, 1), y: 1438 },
	    { x: new Date(2016, 09, 1), y: 1305 },
	    { x: new Date(2016, 10, 1), y: 1480 },
	    { x: new Date(2016, 11, 1), y: 1291 }        
	    ]
	  }       
	    
	  ]
	});
	var chart111 = new CanvasJS.Chart("webUsageChartContainer1",
	{
	  width: 400,
	  height: 200,
	  title:{
	  text: "Web Usage"
	  },
	   data: [
	  {        
	    type: "spline",
	    
	    dataPoints: [
	    { x: new Date(2016, 00, 1), y: 1352 },
	    { x: new Date(2016, 01, 1), y: 1514 },
	    { x: new Date(2016, 02, 1), y: 1321 },
	    { x: new Date(2016, 03, 1), y: 1163 },
	    { x: new Date(2016, 04, 1), y: 950 },
	    { x: new Date(2016, 05, 1), y: 1201 },
	    { x: new Date(2016, 06, 1), y: 1186 },
	    { x: new Date(2016, 07, 1), y: 1281 },
	    { x: new Date(2016, 08, 1), y: 1438 },
	    { x: new Date(2016, 09, 1), y: 1305 },
	    { x: new Date(2016, 10, 1), y: 1480 },
	    { x: new Date(2016, 11, 1), y: 1291 }        
	    ]
	  }       
	    
	  ]
	});
	
	var chart2 = new CanvasJS.Chart("broadcastChartContainer2",
	{
	  width: 400,
	  height: 200,
	  title:{
	  text: "Announcement"
	  },
	   data: [
	  {        
	    type: "spline",
	    
	    dataPoints: [
	    { x: new Date(2016, 00, 1), y: 1352 },
	    { x: new Date(2016, 01, 1), y: 1514 },
	    { x: new Date(2016, 02, 1), y: 1321 },
	    { x: new Date(2016, 03, 1), y: 1163 },
	    { x: new Date(2016, 04, 1), y: 950 },
	    { x: new Date(2016, 05, 1), y: 1201 },
	    { x: new Date(2016, 06, 1), y: 1186 },
	    { x: new Date(2016, 07, 1), y: 1281 },
	    { x: new Date(2016, 08, 1), y: 1438 },
	    { x: new Date(2016, 09, 1), y: 1305 },
	    { x: new Date(2016, 10, 1), y: 1480 },
	    { x: new Date(2016, 11, 1), y: 1291 }        
	    ]
	  }       
	    
	  ]
	});
	var chart21 = new CanvasJS.Chart("mobUsageChartContainer2",
	{
	  width: 400,
	  height: 200,
	  title:{
	  text: "Mobile Usage"
	  },
	   data: [
	  {        
	    type: "spline",
	    
	    dataPoints: [
	    { x: new Date(2016, 00, 1), y: 1352 },
	    { x: new Date(2016, 01, 1), y: 1514 },
	    { x: new Date(2016, 02, 1), y: 1321 },
	    { x: new Date(2016, 03, 1), y: 1163 },
	    { x: new Date(2016, 04, 1), y: 950 },
	    { x: new Date(2016, 05, 1), y: 1201 },
	    { x: new Date(2016, 06, 1), y: 1186 },
	    { x: new Date(2016, 07, 1), y: 1281 },
	    { x: new Date(2016, 08, 1), y: 1438 },
	    { x: new Date(2016, 09, 1), y: 1305 },
	    { x: new Date(2016, 10, 1), y: 1480 },
	    { x: new Date(2016, 11, 1), y: 1291 }        
	    ]
	  }       
	    
	  ]
	});
	var chart211 = new CanvasJS.Chart("webUsageChartContainer2",
	{
	  width: 400,
	  height: 200,
	  title:{
	  text: "Web Usage"
	  },
	   data: [
	  {        
	    type: "spline",
	    
	    dataPoints: [
	    { x: new Date(2016, 00, 1), y: 1352 },
	    { x: new Date(2016, 01, 1), y: 1514 },
	    { x: new Date(2016, 02, 1), y: 1321 },
	    { x: new Date(2016, 03, 1), y: 1163 },
	    { x: new Date(2016, 04, 1), y: 950 },
	    { x: new Date(2016, 05, 1), y: 1201 },
	    { x: new Date(2016, 06, 1), y: 1186 },
	    { x: new Date(2016, 07, 1), y: 1281 },
	    { x: new Date(2016, 08, 1), y: 1438 },
	    { x: new Date(2016, 09, 1), y: 1305 },
	    { x: new Date(2016, 10, 1), y: 1480 },
	    { x: new Date(2016, 11, 1), y: 1291 }        
	    ]
	  }       
	    
	  ]
	});
	var chart3 = new CanvasJS.Chart("broadcastChartContainer3",
	{
	  width: 400,
	  height: 200,
	  title:{
	  text: "Announcement"
	  },
	   data: [
	  {        
	    type: "spline",
	    
	    dataPoints: [
	    { x: new Date(2016, 00, 1), y: 1352 },
	    { x: new Date(2016, 01, 1), y: 1514 },
	    { x: new Date(2016, 02, 1), y: 1321 },
	    { x: new Date(2016, 03, 1), y: 1163 },
	    { x: new Date(2016, 04, 1), y: 950 },
	    { x: new Date(2016, 05, 1), y: 1201 },
	    { x: new Date(2016, 06, 1), y: 1186 },
	    { x: new Date(2016, 07, 1), y: 1281 },
	    { x: new Date(2016, 08, 1), y: 1438 },
	    { x: new Date(2016, 09, 1), y: 1305 },
	    { x: new Date(2016, 10, 1), y: 1480 },
	    { x: new Date(2016, 11, 1), y: 1291 }        
	    ]
	  }       
	    
	  ]
	});
	var chart31 = new CanvasJS.Chart("mobUsageChartContainer3",
	{
	  width: 400,
	  height: 200,
	  title:{
	  text: "Mobile Usage"
	  },
	   data: [
	  {        
	    type: "spline",
	    
	    dataPoints: [
	    { x: new Date(2016, 00, 1), y: 1352 },
	    { x: new Date(2016, 01, 1), y: 1514 },
	    { x: new Date(2016, 02, 1), y: 1321 },
	    { x: new Date(2016, 03, 1), y: 1163 },
	    { x: new Date(2016, 04, 1), y: 950 },
	    { x: new Date(2016, 05, 1), y: 1201 },
	    { x: new Date(2016, 06, 1), y: 1186 },
	    { x: new Date(2016, 07, 1), y: 1281 },
	    { x: new Date(2016, 08, 1), y: 1438 },
	    { x: new Date(2016, 09, 1), y: 1305 },
	    { x: new Date(2016, 10, 1), y: 1480 },
	    { x: new Date(2016, 11, 1), y: 1291 }        
	    ]
	  }       
	    
	  ]
	});
	var chart311 = new CanvasJS.Chart("webUsageChartContainer3",
	{
	  width: 400,
	  height: 200,
	  title:{
	  text: "Web Usage"
	  },
	   data: [
	  {        
	    type: "spline",
	    
	    dataPoints: [
	    { x: new Date(2016, 00, 1), y: 1352 },
	    { x: new Date(2016, 01, 1), y: 1514 },
	    { x: new Date(2016, 02, 1), y: 1321 },
	    { x: new Date(2016, 03, 1), y: 1163 },
	    { x: new Date(2016, 04, 1), y: 950 },
	    { x: new Date(2016, 05, 1), y: 1201 },
	    { x: new Date(2016, 06, 1), y: 1186 },
	    { x: new Date(2016, 07, 1), y: 1281 },
	    { x: new Date(2016, 08, 1), y: 1438 },
	    { x: new Date(2016, 09, 1), y: 1305 },
	    { x: new Date(2016, 10, 1), y: 1480 },
	    { x: new Date(2016, 11, 1), y: 1291 }        
	    ]
	  }       
	    
	  ]
	});
	
	chart1.render();
	chart11.render();
	chart111.render();
	chart2.render();
	chart21.render();
	chart211.render();
	chart3.render();
	chart31.render();
	chart311.render();
	
	function swSchDiv(d) {
		switch (d) {
		case 0:
			document.getElementById('broadcast_home_div').style.display = 'none';
			document.getElementById('newsletter_dash_div').style.display = 'none';	
			document.getElementById('photo_dash_div').style.display = 'none';
			document.getElementById('messages_dash_div').style.display = 'none';
			document.getElementById('webstats_dash_div').style.display = 'none';
			document.getElementById('mobilestats_dash_div').style.display = 'none';
			break;
		case 1:
			document.getElementById('broadcast_home_div').style.display = 'none';
			document.getElementById('photo_dash_div').style.display = 'none';
			document.getElementById('messages_dash_div').style.display = 'none';
			document.getElementById('webstats_dash_div').style.display = 'none';
			document.getElementById('newsletter_dash_div').style.display = 'block';
			document.getElementById('mobilestats_dash_div').style.display = 'none';
			break;
		case 2:
			document.getElementById('broadcast_home_div').style.display = 'none';
			document.getElementById('photo_dash_div').style.display = 'block';
			document.getElementById('newsletter_dash_div').style.display = 'none';
			document.getElementById('messages_dash_div').style.display = 'none';
			document.getElementById('webstats_dash_div').style.display = 'none';
			document.getElementById('mobilestats_dash_div').style.display = 'none';
			$('ul.tabs').tabs();
			break;
		case 3:
			document.getElementById('broadcast_home_div').style.display = 'none';
			document.getElementById('newsletter_dash_div').style.display = 'none';	
			document.getElementById('photo_dash_div').style.display = 'none';
			document.getElementById('webstats_dash_div').style.display = 'none';
			document.getElementById('messages_dash_div').style.display = 'block';
			document.getElementById('mobilestats_dash_div').style.display = 'none';
			break;
		case 4:
			document.getElementById('broadcast_home_div').style.display = 'none';
			document.getElementById('newsletter_dash_div').style.display = 'none';	
			document.getElementById('photo_dash_div').style.display = 'none';
			document.getElementById('webstats_dash_div').style.display = 'block';
			document.getElementById('messages_dash_div').style.display = 'none';
			document.getElementById('mobilestats_dash_div').style.display = 'none';
			break;
		case 5:
			document.getElementById('broadcast_home_div').style.display = 'none';
			document.getElementById('newsletter_dash_div').style.display = 'none';	
			document.getElementById('photo_dash_div').style.display = 'none';
			document.getElementById('webstats_dash_div').style.display = 'none';
			document.getElementById('mobilestats_dash_div').style.display = 'block';
			document.getElementById('messages_dash_div').style.display = 'none';
			break;
		}
	}
	
	var chartNewsletter = new CanvasJS.Chart("newsletterChartContainer",
	{
	  width: 800,
	  height: 400,
	  title:{
	  text: "Readership"
	  },
	   data: [
	  {        
	    type: "spline",
	    
	    dataPoints: [
	    { x: new Date(2016, 00, 1), y: 1352 },
	    { x: new Date(2016, 01, 1), y: 1514 },
	    { x: new Date(2016, 02, 1), y: 1321 },
	    { x: new Date(2016, 03, 1), y: 1163 },
	    { x: new Date(2016, 04, 1), y: 950 },
	    { x: new Date(2016, 05, 1), y: 1201 },
	    { x: new Date(2016, 06, 1), y: 1186 },
	    { x: new Date(2016, 07, 1), y: 1281 },
	    { x: new Date(2016, 08, 1), y: 1438 },
	    { x: new Date(2016, 09, 1), y: 1305 },
	    { x: new Date(2016, 10, 1), y: 1480 },
	    { x: new Date(2016, 11, 1), y: 1291 }        
	    ]
	  }       
	    
	  ]
	});
	
	chartNewsletter.render();
	
	var chartMessages = new CanvasJS.Chart("messagesChartContainer",
	{
	  width: 900,
	  height: 400,
	  title:{
	  text: "Statistics"
	  },
	   data: [
	  {        
	    type: "spline",
	    
	    dataPoints: [
	    { x: new Date(2016, 00, 1), y: 1352 },
	    { x: new Date(2016, 01, 1), y: 1514 },
	    { x: new Date(2016, 02, 1), y: 1321 },
	    { x: new Date(2016, 03, 1), y: 1163 },
	    { x: new Date(2016, 04, 1), y: 950 },
	    { x: new Date(2016, 05, 1), y: 1201 },
	    { x: new Date(2016, 06, 1), y: 1186 },
	    { x: new Date(2016, 07, 1), y: 1281 },
	    { x: new Date(2016, 08, 1), y: 1438 },
	    { x: new Date(2016, 09, 1), y: 1305 },
	    { x: new Date(2016, 10, 1), y: 1480 },
	    { x: new Date(2016, 11, 1), y: 1291 }        
	    ]
	  }       
	    
	  ]
	});
	
	chartMessages.render();
	
	var chartMobileStats = new CanvasJS.Chart("mobileAppStatsChartContainer",
	{
	  width: 500,
	  height: 300,
	  title:{
	  text: "Usage Statistics"
	  },
	   data: [
	  {        
	    type: "spline",
	    
	    dataPoints: [
	    { x: new Date(2016, 00, 1), y: 1352 },
	    { x: new Date(2016, 01, 1), y: 1514 },
	    { x: new Date(2016, 02, 1), y: 1321 },
	    { x: new Date(2016, 03, 1), y: 1163 },
	    { x: new Date(2016, 04, 1), y: 950 },
	    { x: new Date(2016, 05, 1), y: 1201 },
	    { x: new Date(2016, 06, 1), y: 1186 },
	    { x: new Date(2016, 07, 1), y: 1281 },
	    { x: new Date(2016, 08, 1), y: 1438 },
	    { x: new Date(2016, 09, 1), y: 1305 },
	    { x: new Date(2016, 10, 1), y: 1480 },
	    { x: new Date(2016, 11, 1), y: 1291 }        
	    ]
	  }       
	    
	  ]
	});
	
	chartMobileStats.render();
	
	function mobileAppEnable(){
		var text = document.getElementById('mobileAppEnableButton').innerHTML;
		if(text == "Enable")
		{
			document.getElementById('mobileAppEnableButton').innerHTML = "Disable";
		}
		else
		{
			document.getElementById('mobileAppEnableButton').innerHTML = "Enable";
		}
	}
</script>
<%@include file="footer.jsp" %>
