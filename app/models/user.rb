class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_one_attached :profile_image

  validate :introduction

  # ActiveStorageバリデーション
  validate :profile_image_type

  private

  def profile_image_type
    if !image.blob.content_type.in?(%('image/jpg image/jpeg image/png'))
      image.purge
      errors.add(:profile_image, 'はJPEGまたはPNG形式を選択してアップロードしてください')
    end
  end

end
