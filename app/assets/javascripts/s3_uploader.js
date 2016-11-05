jQuery(function() {
  $("[type=file]").fileupload({
    add: function(e, data) {
      console.log("add", data);

      data.progressBar = $(`<progress value="0" max="100"></progress>`).insertAfter($(this));

      var options = {
        extension: data.files[0].name.match(/(\.\w+)?$/)[0], // set the file extension
        _: Date.now() // prevent caching
      }

      $.getJSON($(this).data("presigned-route"), options, function(result) {
        console.log("presign", result);
        data.formData = result["fields"];
        data.url = result["url"];
        data.paramName = "file";
        data.submit();
      });
    },
    progressall: function(e, data) {
      console.log("progress", data);

      var progress = parseInt(data.loaded / data.total * 100, 10);

      $("progress").attr("value", progress);
    },
    done: function(e, data) {
      console.log("done", data);

      data.progressBar.remove();

      var file = {
        id: data.formData.key.match(/cache\/(.+)/)[1], // we have to remove the prefix
        storage: "cache",
        metadata: {
          size: data.files[0].size,
          filename: data.files[0].name.match(/[^\/\\]+$/)[0], // IE return full path
          mime_type: data.files[0].type
        }
      }

      $(`<p><code>` + file.metadata.filename + `</code> was uploaded successfully.</p>`).insertAfter($(this));

      form = $(this).closest("form");
      form.find("[type=hidden][name='" + $(this).attr("name") + "']").attr("value", JSON.stringify(file));

      $(this).remove();
    }
  });
});
