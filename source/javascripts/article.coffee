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

  showContent = (element, duration = 500) ->
    $(element).animate { opacity: 1 }, duration

  initializeView = ->
    setTimeout 300, -> showContent('header h1', 1000)
    setTimeout 1200, -> showContent('section p, aside, .highlight-wrapper, .wrap-button')
    setTimeout 1500, -> showContent('table.highlighttable', 1000)

  initializeView()

