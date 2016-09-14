Dialog = require './dialog'

module.exports =
class CreateTagDialog extends Dialog
  @content: ->
    @div class: 'git-control dialog', =>
      @div class: 'heading', =>
        @i class: 'icon x clickable', click: 'cancel'
        @strong 'Tag'
      @div class: 'body', =>
        @label 'Tag name'
        @input class: 'input-text native-key-bindings', type: 'text', outlet: 'name'
        @label 'commit ref'
        @input class: 'input-text native-key-bindings', type: 'text', outlet: 'href'
        @label 'Tag Message'
        @textarea class: 'input-textarea native-key-bindings', outlet: 'msg'
      @div class: 'buttons', =>
        @button class: 'btn btn-primary inline-block-tight icon tag', click: 'tag', =>
          @text 'Create Tag'
        @button class: 'btn inline-block-tight icon x', click: 'cancel', =>
          @text 'Cancel'

  tag: ->
    @deactivate()
    @parentView.tag(@Name(), @Href(), @Msg())
    return

  Name: ->
    return @name.val()

  Href: ->
    return @href.val()

  Msg: ->
    return @msg.val()
