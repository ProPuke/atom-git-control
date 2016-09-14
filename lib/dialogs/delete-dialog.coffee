Dialog = require './dialog'

module.exports =
class DeleteDialog extends Dialog
  @content: (params) ->
    @div class: 'git-control dialog', =>
      @div class: 'heading', =>
        @i class: 'icon x clickable', click: 'cancel'
        @strong params.hdr
      @div class: 'body', =>
        @div params.msg
      @div class: 'buttons', =>
        @button class: 'btn btn-primary inline-block-tight icon check', click: 'delete', =>
          @text 'Yes'
        @button class: 'btn inline-block-tight icon x', click: 'cancel', =>
          @text 'No'
        @button class: 'btn btn-warning inline-block-tight icon trash', click: 'forceDelete', =>
          @text  'FORCE DELETE'

  initialize: (params) ->
    @params = params

  delete: ->
    @deactivate()
    @params.cb(@params)
    return

  forceDelete: ->
    @deactivate()
    @params.fdCb(@params)
    return
