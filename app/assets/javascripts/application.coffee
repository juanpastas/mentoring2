# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
#
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
#
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# compiled file.
#
# Read Sprockets README (https:#github.com/rails/sprockets#sprockets-directives) for details
# about supported directives.
#
#= require jquery
# require jquery.gridster
# require jquery_ujs
# require turbolinks
#= require bootstrap
#= require mousetrap.min
#= require mousetrap-global-bind.min
# require_tree .

$(document).on 'page:change', ->
	$(document).trigger('ready')

timeout = null

	
save = (time = 1000) ->
	clearTimeout timeout if timeout
	_save = ->
		$.post '/save.json', path: $('body').attr('save'), data: $('html').html(), (res) ->
	timeout = setTimeout _save, time

$(document).keyup -> save(7000)

Mousetrap.bindGlobal 'ctrl+shift+s', save