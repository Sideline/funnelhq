class Baseapp.Models.Task extends Backbone.Model

  paramRoot: 'task'

  defaults:
    title: null

class Baseapp.Collections.TasksCollection extends Backbone.Collection
  model: Baseapp.Models.Task
  url: '/tasks'
