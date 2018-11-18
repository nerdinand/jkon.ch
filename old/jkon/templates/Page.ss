<!doctype html>
<html class="no-js" lang="$ContentLocale.ATT" dir="$i18nScriptDirection.ATT">
<% include head %>
<body class="$ClassName.ATT">


        <header class="show-for-medium-up"><h1 class="text-center heading_supersize">
            <a title="home" href="{$baseUrl}"><img class="logo" src="/themes/jkon/images/jkon_logo_2018.png">
            <img class="" src="/themes/jkon/images/jkon_logo_2018_leer.png">
            </a></h1>
        </header>

        <header class="show-for-small-only"><h1 class="text-center heading_supersize">
            <a title="home" href="{$baseUrl}"><img class="logo" src="/themes/jkon/images/jkon_logo_mobile_2018.png">
            <img class="" src="/themes/jkon/images/jkon_logo_mobile_2018_leer.png">
            </a></h1>
        </header>

       <% include TopBar %>
       <div class="jkon-content">
        $Layout
	</div>
        <% include Footer %>

	

	<%--See [Requirements](http://doc.silverstripe.org/framework/en/reference/requirements) for loading from controller--%>
	<script src="$ThemeDir/bower_components/jquery/dist/jquery.min.js"></script>
	<script src="$ThemeDir/bower_components/foundation/js/foundation.min.js"></script>
        <script src="$ThemeDir/javascript/plugins/masonry.pkgd.min.js"></script>
	<script src="$ThemeDir/javascript/app.js"></script>
        
</body>   
</html>
