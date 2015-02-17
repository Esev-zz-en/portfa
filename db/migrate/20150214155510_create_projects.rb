class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.belongs_to :user, index: true
      t.string :title
      t.string :slug
      t.text :content
      t.date :release_date
      t.timestamps null: false
    end

    add_index :projects, [:user_id, :slug], unique: true
  end
end
