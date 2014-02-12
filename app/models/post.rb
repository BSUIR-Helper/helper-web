class Post < ActiveRecord::Base
  belongs_to :discipline

  validates :title, presence: true, length: { maximum: 255 }
  validates :discipline, presence: true
end
