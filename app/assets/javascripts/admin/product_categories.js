jQuery(function() {
  $("#product_categories").sortable({
    axis:   "y",
    handle: ".handle",
    update: function() {
      return $.post($(this).data("update-path"), $(this).sortable("serialize"));
    }
  });

  $(".edit_product_category #translation_locale").change(function () {
    var requestUrl        = $(this.form).attr("action");
    var translationLocale = this.value;

    $.getJSON(requestUrl, {
      "translation_locale": translationLocale,
    }, function (data) {
      $("#product_category_name").val(data.name);
      $("#product_category_description").val(data.description);
    });
  });
});
