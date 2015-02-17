class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.belongs_to :site, index: true
      t.boolean :deletable, default: true
      t.string :title
      t.string :description
      t.string :slug
      t.text :content
      t.timestamps null: false
    end

    add_index :pages, [:site_id, :slug], unique: true
  end
end
