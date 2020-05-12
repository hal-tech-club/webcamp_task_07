class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :book

  has_many :books, dependent: :destroy
end
