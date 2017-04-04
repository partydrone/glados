$(".kb-article-down-vote").click(function() {
  $(".negative").addClass("active");
  $("#new_knowledge_base_article_feedback").removeClass("hide");
  return false;
});
