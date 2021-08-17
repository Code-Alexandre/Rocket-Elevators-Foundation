class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable
  has_one :customer
  has_one :employee
  # validate :password_complexity

  # validates :email, format: { with: /\A[A-Za-z0-9-\/\.\s]*\z/,
  # message: "accepts only alphanumeric - . space" }
  # validates :password, format: { with: /\A[A-Za-z0-9-\/\.\s]*\z/,
  # message: "accepts only alphanumeric - . space" }
  # def password_complexity
  #  return if password.blank? || password =~ 
  #   /(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-])/
 
  #  errors.add :password, 'Complexity requirement not met. Please use: 1 uppercase,
  #   1 lowercase, 1 digit and 1 special character'
  # end
  def is_employee?(user)
    if user.employee
      return true
    else
      return false
    end
  end
end
