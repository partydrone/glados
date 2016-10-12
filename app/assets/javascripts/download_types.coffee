jQuery ->
  $("#download_types").sortable
    axis: "y"
    handle: ".handle"
    update: ->
      $.post($(@).data("update-path"), $(@).sortable("serialize"))
