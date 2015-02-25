class CreateProjectImages < ActiveRecord::Migration
  def change
    create_table :project_images do |t|
      t.belongs_to :project, index: true
      t.string :url
      t.string :title
      t.string :description
      t.timestamps null: false
    end
  end
end
