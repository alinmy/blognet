class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable,:confirmable, :validatable
         has_many :posts 
         has_many :comments
       validates :username, presence: :true, uniqueness: { case_sensitive: false }
end
