class User < ApplicationRecord
  has_many :canons
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
