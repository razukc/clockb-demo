$(function(){
	$('div.custom-magellan').css({ 'left': 'auto', 'min-width': '0'});
	$('div.custom-magellan').css({ 'padding': '0'});
	// $('div.custom-magellan').css({ 'position': 'absolute'});
	$('div.custom-magellan').width($('div.width-finder').width());
});