Dialog = require './dialog'
git = require '../git'

module.exports =
class PushDialog extends Dialog
  @content: ->
    @div class: 'git-control dialog', =>
      @div class: 'heading', =>
        @i class: 'icon x clickable',click: 'cancel'
        @strong 'Push'
      @div class: 'body', =>
        @p =>
          @button class: 'btn btn-primary icon push', click: 'upstream', =>
            @text 'Push upstream'
        @label 'Push from branch'
        @input class: 'input-text native-key-bindings',readonly: true,outlet: 'fromBranch'
        @label 'To branch'
        @select class: 'input-select native-key-bindings',outlet: 'toBranch'
        @label class: 'input-label', =>
          @input class: 'input-checkbox', type: 'checkbox', outlet: 'force'
          @text 'Force Push'
      @div class: 'buttons', =>
        @button class: 'btn btn-primary inline-block-tight icon push', click: 'push', =>
          @text 'Push'
        @button class: 'btn icon x' ,click: 'cancel', =>
          @text 'Cancel'

  activate: (remotes) ->
    @fromBranch.val(git.getLocalBranch())
    @toBranch.find('option').remove()
    # add simple origin branch
    @toBranch.append "<option value='origin'>origin</option>"
    for remote in remotes
      @toBranch.append "<option value='#{remote}'>#{remote}</option>"
    return super()

  push: ->
    @deactivate()
    remote = @toBranch.val().split('/')[0]
    # branch = @toBranch.val().split('/')[1]
    branch = git.getLocalBranch()
    @parentView.push(remote,branch,@Force())
    return

  upstream: ->
    @deactivate()
    @parentView.push('','')

  Force: ->
    return @force.is(':checked')
