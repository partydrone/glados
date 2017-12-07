jQuery(function() {
  $("#product_types").sortable({
    axis:   "y",
    handle: ".handle",
    update: function() {
      return $.post($(this).data("update-path"), $(this).sortable("serialize"));
    }
  });

  $(".edit_product_type #translation_locale").change(function () {
    var requestUrl        = $(this.form).attr("action");
    var translationLocale = this.value;

    $.getJSON(requestUrl, {
      "translation_locale": translationLocale,
    }, (data) => {
      $("#product_type_name").val(data.name);
    });
  });
});
