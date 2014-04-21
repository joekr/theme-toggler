ThemeTogglerView = require './theme-toggler-view'

_isDark = true

module.exports =
  themeTogglerView: null
  configDefaults: {
    lightUiTheme: 'atom-light-ui',
    lightSyntaxTheme: 'atom-light-syntax',
    darkUiTheme: 'atom-dark-ui',
    darkSyntaxTheme: 'atom-dark-syntax'
  }

  activate: (state) ->
    atom.workspaceView.command "theme-toggler:toggle", => @toggle()

    theme = atom.config.get('core.themes')[0]
    @_isDark = false\
      if theme == atom.config.get('theme-toggler.lightUiTheme')

    @toggle()

  toggle: ->
    if @_isDark
      @setDark()
    else
      @setLight()

    @_isDark = !@_isDark

  setLight: ->
    fullTheme = [atom.config.get('theme-toggler.lightUiTheme'),
      atom.config.get('theme-toggler.lightSyntaxTheme')]
    atom.themes.setEnabledThemes(fullTheme)

  setDark: ->
    fullTheme = [atom.config.get('theme-toggler.darkUiTheme'),
      atom.config.get('theme-toggler.darkSyntaxTheme')]
    atom.themes.setEnabledThemes(fullTheme)

  deactivate: ->

  serialize: ->
