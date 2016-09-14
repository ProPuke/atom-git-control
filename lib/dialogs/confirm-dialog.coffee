Dialog = require './dialog'

module.exports =
class ConfirmDialog extends Dialog
  @content: (params) ->
    @div class: 'git-control dialog', =>
      @div class: 'heading', =>
        @i class: 'icon x clickable', click: 'cancel'
        @strong params.hdr
      @div class: 'body', =>
        @div params.msg
      @div class: 'buttons', =>
        @button class: 'btn btn-primary inline-block-tight icon check', click: 'confirm', =>
          @text 'Yes'
        @button class: 'btn inline-block-tight icon x', click: 'cancel', =>
          @text 'No'

  initialize: (params) ->
    @params = params

  confirm: ->
    @deactivate()
    @params.cb(@params)
    return
