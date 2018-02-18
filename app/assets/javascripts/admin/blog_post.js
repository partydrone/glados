jQuery(function () {
  $(".edit_blog_post #translation_locale").change(function () {
    var requestUrl        = $(this.form).attr("action");
    var translationLocale = this.value;

    $.getJSON(requestUrl, {
      "translation_locale": translationLocale,
    }, function (data) {
      $("#blog_post_title").val(data.title);
      $("#blog_post_subtitle").val(data.subtitle);
      CKEDITOR.instances.blog_post_body.setData(data.body, function () {
        this.checkDirty();
      });
    });
  });
});
