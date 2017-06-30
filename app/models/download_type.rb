class DownloadType < ApplicationRecord
  has_many :downloads, dependent: :destroy

  before_create :set_default_postition

  validates :name, presence: true

  default_scope { order('position') }

  def to_param
    "#{id} #{name}".parameterize
  end

  private

  def set_default_postition
    self.position = Time.now.to_i
  end
end
