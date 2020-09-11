class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nick_name, :family_name, :first_name, :birthday presence: 
    validates :email, uniqueness: 
    validates :email, inclusion: { in: %w(draft publish private) }
    validates :password, length: { minimum: 6 }
    validates :password, hankakueisuu:
    validates :password, nikainyuuryoku:
    validates :family_name, :first_name, format: {with: /\A[ぁ-んァ-ン一-龥]+\z/}
    validates :family_name, :first_name, hurugana:
    #validates :name_reading, format:{with: /\A[ァ-ヶー－]+\z/}
  end

end
