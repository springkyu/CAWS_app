class Comment < ApplicationRecord

  belongs_to :user
  belongs_to :post

  # バリデーション
  validates :comment, presence: true

end
