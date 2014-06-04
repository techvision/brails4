# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
@coderay_ele = '.CodeRay pre'

$(document).ready ->
  $.cookie.defaults = { path: '/', expires: 365 }

  # set the color, font sizes
  $("html, #{coderay_ele}").removeClass("white yellow orange black").addClass($.cookie('color'));

  if $.cookie('font_size') isnt undefined
    $("body, #{coderay_ele}").removeClass (index, css) ->
      (css.match(/\btextsize-\S+/g) or []).join " "
    $("body, #{coderay_ele}").addClass $.cookie('font_size')

#  $("#audio").bind "ended", ->
#    $('#summary').show()
#  $('audio').mediaelementplayer();

  # color switcher
  $(".color-switcher .switch").on "click", ->
    t = $(this)
    color = t.data("color")
    $.cookie 'color', color
    $("html, #{coderay_ele}").removeClass("white yellow orange black").addClass(color);

  # Change font size   
  $(".change-font-size").on "click", ->
    t = $(this)
    size = t.data("size")
    body = $('body')
    max = 2425
    min = 1225

    currentTextClass = parseInt(body.attr("class").split("textsize-")[1])

    $("body").removeClass (index, css) ->
      (css.match(/\btextsize-\S+/g) or []).join " "

    if size is 'reset'
      body.addClass 'textsize-1625'
    else if size is 'up' 
      if currentTextClass isnt max
        body.addClass 'textsize-' + (currentTextClass + 200)
      else
        body.addClass 'textsize-' + max
    else if size is 'down' 
      if currentTextClass isnt min
        body.addClass 'textsize-' + (currentTextClass - 200)
      else
        body.addClass 'textsize-' + min
      
    $.cookie 'font_size', body.attr("class")

