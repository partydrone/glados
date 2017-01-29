jQuery(function() {
  $("#product_types").sortable({
    axis:   "y",
    handle: ".handle",
    update: function() {
      return $.post($(this).data("update-path"), $(this).sortable("serialize"));
    }
  });
});
