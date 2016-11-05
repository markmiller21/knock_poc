$ ->
  $('.summaries-carousel').each ->
    $carousel = $(this)
    $carousel_summary = $carousel.find('.carousel-summary')

    $carousel.on('slide.bs.carousel', (e, j) ->
      new_active_index = $(e.relatedTarget).index('.summaries-carousel .item')
      $carousel_summary.removeClass('active')
      $($carousel_summary[new_active_index]).addClass('active')
    )

    summary_hover = ->
      new_active_index = $(this).index('.carousel-summary')
      $carousel.carousel(new_active_index)

    $carousel_summary.mouseenter ->
      $carousel.carousel('pause')

    $carousel_summary.mouseleave ->
      $carousel.carousel('cycle')

    $carousel_summary.mouseenter(_.debounce(summary_hover, 200))

