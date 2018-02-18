class SoftwareDownload < ApplicationRecord
  include PgSearch
  multisearchable :against => [:title]

  has_and_belongs_to_many :products

  attachment :file

  def to_param
    "#{id} #{title}".parameterize
  end
end
