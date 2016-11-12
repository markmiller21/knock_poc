$(document).ready ->
  $('#meeting-btn, #call-btn, #video-call-btn').click (e) ->
    e.preventDefault()
    $('#meeting-modal').modal 'show'
    if $(this).attr('id') == 'call-btn'
      $('#meeting_meeting_type').val 'call'
      $('#meeting_location').css 'display', 'none'
    else if $(this).attr('id') == 'meeting-btn'
      $('#meeting_meeting_type').val 'in_person'
      $('#meeting_location').css 'display', ''
    else
      $('#meeting_meeting_type').val 'video'
      $('#meeting_location').css 'display', 'none'
    return
  return