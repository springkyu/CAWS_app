class Post < ApplicationRecord

  belongs_to :user
  belongs_to :area
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  # has_one_attachedメソッド
  has_one_attached :image

  validates :shop_name, presence: true
  validates :area_id, presence: true
  validates :rate, presence: true
  validates :body, length: { minimum: 1 }, allow_blank: true
  validates :location, length: { minimum: 1 }, allow_blank: true
  # ActiveStorageバリデーション
  validate :image_type

  private

  def image_type
    if !image.attached?
      errors.add(:image, '画像を選択してください')
    end

    if image.attached? && !image.blob.content_type.in?(%('image/jpg image/jpeg image/png'))
      image.purge
      errors.add(:image, 'はJPEGまたはPNG形式を選択してアップロードしてください')
    end
  end

  def self.search(keyword)
    Post.where(['shop_name LIKE ? OR body LIKE ? OR location LIKE ?', "%#{keyword}%", "%#{keyword}%", "%#{keyword}%"])
  end

end
