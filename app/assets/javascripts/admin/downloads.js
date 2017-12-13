jQuery(function() {
  $(".edit_download #translation_locale").change(function () {
    var requestUrl = $(this.form).attr("action");
    var translationLocale = this.value;

    $.getJSON(requestUrl, {
      "translation_locale": translationLocale,
    }, function (data) {
      $("#download_title").val(data.title);
      $("#download_current_file_link").attr("href", data.file);
      $("#download_current_file_link").html(data.file);
    });
  });
});
