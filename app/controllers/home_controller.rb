class HomeController < ApplicationController
  def index
    @safe_articles           = MarketingContentFilter.new(Tagging.joins(:tag).where(tags: {name: ['safe', 'safety']}).includes(:taggable).map(&:taggable)).filter
    @efficient_articles      = MarketingContentFilter.new(Tagging.joins(:tag).where(tags: {name: ['efficient', 'efficiency']}).includes(:taggable).map(&:taggable)).filter
    @reliable_articles       = MarketingContentFilter.new(Tagging.joins(:tag).where(tags: {name: ['reliable', 'reliability']}).includes(:taggable).map(&:taggable)).filter
    @cost_effective_articles = MarketingContentFilter.new(Tagging.joins(:tag).where(tags: {name: ['cost effective']}).includes(:taggable).map(&:taggable)).filter
    @simple_articles         = MarketingContentFilter.new(Tagging.joins(:tag).where(tags: {name: ['simple']}).includes(:taggable).map(&:taggable)).filter
    @support_articles        = MarketingContentFilter.new(Tagging.joins(:tag).where(tags: {name: ['support']}).includes(:taggable).map(&:taggable)).filter
  end
end
