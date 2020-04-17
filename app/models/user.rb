class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

  attachment :profile_image # _idは不要

  has_many :books, dependent: :destroy

  validates :name, presence: true, length: { in: 2..20 }
  validates :introduction, length: { maximum: 50 }
end
