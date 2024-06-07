class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  VALIDATE_PASSWORD_REGEX=/\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{2,}\z/i.freeze
  VALIDATE_KATAKANA_REGEX=/\p{katakana}/.freeze
  validates :password ,format:{
    with: VALIDATE_PASSWORD_REGEX,
    message: 'は半角英数字混合で設定してください。'
  }
  validates :nickname ,presence: true
  validates :family_name ,presence: true
  validates :first_name ,presence: true
  validates :family_name_kana ,presence: true,format:{
    with: VALIDATE_KATAKANA_REGEX,
    message: 'はカタカナで設定してください。',
    allow_blank: true
  }
  validates :first_name_kana ,presence: true,format:{
    with: VALIDATE_KATAKANA_REGEX,
    message: 'はカタカナで設定してください。',
    allow_blank: true
  }
  validates :dob ,presence: true

end
