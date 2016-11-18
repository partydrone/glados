class DownloadType < ApplicationRecord
  has_many :downloads, dependent: :nullify

  validates :name, presence: true

  default_scope { order('position') }

  def to_param
    "#{id}-#{name.parameterize}"
  end
end
