$(function(){
	$(window).bind('load resize', function () { 
	    screen1 = $('div.full').width();
	    content = 1000;
		remaining = screen1 - content;
		fluid =  (remaining/screen1)*50;
		$('div.column-fluid').css({'width': fluid+'%'});
		// $('div.column-fluid').animate({width: fluid+'%'},600, "linear");
		$('div.full').animate({opacity: 1}, 800)
		// $('div.full').css({'opacity': '1'});
		$(document).foundation();
	});
});