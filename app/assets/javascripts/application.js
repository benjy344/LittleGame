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
var body = document.body;
  var burgerMenu = document.getElementsByClassName('b-menu')[0];
  var burgerContain = document.getElementsByClassName('b-container')[0];
  var burgerNav = document.getElementsByClassName('b-nav')[0];

  burgerMenu.addEventListener('click', function toggleClasses() {
    [body, burgerContain, burgerNav].forEach(function (el) {
      el.classList.toggle('open');
    });
  }, false);

})

