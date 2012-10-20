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
    $('#back-button').parent('li').remove()

