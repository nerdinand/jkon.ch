<div class="teaser-row">
<div class="row">
<div class="large-12 columns teaser "><p>$Title</p></div>
</div></div>
<div class="row">
<% if $Content %>
<div class="large-12 columns content">
$Content</div>
<% end_if %>

<% if $AlbumCount > 1 %>
  <% if $PaginatedAlbums %>
    <div class="large-6 large-centered columns">
    <div class="masonry-grid">
      <% loop $PaginatedAlbums %>
        <div class="grid-item">
          <div class="photo-album-cover">
            <a href="$Link" title="$Name">
              <% if $PhotoCropped %>
                <img src="$PhotoCropped.setWidth(600).URL" alt="$Name" />
              <% end_if %>
            </a>
          </div><!-- photo-album-cover -->
          <div class="photo-album-info">
            <p><a href="$Link" title="$Name">$Name</a> <span class="photo-count">($PhotoCount)</span></p>
            <p>$DescriptionExcerpt(300)</p>
          </div><!-- photo-album-info -->
        </div><!-- photo-album -->
      <% end_loop %>
      </div>
    </div><!-- photo-albums -->
    <% if $PaginatedAlbums.MoreThanOnePage %>
      <ul class="pagination">
        <% loop $PaginatedAlbums.PaginationSummary %>
          <% if $Link %>
            <li <% if $CurrentBool %>class="active"<% end_if %>><a href="$Link">$PageNum</a></li>
          <% else %>
            <li>...</li>
          <% end_if %>
        <% end_loop %>
      </ul><!-- pagination -->
    <% end_if %>
  <% end_if %>
<% end_if %>
<% if $AlbumCount == 1 %>
  <% loop $PaginatedAlbums %>
    <div class="teaser-row">
<div class="row">
<div class="large-12 columns teaser "><p>$Name</p></div>
</div></div>
  <% end_loop %>
  <% include PhotoItems %> 
<% end_if %>
<% if AlbumCount < 1 %>
    No albums to view yet.
<% end_if %>
</div>
</div>
