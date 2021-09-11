class Area < ApplicationRecord

  has_many :posts, dependent: :destroy

  # バリデーション
  validates :area, presence: true

end
