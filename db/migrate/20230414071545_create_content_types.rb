class CreateContentTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :content_types do |t|
      t.string :content_type, null: false
      t.text :description, null: false
      t.text :template, null: false

      t.timestamps
    end
  end
end
