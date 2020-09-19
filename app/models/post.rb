class Post < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader
  validates :title, presence: true
  validates :contents, presence: true
  validates :image, presence: true
end
