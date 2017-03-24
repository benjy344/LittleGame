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


var konami = true;

$(document).ready(function () {
	$select = $('form select');
	$loading = $('.loading.in');
	$glitch = $('.loading .js-glitch');

	catchFrase = {
		0 : "...",
		1 : "Où suis-je ...",
		2 : "Qui suis-je ...",
		3 : "Où es-tu ...",
		4 : "Quel est cet endroit...",
		5 : "Pourquoi...",
		6 : "J'entends des bruits ...",
		7 : "J'ai froid ...",
		8 : "Quelque chose approche ...",
	}
	if ($loading.length) {
		setTimeout(function(){
			$loading.css('display', 'none');
		}, 4000)
	}
	if ($glitch.length) {

		if ($glitch.find('.js-text').length) {
			var alea = Math.floor((Math.random() * Object.keys(catchFrase).length) - 1);
			$glitch.find('.js-text').html(catchFrase[alea]);
		}
		setTimeout(function(){
			$glitch.css('display', 'none');
		}, 2400)
	}

	if ($select.length) {

		//$select.find('option[value=""]').remove();

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


var secret = [38,38,40,40,37,39,37,39,66,65]; //konami code
var i = 0;


$(document).keyup(function(e) {
	if (konami) {
		if(secret[i]==e.which){        
			i++;

			if(i==10){
				$('body').prepend('<div class="loading in konami black"><div class="screen glitch js-glitch"><div class="figure"></div><div class="figure-mask"></div></div></div>');
				var $url = window.location.origin+'/addObjetById?objet_id=17';
				$.get({
				  url: $url,
				  dataType: "script"
				});
				setTimeout(function(){
					$('.konami').remove();
				}, 4000);
				setTimeout(function(){
					$('.konami .js-glitch').remove();
				}, 2400)
				konami = false;
			}
		}else{
			i=0;
		};
	}
});



})

