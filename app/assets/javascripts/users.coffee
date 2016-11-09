$(document).ready ->
  $('#meeting-btn, #call-btn').click (e) ->
    e.preventDefault()
    $('#meeting-modal').modal 'show'
    if $(this).attr('id') == 'call-btn'
      $('#meeting_type').val 'call'
    else
      $('#meeting_type').val 'in_person'
    return
  return
