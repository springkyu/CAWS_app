class Area < ApplicationRecord

  has_many :posts, dependent: :destroy

  validates :area, presence: true

end
