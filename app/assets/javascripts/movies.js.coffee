$ ->
  prepareRatingInput()

$(document).bind 'page:change', ->
  prepareRatingInput()

window.prepareRatingInput = ->
  $('input.rating-input').rating();
  $('.rating-input').on 'click', 'i', ->
    $.post '/grades/rate',
      movie_id: $('.grade').data('movie_id')
      value: $(@).data('value')
