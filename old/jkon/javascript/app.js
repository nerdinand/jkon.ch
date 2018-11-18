// Foundation JavaScript
// Documentation can be found at: http://foundation.zurb.com/docs
$(document).foundation();

// trigger for joyride demo in KitchenSink demo
$('#start-jr').on('click', function() {
	$(document).foundation('joyride','start');
});

setTimeout(
  function() 
  {
 $grid.masonry('layout');
  }, 1500);
// init Masonry
var $grid = $('.masonry-grid').masonry({
  itemSelector: '.grid-item',
});


$(document).ready(function(){

	var iOS = !!navigator.platform && /iPad|iPhone|iPod/.test(navigator.platform);

	

    	$(".hamburger-bottom").hide();

$(".jkon-menu .top.has-dropdown a.a-has-dropdown").click(function(e){
	 e.preventDefault();
	 $(".dropdown").slideUp();
	$(this).next().slideDown();
});

$(".jkon-menu .menu-close a").click(function(e){
	 e.preventDefault(); 
	$(".jkon-menu").fadeOut(200);
});

$(".menu-hamburger").click(function(e){
	 e.preventDefault();
	$(".jkon-menu").fadeIn(200);
});
});

$(window).scroll(function (event) {
    if($(window).scrollTop()>60){
    	$(".hamburger-bottom").show();
		$(".logo").fadeOut();
    }else{
		$(".logo").fadeIn();
    	$(".hamburger-bottom").hide();

    }
});

document.addEventListener("touchstart", function(){}, true);




