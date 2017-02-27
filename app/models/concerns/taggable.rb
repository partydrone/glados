module Taggable
  extend ActiveSupport::Concern

  included do
    has_many :taggings, as: :taggable
    has_many :tags, through: :taggings
  end

  def related
    Tagging.select('distinct on (taggable_id) *').where(tag_id: tag_ids).where.not(taggable_id: id).includes(:taggable)
  end

  def tag_list
    tags.map(&:name).join(', ')
  end

  def tag_list=(names)
    self.tags = names.split(',').delete_if { |n| n.blank? }.map do |n|
      n.downcase!
      Tag.find_or_create_by!(name: n.strip)
    end
  end
end
