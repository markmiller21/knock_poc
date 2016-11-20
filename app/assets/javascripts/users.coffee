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

$(document).ready ->
  phil_slider = $('#phil-slider').slider()
  phil_slider.slider 'setValue', 5 if phil_slider



  #this is from legacy, we may use this later
#$(document).ready ->
#  $('#essay_college_app_essays_true').click ->
#    $('#college_application_essays').show()
#    return
#  $('#essay_accept_phone_calls_true').click ->
#    $('#accept_phone_calls').show()
#    return
#  $('#essay_meetup_inperson_true').click ->
#    $('#in_person_meeting').show()
#    return
#  $('#essay_college_app_essays_false').click ->
#    $('#college_application_essays').hide()
#    return
#  $('#essay_accept_phone_calls_false').click ->
#    $('#accept_phone_calls').hide()
#    return
#  $('#essay_meetup_inperson_false').click ->
#    $('#in_person_meeting').hide()
#    return
#  return
