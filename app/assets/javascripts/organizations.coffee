# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on('turbolinks:load', ->
    # Approves all of the provisional members
    $('#approve_all').on('click', ->
        $('.provisional_approve').click();
        location.reload();
    )

    $('#deny_all').on('click', ->
        $('.provisional_deny').click();
        location.reload();
    )

    $('.btn').on('click', ->
        location.reload();
    )
)
