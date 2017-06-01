jQuery(function() {
  $("#sales-regions").sortable({
    axis:   "y",
    handle: ".handle",
    update: function() {
      return $.post($(this).data("update-path"), $(this).sortable("serialize"));
    }
  });
});
