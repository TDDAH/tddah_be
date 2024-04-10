class Achievement < ApplicationRecord
  validates :criteria, presence: :true
  validates :name, presence: :true
  has_many :repo_achievements
  has_many :repos, through: :repo_achievements
end
