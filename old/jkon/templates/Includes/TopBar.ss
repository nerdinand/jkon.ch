<div class="jkon-center"><a class="menu-hamburger hamburger-top" ></a></div>


<section class="jkon-menu">
		<ul class="main">
		<li class="menu-close"><a></a></li>    
			<% loop Menu(1) %>
			<li class="top <% if $LinkingMode == "current" || $LinkingMode == "section" %>active<% end_if %><% if $Children %> has-dropdown<% end_if %>">
				<a class="<% if $Children %>a-has-dropdown<% end_if %>" href="$Link" title="Go to the $Title.ATT">$MenuTitle</a>
				<% if $Children %>
				<ul class="dropdown">
					<% loop $Children %>
					<li class="<% if $LinkingMode == "current" || $LinkingMode == "section" %>active<% end_if %>">
						<a  href="$Link" title="Go to the $Title.ATT">$MenuTitle</a>	
					</li>
					<% end_loop %>
					
				</ul>
				<% end_if %>
			</li>
			<% end_loop %>
		</ul>
		<%-- Right Nav Section --%>
		
	</section>