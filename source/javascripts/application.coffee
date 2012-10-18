#= require 'lib/_jquery.min'
#= require 'bootstrap/_bootstrap'
#= require '_syntax'

# make setTimeout not suck for coffeescript
window.originalSetTimeout = window.setTimeout
window.setTimeout = (arg1, arg2) ->
  if typeof(arg1) == 'number' then window.originalSetTimeout(arg2, arg1) else window.originalSetTimeout(arg1, arg2)
