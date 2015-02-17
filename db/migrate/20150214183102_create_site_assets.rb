class CreateSiteAssets < ActiveRecord::Migration
  def change
    create_table :site_assets do |t|
      t.belongs_to :site, index: true
      t.string :name
      t.string :extension
      t.text :content

      t.timestamps null: false
    end
  end
end
