#
# Main.coffee. Initialize your application from here
#

NestedFormBuilder = 

  # Returns a new label tag
  gen_label: (id) -> 
    "<label for='invoice_line_items_attributes_0_qty'>Qty</label>"

  gen_input: (id, type) ->
    a = "<input type='text' size='30' name='invoice[line_items_attributes]["
    b = "]' id='invoice_line_items_attributes_"
    a + id + "][" + type + b + id + "_" + type + "'>"

  new_row: (id) ->
    a = NestedFormBuilder.gen_input(id, "qty")  
    b = NestedFormBuilder.gen_input(id, "description")
    c = NestedFormBuilder.gen_input(id, "price") 
    el = "<tr><td>" + a + "</td><td>" + b + "</td><td>" + c + "</td></tr>"
    $('#nested_items').append(el)
  
NavUtils =
  clickable: () -> 
    $('#sidebar li').click ->
      href = $(this).find('a').attr('href')
      window.location = href

#
# This module invokes the core parts of our app that need to run

class Core

  initialize: () ->
    NavUtils.clickable()  
   
jQuery ($) ->

  core = new Core
  core.initialize()

  $('#new_row').click ->
    NestedFormBuilder.new_row($("#nested_items tr").length)
    

  
