class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 15}
                     
 VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}
  
  has_secure_password
   VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])[a-z\d]{8,32}+\z/
   validates :password, presence: true, length: { minimum: 6, maximum: 32 } ,format: { with: VALID_PASSWORD_REGEX}         
end

user = User.find_by(params[:email])
if user && user.authenticate(params[:password])
end