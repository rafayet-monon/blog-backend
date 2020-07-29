class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # validates :username, uniqueness: { case_sensitive: false }, presence: true, allow_blank: false, format: { with: /\A[a-zA-Z0-9]+\z/ }
  has_many :blogs

  def generate_jwt
    JWT.encode({ id: id,
                 exp: 10.minutes.from_now.to_i },
               Rails.application.credentials[:jwt_secret_key])
  end
end
