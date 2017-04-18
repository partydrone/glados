$(".kb-article-down-vote").click(function() {
  $(".negative").toggleClass("active");
  $("#new_knowledge_base_article_feedback").toggleClass("hide");
  return false;
});
$(".kb-article-up-vote").click(function() {
  $(".positive").toggleClass("active");
  $("#kb_feedback_thanks").toggleClass("kb-feedback-thanks");
  return true;
});
