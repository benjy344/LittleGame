// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs

//= require_tree .



$(document).ready(function () {
	$select = $('form select');

	if ($select.length) {

		$select.find('option[value=""]').remove();

		$select.on('change', function(e){
			$val = $(e.currentTarget).find('option:selected').text();
			$label = $(e.currentTarget).prev('label:first');
			$label.html($val);
			$(e.currentTarget).find('option[value=""]').remove();
		})
	}

	$link = $('.user-info .link');
	$link.on('click', function(){
		$link.toggleClass('open');
		$('.user-info').toggleClass('open');
	})
var body = $('body');
  var burgerMenu = $('.b-menu');
  var burgerContain = $('.b-container');
  var burgerNav = $('.b-nav');
if (burgerMenu.length) {
	burgerMenu.on('click', function() {
    [body, burgerContain, burgerNav].forEach(function (el) {
      el.toggleClass('open');
    });
  });

}
  
})

