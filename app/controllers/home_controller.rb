class HomeController < ApplicationController
  def index
    @safe_articles           = Tagging.joins(:tag).where(tags: {name: 'safe'}).limit(6)
    @efficient_articles      = Tagging.joins(:tag).where(tags: {name: 'efficient'}).limit(6)
    @reliable_articles       = Tagging.joins(:tag).where(tags: {name: 'reliable'}).limit(6)
    @cost_effective_articles = Tagging.joins(:tag).where(tags: {name: 'cost effective'}).limit(6)
    @simple_articles         = Tagging.joins(:tag).where(tags: {name: 'simple'}).limit(6)
    @support_articles        = Tagging.joins(:tag).where(tags: {name: 'support'}).limit(6)
  end
end
