Dialog = require './dialog'

git = require '../git'

module.exports =
class MidrebaseDialog extends Dialog
  @content: ->
    @div class: 'dialog', =>
      @div class: 'heading', =>
        @i class: 'icon x clickable', click: 'cancel'
        @strong 'It appears that you are in the middle of a rebase, would you like to:'
      @div class: 'body', =>
        @label class: 'input-label', =>
          @input class: 'input-radio', type: 'radio', outlet: 'contin'
          @text 'Continue the rebase'
        @label class: 'input-label', =>
          @input class: 'input-radio', type: 'radio', outlet: 'abort', checked: true
          @text 'Abort the rebase'
        @label class: 'input-label', =>
          @input class: 'input-radio', type: 'radio', outlet: 'skip'
          @text 'Skip the patch'
      @div class: 'buttons', =>
        @button class: 'active', click: 'midrebase', =>
          @i class: 'icon circuit-board'
          @span 'Rebase'
        @button click: 'cancel', =>
          @i class: 'icon x'
          @span 'Cancel'

  midrebase: ->
    @deactivate()
    @parentView.midrebase(@Contin(),@Abort(),@Skip())
    return

  Contin: ->
    return @contin.is(':checked')

  Abort: ->
    return @abort.is(':checked')

  Skip: ->
    return @skip.is(':checked')
