class CreateRepos < ActiveRecord::Migration[7.1]
  def change
    create_table :repos do |t|
      t.string :owner
      t.string :name

      t.timestamps
    end
  end
end
