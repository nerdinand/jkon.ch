<div class="teaser-row">
<div class="row">
<div class="large-12 columns teaser "><p>$Title</p></div>
</div>
</div>
<div class="row">
<div class="large-12 columns">
	<article>
		
		<div class="content">
<div id="js-masonry-grid" class=" masonry-grid" >
           



 <% loop children %>
<div class="img-container grid-item large-4 columns content content-left">
<a href="$Link" title="$Title">

<% loop $RandomArt %>
        $Bild.ScaleWidth(600)
<% end_loop %> 
</a>
<div class="img-overlay"><a href="$Link" title="$Title">$Title</a></div>

              
             
    </div>
            <% end_loop %>

         
    
</div>
	</article>
		
</div>
</div>
