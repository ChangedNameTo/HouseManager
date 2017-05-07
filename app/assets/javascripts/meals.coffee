# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on('turbolinks:load', ->
  # Make sure all timepickers are timepickable
  $('.timepicker').timepicker(
    minTime: '6:00am'
    maxTime: '8:00pm'
    timeFormat: 'g:i A'
    step: 15
    scrollDefault: '11:00'
  )
)
