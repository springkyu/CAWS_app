class Post < ApplicationRecord

  belongs_to :user
  belongs_to :area

  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_one_attached :image

end
