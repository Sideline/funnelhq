#
# Main.coffee. Initialize your application from here
#

# Builds dynamic nested form fields for the invoice section of this application. 

NestedFormBuilder = 
  
  # Generates a new form builder input field
  # @returns [String]

  gen_input: (id, type) ->
    a = "<input type='text' size='30' name='invoice[line_items_attributes]["
    b = "]' id='invoice_line_items_attributes_"
    a + id + "][" + type + b + id + "_" + type + "'>"

  # Generates a new nested row and appends it to the tree

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

class Core

  initialize: () ->
    NavUtils.clickable()  

# Doc ready 

jQuery ($) ->

  core = new Core
  core.initialize()
  
  $('#sidebar').height($(document).height());
  

  $('#add_line_item').click ->
    cnt = $('#nested_items tr').length
    NestedFormBuilder.new_row(cnt)