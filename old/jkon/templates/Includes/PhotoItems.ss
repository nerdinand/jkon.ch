<% if $PaginatedPhotos %>


<div class="row">

<div class="large-12 columns content">
  <ul id="album-photos" class="masonry-grid">
    <% loop $PaginatedPhotos %>
      <li class="album-photo grid-item">
        <a href="$PhotoSized(800,800).URL" rel="shadowbox[Gallery]" title="$Caption">
          <img src="$PhotoSized(300,300).URL" alt="$Caption" />
          <span></span>
        </a>
      </li>
    <% end_loop %>
  </ul>
  <% if $PaginatedPhotos.MoreThanOnePage %>
    <ul class="pagination">
      <% loop $PaginatedPhotos.PaginationSummary %>
        <% if $Link %>
          <li <% if $CurrentBool %>class="active"<% end_if %>><a href="$Link">$PageNum</a></li>
        <% else %>
          <li>...</li>
        <% end_if %>
      <% end_loop %>
    </ul><!-- pagination -->
  <% end_if %>
</div>
<% else %>
  <p>There are no photos in this album.</p> 
<% end_if %>