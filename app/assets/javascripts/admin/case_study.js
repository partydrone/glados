jQuery(function () {
  $(".edit_case_study #translation_locale").change(function () {
    var requestUrl        = $(this.form).attr("action");
    var translationLocale = this.value;

    $.getJSON(requestUrl, {
      "translation_locale": translationLocale,
    }, function (data) {
      $("#case_study_title").val(data.title);
      $("#case_study_subtitle").val(data.subtitle);
      CKEDITOR.instances.case_study_body.setData(data.body, function () {
        this.checkDirty();
      });
    });
  });
});
