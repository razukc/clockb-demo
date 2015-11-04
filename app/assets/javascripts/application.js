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
//= require foundation
//= require jquery.turbolinks
//= require_tree .

$(function(){ 
	$(document).foundation({
		"magellan-expedition": {
		  active_class: 'active', // specify the class used for active sections
		  threshold: 0, // how many pixels until the magellan bar sticks, 0 = auto
		  destination_threshold: 30, // pixels from the top of destination for it to be considered active
		  throttle_delay: 50, // calculation throttling to increase framerate
		  fixed_top: 0, // top distance in pixels assigend to the fixed element on scroll
		  offset_by_height: true // whether to offset the destination by the expedition height. Usually you want this to be true, unless your expedition is on the side.
		}
	});

	$('.calendar .has-events .this-day').each(function(){
		$(this).remove();
	});
});
