class Subcategory < ActiveRecord::Base
  belongs_to :category
  has_many :skills
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :category_id, presence: true
end
