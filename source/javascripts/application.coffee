#= require 'lib/_jquery.min'
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



