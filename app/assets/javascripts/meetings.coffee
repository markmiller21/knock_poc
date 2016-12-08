$(document).ready ->
  $('[data-toggle="tooltip"]').tooltip();
  Dropzone.options.chatFile =
    paramName: 'chat_file'
    maxFilesize: 5
    accept: (file, done) ->
      done()
