class Download < ApplicationRecord
  extend CarrierwaveGlobalize
  include PgSearch
  multisearchable :against => [:title]

  belongs_to :download_type
  has_and_belongs_to_many :products

  translates :title, :file

  mount_translated_uploader :file, FileUploader

  def to_param
    "#{id} #{title}".parameterize
  end
end
