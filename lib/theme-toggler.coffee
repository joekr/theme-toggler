ThemeTogglerView = require './theme-toggler-view'

module.exports =
  themeTogglerView: null

  activate: (state) ->
    atom.workspaceView.command "theme-toggler:dark", => @dark()
    atom.workspaceView.command "theme-toggler:light", => @light()

  light: ->
    atom.themes.setEnabledThemes(["atom-light-syntax","atom-light-ui"])

  dark: ->
    atom.themes.setEnabledThemes(["atom-dark-ui","atom-dark-syntax"])

  deactivate: ->
    @themeTogglerView.destroy()

  serialize: ->
    themeTogglerViewState: @themeTogglerView.serialize()
