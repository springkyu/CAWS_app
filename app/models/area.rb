class Area < ApplicationRecord

  has_many :posts, dependent: :destroy

  # バリデーション
  validates :area, presence: true

  def self.search(keyword)
    Area.where('area LIKE ?', "%#{keyword}%")
  end

end
