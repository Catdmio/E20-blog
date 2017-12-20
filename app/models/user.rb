class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

# El tipo de dato es entero, pero con el indice del array lo asocia
# a símbolos: ej
  enum role: [:admin, :visit]
end
