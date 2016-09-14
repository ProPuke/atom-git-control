Dialog = require './dialog'

git = require '../git'

module.exports =
class BranchDialog extends Dialog
  @content: ->
    @div class: 'git-control dialog', =>
      @div class: 'heading', =>
        @i class: 'icon x clickable', click: 'cancel'
        @strong 'Branch'
      @div class: 'body', =>
        @label 'Current Branch'
        @input class: 'input-text native-key-bindings', type: 'text', readonly: true, outlet: 'fromBranch'
        @label 'New Branch'
        @input class: 'input-text native-key-bindings', type: 'text', outlet: 'toBranch'
      @div class: 'buttons', =>
        @button class: 'btn btn-primary inline-block-tight icon branch', click: 'branch', =>
          @text 'Branch'
        @button class: 'btn icon x', click: 'cancel', =>
          @text 'Cancel'

  activate: ->
    @fromBranch.val(git.getLocalBranch())
    @toBranch.val('')
    return super()

  branch: ->
    @deactivate()
    @parentView.createBranch(@toBranch.val())
    return
