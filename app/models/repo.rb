class Repo < ApplicationRecord
  belongs_to :user

  validates :owner, presence: :true
  validates :name, presence: :true
end