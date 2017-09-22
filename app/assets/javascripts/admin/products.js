jQuery(function () {
  $(".edit_product #translation_locale").change(function () {
    var requestUrl        = $(this.form).attr("action");
    var translationLocale = this.value;

    $.getJSON(requestUrl, {
      "translation_locale": translationLocale,
    }, (data) => {
      $("#product_summary").val(data.summary);
      // $("#product_description").val(data.description);
      CKEDITOR.instances.product_description.setData(data.description, function () {
        this.checkDirty();
      });
      $("#product_youtube_video_id").val(data.youtube_video_id);
    });
  });
});
