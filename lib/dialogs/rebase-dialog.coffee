Dialog = require './dialog'

git = require '../git'

module.exports =
class RebaseDialog extends Dialog
  @content: ->
    @div class: 'git-control dialog', =>
      @div class: 'heading', =>
        @i class: 'icon x clickable', click: 'cancel'
        @strong 'Rebase'
      @div class: 'body', =>
        @label 'Current Branch'
        @input class: 'input-text native-key-bindings', type: 'text', readonly: true, outlet: 'toBranch'
        @label 'Rebase On Branch'
        @select class: 'input-select native-key-bindings', outlet: 'fromBranch'

      @div class: 'buttons', =>
        @button class: 'btn btn-primary inline-block-tight icon circuit-board', click: 'rebase', =>
          @text 'Rebase'
        @button class: 'btn inline-block-tight icon x', click: 'cancel', =>
          @text 'Cancel'

  activate: (branches) ->
    current = git.getLocalBranch()

    @toBranch.val(current)
    @fromBranch.find('option').remove()

    for branch in branches when branch isnt current
      @fromBranch.append "<option value='#{branch}'>#{branch}</option>"

    return super()

  rebase: ->
    @deactivate()
    @parentView.rebase(@fromBranch.val())

    return
