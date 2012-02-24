#
# Main.coffee. Initialize your application from here
#

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
