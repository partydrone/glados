class HomeController < ApplicationController
  def index
    @safe_articles           = ContentFilter.new(Tagging.joins(:tag).where(tags: {name: ['safe', 'safety']}).includes(:taggable).map(&:taggable).uniq).filter(:marketing_content).sort_by{ |obj| obj.created_at }.reverse
    @efficient_articles      = ContentFilter.new(Tagging.joins(:tag).where(tags: {name: ['efficient', 'efficiency']}).includes(:taggable).map(&:taggable).uniq).filter(:marketing_content).sort_by{ |obj| obj.created_at }.reverse
    @reliable_articles       = ContentFilter.new(Tagging.joins(:tag).where(tags: {name: ['reliable', 'reliability']}).includes(:taggable).map(&:taggable).uniq).filter(:marketing_content).sort_by{ |obj| obj.created_at }.reverse
    @cost_effective_articles = ContentFilter.new(Tagging.joins(:tag).where(tags: {name: ['cost effective']}).includes(:taggable).map(&:taggable).uniq).filter(:marketing_content).sort_by{ |obj| obj.created_at }.reverse
    @simple_articles         = ContentFilter.new(Tagging.joins(:tag).where(tags: {name: ['simple']}).includes(:taggable).map(&:taggable).uniq).filter(:marketing_content).sort_by{ |obj| obj.created_at }.reverse
    @support_articles        = ContentFilter.new(Tagging.joins(:tag).where(tags: {name: ['support']}).includes(:taggable).map(&:taggable).uniq).filter(:marketing_content).sort_by{ |obj| obj.created_at }.reverse
  end

end
