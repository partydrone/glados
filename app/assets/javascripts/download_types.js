jQuery(function() {
  $("#download_types").sortable({
    axis:   "y",
    handle: ".handle",
    update: function() {
      return $.post($(this).data("update-path"), $(this).sortable("serialize"));
    }
  });
});
