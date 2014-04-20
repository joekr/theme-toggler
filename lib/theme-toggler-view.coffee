{View} = require 'atom'

module.exports =
class ThemeTogglerView extends View
  @content: ->
    @div class: 'theme-toggler overlay from-top', =>
      @div "The ThemeToggler package is Alive! It's ALIVE!", class: "message"

  initialize: (serializeState) ->
    atom.workspaceView.command "theme-toggler:toggle", => @toggle()

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @detach()

  toggle: ->
    console.log "ThemeTogglerView was toggled!"
    if @hasParent()
      @detach()
    else
      atom.workspaceView.append(this)
