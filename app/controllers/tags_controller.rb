class TagsController < ApplicationController
  def show
    @tag = Tag.includes(:taggings).find_by(name: params[:name])
  end
end
