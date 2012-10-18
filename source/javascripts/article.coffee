$ ->
  $('#actionbar').tooltip
    selector: "a[rel=tooltip]"
    placement: 'bottom'
    delay: { show: 750, hide: 0 }

  $('.highlight-wrapper').each ->
    button = '<div class="wrap-button"><a href="#">wrap</a></div>'
    $(@).before(button)

  $('.wrap-button a').on 'click', (e) ->
    e.preventDefault()
    pre = $(@).parents('.wrap-button').next('.highlight-wrapper').find('td.code pre')
    $(pre).toggleClass('wrap')
