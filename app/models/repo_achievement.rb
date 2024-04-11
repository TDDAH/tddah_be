class RepoAchievement < ApplicationRecord
  belongs_to :repo
  belongs_to :achievement
end
