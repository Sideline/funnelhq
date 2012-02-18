class Baseapp.Routers.ClientsRouter extends Backbone.Router
  initialize: (options) ->
    @clients = new Baseapp.Collections.ClientsCollection()
    @clients.reset options.clients

  routes:
    "/new"      : "newClient"
    "/index"    : "index"
    "/:id/edit" : "edit"
    "/:id"      : "show"
    ".*"        : "index"

  newClient: ->
    @view = new Baseapp.Views.Clients.NewView(collection: @clients)
    $("#clients").html(@view.render().el)

  index: ->
    @view = new Baseapp.Views.Clients.IndexView(clients: @clients)
    $("#clients").html(@view.render().el)

  show: (id) ->
    client = @clients.get(id)

    @view = new Baseapp.Views.Clients.ShowView(model: client)
    $("#clients").html(@view.render().el)

  edit: (id) ->
    client = @clients.get(id)

    @view = new Baseapp.Views.Clients.EditView(model: client)
    $("#clients").html(@view.render().el)
