class Lector < ActiveRecord::Base
  has_many :lector_disciplines
  has_many :disciplines, :through => :lector_disciplines

  validates :name, presence: true, uniqueness: true, length: { maximum: 255 }
  validates :title, length: { maximum: 255 }
end
