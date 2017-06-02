class Download < ApplicationRecord
  belongs_to :download_type
  has_and_belongs_to_many :products

  include PgSearch
    multisearchable :against => [:title]

  attachment :file

  validates :locale, :title, presence: true

  def self.default_scope
    direction = "ASC, title ASC"
    order("
        CASE
          WHEN locale = '#{I18n.locale}' THEN '1'
          WHEN locale != '#{I18n.locale}' THEN '2'
        END #{direction}")
  end

  def to_param
    "#{id} #{title}".parameterize
  end
end
