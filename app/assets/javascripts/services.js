$(function(){ 
	// $("form#new_request").bind("ajax:success",
 	// 	                  function(evt, data, status, xhr){
	//                         //this assumes the action returns an HTML snippet
	//                         $("div#success").html(data);
	//                         console.log(data)
	//            }).bind("ajax:error", function(evt, data, status, xhr){
	//                     //do something with the error here
	//                     $("div.errors ul").html(data);
	//                     console.log(data)
	//            });
	// $(document).foundation();

	// $('a#myModal-button').on('click', function(){
	// // $(document).foundation('magellan-expedition','reflow');

	// // 	$('#myModal-content').foundation('reveal', 'open', {
	// //     url: '/requests/new',
	// //     data: {param1: 'example'}
	// // });
	// });
	$(document).on('opened.fndtn.reveal', '[data-reveal]', function () {
  		// var modal = $(this);
  		$(document).foundation();
	});
	
});