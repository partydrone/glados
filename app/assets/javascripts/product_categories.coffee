jQuery ->
  $("#product_categories").sortable
    axis: "y"
    handle: ".handle"
    update: ->
      $.post($(@).data("update-path"), $(@).sortable("serialize"))
