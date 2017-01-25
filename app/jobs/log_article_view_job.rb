class LogArticleViewJob < ApplicationJob
  queue_as :default

  def perform(article)
    article.log_view
  end
end
