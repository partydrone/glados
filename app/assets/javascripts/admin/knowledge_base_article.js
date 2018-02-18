jQuery(function () {
  $(".edit_knowledge_base_article #translation_locale").change(function () {
    var requestUrl        = $(this.form).attr("action");
    var translationLocale = this.value;

    $.getJSON(requestUrl, {
      "translation_locale": translationLocale,
    }, function (data) {
      $("#knowledge_base_article_title").val(data.title);
      $("#knowledge_base_article_subtitle").val(data.subtitle);
      CKEDITOR.instances.knowledge_base_article_body.setData(data.body, function () {
        this.checkDirty();
      });
    });
  });
});
