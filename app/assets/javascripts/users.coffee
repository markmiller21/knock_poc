$(document).ready ->
  $('#meeting-btn, #call-btn').click (e) ->
    e.preventDefault()
    $('#meeting-modal').modal 'show'
    if $(this).attr('id') == 'call-btn'
      $('#meeting_meeting_type').val 'call'
      $("#meeting_location").css('display', 'none')
    else
      $('#meeting_meeting_type').val 'in_person'
      $("#meeting_location").css('display', '')
    return
  return
