ThemeTogglerView = require './theme-toggler-view'
{CompositeDisposable} = require 'atom'

_isDark = true

checkThemeExists = (name) ->
  if not atom.packages.resolvePackagePath name
    atom.notifications.addWarning "Can not find theme #{name}"

module.exports =
  themeView: null,
  subscriptions: null,
  config:
    lightUiTheme:
      type: 'string'
      default: 'atom-light-ui'
    lightSyntaxTheme:
      type: 'string'
      default: 'atom-light-syntax'
    darkUiTheme:
      type: 'string'
      default: 'atom-dark-ui'
    darkSyntaxTheme:
      type: 'string'
      default: 'atom-dark-syntax'

  activate: (state) ->
    themeView = new ThemeTogglerView(state)

    @subscriptions = new CompositeDisposable

    @subscriptions.add atom.commands.add 'atom-workspace', 'theme-toggler:toggle', => @toggle()

    theme = atom.config.get('core.themes')[0]
    @_isDark = false if theme == atom.config.get('theme-toggler.lightUiTheme')

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

    fullTheme.forEach checkThemeExists

    atom.config.set('core.themes', fullTheme)

  setDark: ->
    fullTheme = [atom.config.get('theme-toggler.darkUiTheme'),
      atom.config.get('theme-toggler.darkSyntaxTheme')]

    fullTheme.forEach checkThemeExists

    atom.config.set('core.themes', fullTheme)

  deactivate: ->
    themeView = null
    @subscriptions.dispose()

  serialize: ->
