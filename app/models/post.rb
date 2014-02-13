class Post < ActiveRecord::Base
  belongs_to :discipline
  belongs_to :author, class_name: 'User'

  validates :title, presence: true, length: { maximum: 255 }
  validates :discipline, presence: true
end
