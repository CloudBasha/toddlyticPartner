<div id="photo_dash_div" class="school_home_div">
	<div class="col s12 m12 l12 default_photo_div">
		<div class="col s12">
			<ul class="tabs">
				<li class="tab col s3">
					<a class="active" href="#photoLink">Photo</a>
				</li>
				<li class="tab col s3">
					<a href="#albumLink">Album</a>
				</li>
			</ul>
		</div>
		<div id="photoLink" class="col s12 m12 l12">
			<div class="row">
				<div class="col s12 m9 l9">
					<a class="modal-trigger" href="#view_photo"><img width="30%" src="<%=request.getContextPath()%>/images/yuna.jpg"></a>
					<a class="modal-trigger" href="#view_photo"><img width="30%" src="<%=request.getContextPath()%>/images/yuna.jpg"></a>
					<a class="modal-trigger" href="#view_photo"><img width="30%" src="<%=request.getContextPath()%>/images/yuna.jpg"></a>
					<a class="modal-trigger" href="#view_photo"><img width="30%" src="<%=request.getContextPath()%>/images/yuna.jpg"></a>
				</div>
				<div class="col s12 m3 l3">
					<div class="col s12 m12 l12">
						<a href="#addPhoto" class="waves-effect waves-teal btn categories_selection modal-trigger">
							<i class="material-icons left">add</i>Photo
						</a>
					</div>
				</div>
			</div>
		</div>
		<div id="albumLink" class="col s12 m12 l12">
			<div class="row">
				<div class="col s12 m9 l9">
					<div class="col s12 m2 l2">
						<img width="100%" src="<%=request.getContextPath()%>/images/album.png">
						<p class="center">Mobile Uploads</p>
					</div>
					<div class="col s12 m2 l2">
						<img width="100%" src="<%=request.getContextPath()%>/images/album.png">
						<p class="center">Fun Day</p>
					</div>
					<div class="col s12 m2 l2">
						<img width="100%" src="<%=request.getContextPath()%>/images/album.png">
						<p class="center">Holiday Trip</p>
					</div>
					<div class="col s12 m2 l2">
						<img width="100%" src="<%=request.getContextPath()%>/images/album.png">
						<p class="center">Sams Birthday Party</p>
					</div>
				</div>
				<div class="col s12 m3 l3">
					<div class="col s12 m12 l12">
						<a href="#addAlbum" class="waves-effect waves-teal btn categories_selection modal-trigger">
							<i class="material-icons left">add</i>Album
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div id="addPhoto" class="modal" style="max-height: 85% !important; width: 70% !important;">
	<form action="<%=request.getContextPath()%>/cms/createPhoto" method="post"
		enctype="multipart/form-data" id="addPhotoForm">
		<input type="hidden" name="schoolId" value="${id}">
		<div class="modal-content">
			<h4>Add Photo</h4>
			<div class="row">
				<div class="col s12 m6 l6">
					<div class="row">
						<div class="input-field col s12">
							<select name="albumId" id="albumId">
								<option value="" disabled selected>Select album</option>
								<c:forEach items="${albumsList}" var="album">
									<option value="${album.albumId}">${album.name}</option>
								</c:forEach>
							</select> <label>Album</label>
						</div>

						<div class="input-field col s12">
							<input type="text" name="name" id="name"> <label>Name</label>
						</div>

					</div>

					<div class="row">
						<div class="col s12 m8 l8">
							<div class="file-field input-field">
								<div class="btn">
									<span>Photo</span> <input type="file" name="photo" id="photo_img">
								</div>
								<div class="file-path-wrapper">
									<input class="file-path validate" type="text">
								</div>
							</div>
							<div>
								<p class="photo_upload_msg">*Maximum file size: 3 mb</p>
							</div>
						</div>
						<div class="col s12 m4 l4 public_chkbtn">
							<input type="checkbox" class="filled-in" id="isPublic" name="isPublic" value="true"
								checked="checked" /> <label for="filled-in-box">Public</label>
						</div>
					</div>
				</div>
				<div class="col s12 m6 l6">
					<div class="row">
						<div class="col s12 m12 l12">Tag Students</div>
					</div>

					<div class="row">
						<div class="col s9 m9 l9">
							<div class="input-field col s12">
								<input placeholder="Student Name" type="text" id="tags" name="tags" size="50">
							</div>
						</div>
						<div class="col s3 m3 m3">
							<a href="javascript:void(0)" onclick="addStudentToPhoto()"> <img
								src="<%=request.getContextPath()%>/images/add.png" width="30px" height="30px"
								style="margin-top: 30px;" />
							</a>
						</div>
					</div>
					<div class="row" id="selectedStudent"></div>
				</div>
			</div>
		</div>
		<div class="modal-footer">
			<a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Cancel</a> <a
				href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat"
				onclick="$(this).closest('form').submit();">Upload</a>
		</div>
	</form>
</div>

<div id="addAlbum" class="modal" style="width: 20%">
	<form method="post" action="<%=request.getContextPath()%>/cms/createAlbum">
		<input type="hidden" name="schoolId" value="${id}">
		<div class="modal-content">
			<div class="row">
				<div class="input-field col s12 m12 l12">
					<input name="album_name" id="album_name" type="text" class="validate"> <label
						for="last_name">Album Name</label>
				</div>
			</div>
		</div>
		<div class="modal-footer">
			<a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Cancel</a> <a
				href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat"
				onclick="$(this).closest('form').submit();">Create</a>
		</div>
	</form>
</div>