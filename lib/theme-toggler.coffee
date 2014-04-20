ThemeTogglerView = require './theme-toggler-view'

module.exports =
  themeTogglerView: null
  configDefaults: {
    lightUiTheme: 'atom-light-ui',
    lightSyntaxTheme: 'atom-light-syntax',
    darkUiTheme: 'atom-dark-ui',
    darkSyntaxTheme: 'atom-dark-syntax'
  }

  activate: (state) ->
    atom.workspaceView.command "theme-toggler:dark", => @dark()
    atom.workspaceView.command "theme-toggler:light", => @light()


  light: ->
    fullTheme = [atom.config.get('theme-toggler.lightUiTheme'),
      atom.config.get('theme-toggler.lightSyntaxTheme')]

    atom.themes.setEnabledThemes(fullTheme)

  dark: ->
    fullTheme = [atom.config.get('theme-toggler.darkUiTheme'),
      atom.config.get('theme-toggler.darkSyntaxTheme')]

    atom.themes.setEnabledThemes(fullTheme)

  deactivate: ->
    @themeTogglerView.destroy()

  serialize: ->
    themeTogglerViewState: @themeTogglerView.serialize()
