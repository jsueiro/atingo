# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation
  has_secure_password

  validates :name, 
  			presence: true, 
  			length: { maximum: 50 } #valida que este presente el name
  

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, 
  			presence: true, 
  			format: { with: VALID_EMAIL_REGEX }, 
  			uniqueness: { case_sensitive: false }

   # callback
   before_save { |user| user.email = email.downcase } #nos aseguramos que se guarde como lowercase  			

   validates :password, presence: true, length: { minimum: 6 }
   validates :password_confirmation, presence: true

end