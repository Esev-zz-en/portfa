class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.belongs_to :user, index: true
      t.string :title
      t.string :description
      t.timestamps null: false
    end
  end
end
