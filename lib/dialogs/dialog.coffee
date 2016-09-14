{View} = require 'atom-space-pen-views'

module.exports =
class Dialog extends View
  constructor: (parentView) ->
    super()
    @parentView = parentView

  activate: ->
    if !@modal
      @modal = atom.workspace.addModalPanel item:this[0], visible:true
    else
      @modal.show()
    return

  deactivate: ->
    @modal?.hide()
    return

  cancel: ->
    @deactivate()
    return
