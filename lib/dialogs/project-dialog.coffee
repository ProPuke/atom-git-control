Dialog = require './dialog'

git = require '../git'
path = require 'path'

module.exports =
class ProjectDialog extends Dialog
  @content: ->
    @div class: 'git-control dialog', =>
      @div class: 'heading', =>
        @i class: 'icon x clickable', click: 'cancel'
        @strong 'Project'
      @div class: 'body', =>
        @label 'Current Project'
        @select class: 'input-select', outlet: 'projectList'
      @div class: 'buttons', =>
        @button class: 'btn btn-primary inline-block-tight icon icon-repo-pull', click: 'changeProject', =>
          @text 'Change'
        @button class: 'btn icon x', click: 'cancel', =>
          @text 'Cancel'

  activate: ->
    projectIndex = 0
    projectList = @projectList
    projectList.html ''
    for repo in atom.project.getRepositories()
      do(repo) ->
        if repo
          option = document.createElement("option")
          option.value = projectIndex
          option.text = path.basename(path.resolve(repo.path, '..'))
          projectList.append(option)
        projectIndex = projectIndex + 1

    projectList.val(git.getProjectIndex)

    return super()

  changeProject: ->
    @deactivate()
    git.setProjectIndex(@projectList.val())
    repo = git.getRepository()

    @parentView.setWorkspaceTitle(repo.path.split('/').reverse()[1])
    @parentView.update()
    return
