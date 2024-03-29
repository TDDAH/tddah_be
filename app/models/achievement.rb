class Achievement < ApplicationRecord
  belongs_to :user

  validates :name, presence: :true
  validates :criteria, presence: :true
end