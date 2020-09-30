class User < ApplicationRecord
  has_many :item, dependent: :destroy
  has_many :buys
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :nick_name, :family_name, :first_name, :family_name_kana, :first_name_kana, :birthday # ニックネーム、苗字、名前、生年月日は必須
  end
  validates :password, format: {with: /\A[a-zA-Z0-9]+\z/} #パスワードは半角英数字。
  validates :family_name, :first_name, format: {with: /\A[ぁ-んァ-ン一-龥]+\z/} # 本名は全角（漢字・ひらがな・カタカナ）で入力
  validates :family_name_kana, :first_name_kana, format: {with: /\A[ァ-ヶー－]+\z/}
  year_month_day = /\A\d{4}-\d{2}-\d{2}\z/
  validates :birthday, presence: true, format: { with: year_month_day }
end
