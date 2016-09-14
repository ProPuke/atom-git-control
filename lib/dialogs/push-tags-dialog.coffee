Dialog = require './dialog'
git = require '../git'

module.exports =
class PushTagsDialog extends Dialog
  @content: ->
    @div class: 'git-control dialog', =>
      @div class: 'heading', =>
        @i class: 'icon x clickable',click: 'cancel'
        @strong 'Push Tags'
      @div class: 'body', =>
        @button class: 'btn btn-primary inline-block-tight icon versions', click: 'ptago',=>
          @text 'Push tags to origin'
        @button class: 'btn btn-primary inline-block-tight icon versions', click: 'ptagup',=>
          @text 'Push tags to upstream'
        @button class: 'btn inline-block-tight icon x', click: 'cancel', =>
          @text 'Cancel'


  ptago: ->
    @deactivate()
    remote = 'origin'
    @parentView.ptag(remote)

  ptagup: ->
    @deactivate()
    remote = 'upstream'
    @parentView.ptag(remote)
