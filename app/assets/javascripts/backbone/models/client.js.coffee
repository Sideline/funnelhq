class Baseapp.Models.Client extends Backbone.Model
  paramRoot: 'client'

  defaults:
    first_name: null
    last_name: null
    email: null
    telephone: null

class Baseapp.Collections.ClientsCollection extends Backbone.Collection
  model: Baseapp.Models.Client
  url: '/clients'
