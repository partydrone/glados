jQuery(function() {
  return $(".support_base_index_select_product").change(function() {
    if (this.selectedIndex !== 0) {
      return this.form.submit();
    }
  });
});
