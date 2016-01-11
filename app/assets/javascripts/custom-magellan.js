$(function(){
	// $(document).foundation({
	// 	"magellan-expedition": {
	// 	  active_class: 'label', // specify the class used for active sections
	// 	  threshold: 0, // how many pixels until the magellan bar sticks, 0 = auto
	// 	  destination_threshold: 30, // pixels from the top of destination for it to be considered active
	// 	  throttle_delay: 50, // calculation throttling to increase framerate
	// 	  fixed_top: 0, // top distance in pixels assigend to the fixed element on scroll
	// 	  offset_by_height: false // whether to offset the destination by the expedition height. Usually you want this to be true, unless your expedition is on the side.
	// 	}
	// });
// $(document).foundation();
// $(document).foundation('magellan-expedition':{active_class: 'label'});
$(document).foundation('magellan-expedition','reflow');


	
	// $('div.custom-magellan').css({ 'width': $('.width-finder').css('width'), 'left': 'auto', 'min-width': '0'});
	$('div.custom-magellan').css({ 'width': $('div.width-finder').width()+'px', 'left': 'auto', 'min-width': '0'});
	// $('.custom-magellan[data-magellan-expedition-clone]').removeClass('hide-for-small-only');
	// $('div.custom-magellan[data-magellan-expedition-clone]').addClass('small-up');
	// $('div.custom-magellan').attr('data-magellan-expedition-clone').addClass('small-up');
});