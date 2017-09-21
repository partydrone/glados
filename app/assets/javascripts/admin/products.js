jQuery(function () {
  $(".edit_product #translation_locale").change(function () {
    var requestUrl        = $(this.form).attr("action");
    var translationLocale = this.value;

    $.getJSON(requestUrl, {
      "translation_locale": translationLocale,
    }, (data) => {
      $("#product_summary").val(data.summary);
      $("#product_description").val(data.description);
    });
  });
});
