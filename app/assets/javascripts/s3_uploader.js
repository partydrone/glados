jQuery(function() {
  $(document).on("upload:start", "form", function(e) {
    $(this).find("input[type=submit]").attr("disabled", true)
  });

  $(document).on("upload:progress", "form", function(e) {
    // detail = e.originalEvent.detail;
    // percentComplete = Math.round(detail.loaded / detail.total * 100);
  });

  $(document).on("upload:success", "form", function(e) {
    if (!$(this).find("input.uploading").length) {
      $(this).find("input[type=submit]").removeAttr("disabled")
    }
  });
});
