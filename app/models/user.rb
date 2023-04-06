class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :image

  def self.guest #ゲストログインの情報
    user=find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.password_confirmation = user.password
      user.name = "ゲストユーザーでーす"
      user.age = "22"
      user.gender = "男性でーす"
      user.introduction ="自己紹介ですよ"
      user.telephone_number ="０９０１２３４５６７８"
    end
    file_path = Rails.root.join('app/assets/images/no_image.jpg')
    user.image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    user
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
