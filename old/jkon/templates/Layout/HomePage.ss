<div class="teaser-row">
<div class="row">
<div class="large-12 columns teaser ">$Teaser</div>
</div></div>

           
<div class="row ">
<div class="large-12 columns content ">
$Content       
</div>
<% loop $RandomArt %>
<div class="large-12 columns content">
$Bild.ScaleWidth(1400)
</div>
    <% end_loop %>


</div>



<div class="row">
<div class="large-12 columns content">
<div class="content">
<div id="js-masonry-grid" class=" masonry-grid" >

 <% loop LatestArticles %>
<div class="grid-item">
        $Bild.ScaleWidth(800)

</a>
    </div>
    <% end_loop %>
 </div>

</div></div></div>



