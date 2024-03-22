class Repo < ApplicationRecord
  it belongs_to :user

  it validates :owner, presence: :true
  it validates :name, presence: :true
end
