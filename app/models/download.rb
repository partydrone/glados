class Download < ApplicationRecord
  include PgSearch

  belongs_to :download_type
  has_and_belongs_to_many :products

  translates :title, :file_id, :file_filename, :file_size, :file_content_type, fallbacks: { 'fr-FR': :fr }
  
  multisearchable :against => [:title]

  attachment :file

  def to_param
    "#{id} #{title}".parameterize
  end
end
