getEditorElement = (callback) ->
  waitsForPromise ->
    atom.packages.activatePackage('emacs-plus').then (pack) ->
      pack.activateResources()

  waitsForPromise ->
    atom.workspace.open().then (editor) ->
      callback(atom.views.getView(editor))

keydown = (key, options = {}) ->
  {buildKeydownEvent} = atom.keymaps.constructor
  unless options.target?
    options.target = atom.views.getView(atom.workspace.getActiveTextEditor())
  atom.keymaps.handleKeyboardEvent(buildKeydownEvent(key, options))

module.exports = {keydown, getEditorElement}
