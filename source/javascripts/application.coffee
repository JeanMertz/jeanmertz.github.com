#= require 'lib/_jquery.min'
#= require 'lib/_jquery-ui.min'
#= require 'lib/_jquery.style'
#= require 'lib/_jquery.animate-enhanced.min'
#= require 'bootstrap/_bootstrap'
#= require '_syntax'

# make setTimeout not suck for coffeescript
window.originalSetTimeout = window.setTimeout
window.setTimeout = (arg1, arg2) ->
  if typeof(arg1) == 'number' then window.originalSetTimeout(arg2, arg1) else window.originalSetTimeout(arg1, arg2)

$ ->
  # Don't open local links in a new window (for iOS webapp support)
  $('a').on 'click', (e) ->
    if /^\/.*/.test($(@).attr('href'))
      e.preventDefault()
      window.location = $(@).attr('href')

  # Wrap all code blocks on the page...
  $('a#wrap-code-button').on 'click', (e) ->
    e.preventDefault()
    $('.highlight-wrapper td.code pre').each -> $(@).toggleClass('wrap')

  # ... or disable the button if no code blocks are present
  if $('.highlight-wrapper td.code pre').length is 0
    $('a#wrap-code-button').addClass('disabled')



  # Remove the 'back' button when not in web-app (already present)
  # TODO: What about iPhone 5 height?
  if window.innerHeight < 460
    el = $('<li><a href="#" id="homescreen-button"><i class="icon-arrow-down icon-white"></a></i></li>')
    $('#back-button').parent('li').remove()
    $('#read-later-dropdown').parent('li.dropdown').prev().before(el)
    $('#aside li.divider-vertical').first().insertAfter $('#share-dropdown').parent('li.dropdown')

    # Construct homescreen instructions
    container = $('<div id="homescreen-instructions"></div>')
    title = '<h4>Enhance your reading experience!</h4>'
    intro = '<p>This blog has been crafted to give you the best reading experience on iPhone and iPad.</p>'
    instructions =
            """
            <ol>
              <li>Tap the iOS share button <i class="icon-share"></i> at the bottom of the screen</li>
              <li>Tap "Add to home screen"</li>
              <li>Tap "Add"</li>
              <li>Tap the icon to launch my blog</li>
            </ol>
            """
    $(container).append(title)
    $(container).append(intro) unless window.innerHeight < 350
    $(container).append(instructions)
    $('body').append(container)

    $(window).resize ->
      if window.innerHeight < 350
        $(container).children('p').hide()
      else
        $(container).children('p').show()



  # Show homescreen instructions on button tap
  $('a#homescreen-button, #homescreen-instructions').on 'click', (e) ->
    e.preventDefault()
    $('#homescreen-instructions').fadeToggle(500)



  # Display content tools bar
  toggleContentTools = ->
    if $('#content-tools').css('top') isnt '0px'
      $('#content-tools').style('display', 'inherit', 'important')
      $('#content-tools').animate { top: '0px' }
      $('body').animate { marginTop: 40 }
    else
      $('#content-tools').animate { top: '-71px' }, ->
        $(@).style('display', 'none', 'important')
      $('body').animate { marginTop: 0 }

  $('#toggle-content-tools').on 'click', (e) ->
    e.preventDefault()
    toggleContentTools()


  # Resize text
  $('#text-size-button').on 'click', (e) ->
    e.preventDefault()
    el = $('article section')
    if el.hasClass('fs1') then el.removeClass('fs1').addClass('fs2')
    else  if el.hasClass('fs2') then el.removeClass('fs2').addClass('fs3')
    else  if el.hasClass('fs3') then el.removeClass('fs3').addClass('fs4')
    else  if el.hasClass('fs4') then el.removeClass('fs4').addClass('fs5')
    else  if el.hasClass('fs5') then el.removeClass('fs5').addClass('fs1')



  # Resize line height
  $('#line-height-button').on 'click', (e) ->
    e.preventDefault()
    el = $('article section')
    if el.hasClass('lh1') then el.removeClass('lh1').addClass('lh2')
    else  if el.hasClass('lh2') then el.removeClass('lh2').addClass('lh3')
    else  if el.hasClass('lh3') then el.removeClass('lh3').addClass('lh4')
    else  if el.hasClass('lh4') then el.removeClass('lh4').addClass('lh5')
    else  if el.hasClass('lh5') then el.removeClass('lh5').addClass('lh1')


  # Switch to dark mode
  $('#dark-mode-button').on 'click', (e) ->
    e.preventDefault()
    $('body').toggleClass('dark-mode')
