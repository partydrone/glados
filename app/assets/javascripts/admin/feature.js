jQuery(function () {
  $(".edit_feature #translation_locale").change(function () {
    var requestUrl        = $(this.form).attr("action");
    var translationLocale = this.value;

    $.getJSON(requestUrl, {
      "translation_locale": translationLocale,
    }, function (data) {
      $("#feature_title").val(data.title);
      $("#feature_description").val(data.description);
      $("#feature_youtube_video_id").val(data.youtube_video_id);
      CKEDITOR.instances.feature_body.setData(data.body, function () {
        this.checkDirty();
      });
    });
  });
});
