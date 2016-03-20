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
//= require best_in_place
//= require jquery_ujs
//= require jquery.remotipart
//= require foundation
//= require jquery.turbolinks
//= require_tree .

$(document).ready(function(){
	var company_status = $("input[type=radio][name='user[inputs][company]'][checked=checked]");
	var status = company_status.prop('value');
	
	if (status == 'company') {
		$("label[for='user_inputs_person_in_charge']").show();
		$("input[type=text][name='user[inputs][person_in_charge]']").show();
		
		$("label[for='user_inputs_company_address']").show();
		$("input[type=text][name='user[inputs][company_address]']").show();
		
		$("label[for='user_inputs_year_founded']").show();
		$("input[type=text][name='user[inputs][year_founded]']").show();
		
		$("label[for='user_inputs_number_of_employees']").show();
		$("input[type=text][name='user[inputs][number_of_employees]']").show();
		
		$("label[for='user_inputs_website']").show();
		$("input[type=text][name='user[inputs][website]']").show();	
			
	};
	if (status == 'personal') {
		$("label[for='user_inputs_person_in_charge']").hide();
		$("input[type=text][name='user[inputs][person_in_charge]']").hide();
		
		$("label[for='user_inputs_company_address']").hide();
		$("input[type=text][name='user[inputs][company_address]']").hide();
		
		$("label[for='user_inputs_year_founded']").hide();
		$("input[type=text][name='user[inputs][year_founded]']").hide();
		
		$("label[for='user_inputs_number_of_employees']").hide();
		$("input[type=text][name='user[inputs][number_of_employees]']").hide();
		
		$("label[for='user_inputs_website']").hide();
		$("input[type=text][name='user[inputs][website]']").hide();
		
	};
	$("input[type=radio][name='user[inputs][company]']").change(function() { 
	  if ($(this).prop('value') == 'company') {
	  	$("label[for='user_inputs_person_in_charge']").show();
	  	$("input[type=text][name='user[inputs][person_in_charge]']").show();
	  	
	  	$("label[for='user_inputs_company_address']").show();
	  	$("input[type=text][name='user[inputs][company_address]']").show();
	  	
	  	$("label[for='user_inputs_year_founded']").show();
	  	$("input[type=text][name='user[inputs][year_founded]']").show();
	  	
	  	$("label[for='user_inputs_number_of_employees']").show();
	  	$("input[type=text][name='user[inputs][number_of_employees]']").show();
	  	
	  	$("label[for='user_inputs_website']").show();
	  	$("input[type=text][name='user[inputs][website]']").show();	
	  };
	  if ($(this).prop('value') == 'personal') {

	  $("label[for='user_inputs_person_in_charge']").hide();
	  $("input[type=text][name='user[inputs][person_in_charge]']").hide();
	  
	  $("label[for='user_inputs_company_address']").hide();
	  $("input[type=text][name='user[inputs][company_address]']").hide();
	  
	  $("label[for='user_inputs_year_founded']").hide();
	  $("input[type=text][name='user[inputs][year_founded]']").hide();
	  
	  $("label[for='user_inputs_number_of_employees']").hide();
	  $("input[type=text][name='user[inputs][number_of_employees]']").hide();
	  
	  $("label[for='user_inputs_website']").hide();
	  $("input[type=text][name='user[inputs][website]']").hide();
	  };
	  $(document).foundation();
	});
});

$(document).on('ready page:load' , function () {
	$(document).foundation();
	$('.full-height').height($(window).height());
});

$(document).ready(function() {
  /* Activating Best In Place */
  jQuery(".best_in_place").best_in_place();
});
