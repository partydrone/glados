class HomeController < ApplicationController
  def index
    @safe_articles           = ContentFilter.new(Tagging.joins(:tag).where(tags: {name: ['safe', 'safety']}).includes(:taggable).map(&:taggable)).filter(:marketing_content)
    @efficient_articles      = ContentFilter.new(Tagging.joins(:tag).where(tags: {name: ['efficient', 'efficiency']}).includes(:taggable).map(&:taggable)).filter(:marketing_content)
    @reliable_articles       = ContentFilter.new(Tagging.joins(:tag).where(tags: {name: ['reliable', 'reliability']}).includes(:taggable).map(&:taggable)).filter(:marketing_content)
    @cost_effective_articles = ContentFilter.new(Tagging.joins(:tag).where(tags: {name: ['cost effective']}).includes(:taggable).map(&:taggable)).filter(:marketing_content)
    @simple_articles         = ContentFilter.new(Tagging.joins(:tag).where(tags: {name: ['simple']}).includes(:taggable).map(&:taggable)).filter(:marketing_content)
    @support_articles        = ContentFilter.new(Tagging.joins(:tag).where(tags: {name: ['support']}).includes(:taggable).map(&:taggable)).filter(:marketing_content)
  end
end
