// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.remotipart
//= require foundation
//= require jquery.turbolinks
//= require_tree .

$('div.full').hide();
$(window).bind('load resize', function () { 
    screen = $('div.full').width();
	content = 1000;
	remaining = screen - content;
	fluid =  (remaining/screen)*50;
	$('div.column-fluid').css({'min-width': fluid+'%'});
	setTimeout(
	  function() 
	  {
	    //do something special
	    $('div.full').show();
	  }, 1000
	 );

});


// $(function(){
// 	screen = $('div.ca').width();
// 	content = 1000;
// 	remaining = screen - content;
// 	left = right = (remaining/screen)*50;
// 	$('div.cb').css({'width': left+'%'});
// });