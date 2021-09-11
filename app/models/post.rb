class Post < ApplicationRecord

  belongs_to :user
  belongs_to :area

  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_one_attached :image

  # ActiveStorageバリデーション
  validate :image_type

  private

  def image_type
    if !image.blob.content_type.in?(%('image/jpg image/jpeg image/png'))
      image.purge
      errors.add(:image, 'はJPEGまたはPNG形式を選択してアップロードしてください')
    end
  end

end
