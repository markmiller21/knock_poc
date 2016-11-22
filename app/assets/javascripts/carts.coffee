$ ->
  $form = $('#payment-form')

  stripeResponseHandler = (status, response) ->
    # Grab the form:
    $form = $('#payment-form')
    if response.error
      # Problem!
      # Show the errors on the form:
      $form.find('.payment-errors').text response.error.message
      $form.find('.submit').prop 'disabled', false
    # Re-enable submission
    else
      # Token was created!
      # Get the token ID:
      token = response.id
      # Insert the token ID into the form so it gets submitted to the server:
      $form.append $('<input type="hidden" name="stripeToken">').val(token)
      # Submit the form:
      $form.get(0).submit()

#      $('#payment_submit_btn').click (e) ->
#        alert '123123123'
#        $.ajax
#          url: $form.attr('action')
#          data: $form.serialize()
#          type: 'POST'
#          success: (data) ->
#            alert '789789789'
#            $('#credit-card-modal').modal 'hide'
#            $('#cc-setup-success').html 'Credit Card setup success!'
#            return
#        false


  $form.submit (event) ->
    # Disable the submit button to prevent repeated clicks:
    #$form.find('.submit').prop 'disabled', true
    # Request a token from Stripe:
    Stripe.card.createToken $form, stripeResponseHandler
    # Prevent the form from being submitted:
    event.preventDefault()
    false
  return