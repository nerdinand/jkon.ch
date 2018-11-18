<div class="teaser-row">
<div class="row">
<div class="large-6 large-centered columns teaser ">

<p>$PhotoAlbum.Name</p></div>
</div></div>   
<div class="row">
<div class="large-6 large-centered columns teaser ">
<% if PhotoAlbum.Description %><p>$PhotoAlbum.Description</p><% end_if %>

<% include PhotoItems %>        

<% if OtherAlbums %>
	<div class="other-albums">
		<h3>Weitere Impressionen</h3>
	  	<ul class="button-list">
	    	<% loop OtherAlbums %>
	        	<li><a href="$Link">$Name</a></li>
	    	<% end_loop %>
	  	</ul>
	</div><!-- .other-albums -->
<% end_if %>
</div></div>