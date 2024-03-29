class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :image

  has_many :posts
  has_many :likes, dependent: :destroy #いいね
  has_many :comments, dependent: :destroy #dependent: :destroyこの場合　ユーザーが退会すると退会したユーザーのコメントが自動的に削除される

  def self.guest #ゲストログインの情報
    user=find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.password_confirmation = user.password
      user.name = "ゲストユーザー"
      user.age = "22歳"
      user.gender = "男性"
      user.introduction ="自己紹介ですよ"
      user.telephone_number ="０９０１２３４５６７８"
    end
    file_path = Rails.root.join('app/assets/images/bicycle.jpg')
    user.image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    user
  end

  def active_for_authentication?
    super && (self.is_active == true)
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
