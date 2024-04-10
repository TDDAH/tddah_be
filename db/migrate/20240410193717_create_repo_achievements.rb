class CreateRepoAchievements < ActiveRecord::Migration[7.1]
  def change
    create_table :repo_achievements do |t|
      t.references :repo, null: false, foreign_key: true
      t.references :achievement, null: false, foreign_key: true

      t.timestamps
    end
  end
end
