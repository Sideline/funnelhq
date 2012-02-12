$ = jQuery.sub()
Task = App.Task

$.fn.item = ->
  elementID   = $(@).data('id')
  elementID or= $(@).parents('[data-id]').data('id')
  Task.find(elementID)

class New extends Spine.Controller
  events:
    'click [data-type=back]': 'back'
    'submit form': 'submit'
    
  constructor: ->
    super
    @active @render
    
  render: ->
    @html @view('tasks/new')

  back: ->
    @navigate '/tasks'

  submit: (e) ->
    e.preventDefault()
    task = Task.fromForm(e.target).save()
    @navigate '/tasks', task.id if task

class Edit extends Spine.Controller
  events:
    'click [data-type=back]': 'back'
    'submit form': 'submit'
  
  constructor: ->
    super
    @active (params) ->
      @change(params.id)
      
  change: (id) ->
    @item = Task.find(id)
    @render()
    
  render: ->
    @html @view('tasks/edit')(@item)

  back: ->
    @navigate '/tasks'

  submit: (e) ->
    e.preventDefault()
    @item.fromForm(e.target).save()
    @navigate '/tasks'

class Show extends Spine.Controller
  events:
    'click [data-type=edit]': 'edit'
    'click [data-type=back]': 'back'

  constructor: ->
    super
    @active (params) ->
      @change(params.id)

  change: (id) ->
    @item = Task.find(id)
    @render()

  render: ->
    @html @view('tasks/show')(@item)

  edit: ->
    @navigate '/tasks', @item.id, 'edit'

  back: ->
    @navigate '/tasks'

class Index extends Spine.Controller
  events:
    'click [data-type=edit]':    'edit'
    'click [data-type=destroy]': 'destroy'
    'click [data-type=show]':    'show'
    'click [data-type=new]':     'new'

  constructor: ->
    super
    Task.bind 'refresh change', @render
    Task.fetch()
    
  render: =>
    tasks = Task.all()
    @html @view('tasks/index')(tasks: tasks)
    
  edit: (e) ->
    item = $(e.target).item()
    @navigate '/tasks', item.id, 'edit'
    
  destroy: (e) ->
    item = $(e.target).item()
    item.destroy() if confirm('Sure?')
    
  show: (e) ->
    item = $(e.target).item()
    @navigate '/tasks', item.id
    
  new: ->
    @navigate '/tasks/new'
    
class App.Tasks extends Spine.Stack
  controllers:
    index: Index
    edit:  Edit
    show:  Show
    new:   New
    
  routes:
    '/tasks/new':      'new'
    '/tasks/:id/edit': 'edit'
    '/tasks/:id':      'show'
    '/tasks':          'index'
    
  default: 'index'
  className: 'stack tasks'