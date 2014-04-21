{View} = require 'atom'

module.exports =
class ThemeTogglerView extends View
  @content: ->
    types = ['syntax','ui']
    @div class: 'theme-toggler overlay from-top', =>
      for type in types
        @h1 "All loaded #{type} themes"
        @ol =>
          for theme in atom.themes.getLoadedThemes()
            @li "#{theme.name}"\
             if theme.metadata.theme == "#{type}"

  initialize: (serializeState) ->
    atom.workspaceView.command "theme-toggler:themes", => @toggle()

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @detach()

  toggle: ->
    if @hasParent()
      @detach()
    else
      atom.workspaceView.append(this)
      setTimeout ( =>
        @detach()
      ), 15000
