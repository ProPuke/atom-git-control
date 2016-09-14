Dialog = require './dialog'

git = require '../git'

module.exports =
class MergeDialog extends Dialog
  @content: ->
    @div class: 'git-control dialog', =>
      @div class: 'heading', =>
        @i class: 'icon x clickable', click: 'cancel'
        @strong 'Merge'
      @div class: 'body', =>
        @label 'Current Branch'
        @input class: 'input-text native-key-bindings', type: 'text', readonly: true, outlet: 'toBranch'
        @label 'Merge From Branch'
        @select class: 'input-select native-key-bindings', outlet: 'fromBranch'
        @label class: 'input-label', =>
          @input class: 'input-checkbox', type: 'checkbox', outlet: 'noff'
          @text 'No Fast-Forward'
      @div class: 'buttons', =>
        @button class: 'btn btn-primary inline-block-tight icon merge', click: 'merge', =>
          @text 'Merge'
        @button class: 'btn inline-block-tight icon x', click: 'cancel', =>
          @text 'Cancel'

  activate: (branches) ->
    current = git.getLocalBranch()

    if atom.config.get("git-control.noFastForward")
      @noff.prop("checked", true)

    @toBranch.val(current)
    @fromBranch.find('option').remove()

    for branch in branches when branch isnt current
      @fromBranch.append "<option value='#{branch}'>#{branch}</option>"

    return super()

  merge: ->
    @deactivate()
    @parentView.merge(@fromBranch.val(),@noFF())
    return

  noFF: ->
     return @noff.is(':checked')
