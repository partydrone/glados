module Taggable
  extend ActiveSupport::Concern

  included do
    has_many :taggings, as: :taggable
    has_many :tags, through: :taggings
  end

  class_methods do
    def tagged_with(name)
      Tag.find_by_name!(name)
    end

    def tag_counts
      Tag.select('tags.*, count(taggings.tag_id) as count').joins(:taggings).group('taggings.tag_id')
    end
  end

  def tag_list
    tags.map(&:name).join(', ')
  end

  def tag_list=(names)
    self.tags = names.split(', ').map do |n|
      Tag.where(name: n.strip).first_or_create!
    end
  end
end
