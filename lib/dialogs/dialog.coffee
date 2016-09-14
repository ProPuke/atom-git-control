{View} = require 'atom-space-pen-views'

module.exports =
class Dialog extends View
  constructor: (parentView) ->
    Dialog.__super__.constructor.apply this, (Array.prototype.slice.call arguments, 1)
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
