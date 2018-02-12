<%@include file="header.jsp"%>
<%@include file="standard_nav.jsp"%>
<main>
	<script type="text/javascript">
		$(document).ready(function(){
			$('.carousel.carousel-slider').carousel({full_width: true});
			window.setInterval(function(){$('.carousel').carousel('next')},3000);
	    });
	</script>
	<div>
		<div class="container schoolInvitationDiv">
			<div class="row">
				<div class="container">
					<div class="col s12 center">
						<h5>Toddlytic Features</h5>
					</div>
					<div class="carousel carousel-slider carouselDiv">
					  <a class="carousel-item" href="#one!"><img src="http://lorempixel.com/400/200/food/1"></a>
					  <a class="carousel-item" href="#two!"><img src="http://lorempixel.com/400/200/food/2"></a>
					  <a class="carousel-item" href="#three!"><img src="http://lorempixel.com/400/200/food/3"></a>
					  <a class="carousel-item" href="#four!"><img src="http://lorempixel.com/400/200/food/4"></a>
					</div>
					<div class="row">
						<div class="col s12 proceedToInviteSchool">
							<a class="waves-effect waves-light btn modal-trigger" href="<%=request.getContextPath()%>/inviteSchoolDetails"">Invite A School<i class="material-icons left">send</i></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>
<%@include file="footer.jsp"%>