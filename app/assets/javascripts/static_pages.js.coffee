# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
  activeSystemClass = $(".list-group-item.active")
  
  #something is entered in search form
  $("#system-search").keyup ->
    that = this
    
    # affect all table rows on in systems table
    tableBody = $(".table-list-search tbody")
    tableRowsClass = $(".table-list-search tbody tr")
    $(".search-sf").remove()
    tableRowsClass.each (i, val) ->
      
      #Lower text for case insensitive
      rowText = $(val).text().toLowerCase()
      inputText = $(that).val().toLowerCase()
      unless inputText is ""
        $(".search-query-sf").remove()
        tableBody.prepend "<tr class=\"search-query-sf\"><td colspan=\"6\"><strong>Searching for: \"" + $(that).val() + "\"</strong></td></tr>"
      else
        $(".search-query-sf").remove()
      if rowText.indexOf(inputText) is -1
        
        #hide rows
        tableRowsClass.eq(i).hide()
      else
        $(".search-sf").remove()
        tableRowsClass.eq(i).show()
      return

    
    #all tr elements are hidden
    tableBody.append "<tr class=\"search-sf\"><td class=\"text-muted\" colspan=\"6\">No entries found.</td></tr>"  if tableRowsClass.children(":visible").length is 0
    return

  return

$(document).ready(ready)
$(document).on('page:load', ready)
