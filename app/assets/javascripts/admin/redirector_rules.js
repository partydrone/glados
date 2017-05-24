jQuery(function() {
  return $(".toggle-redirect-rule").change(function() {
    return $(this).parent("form").submit();
  });
});
