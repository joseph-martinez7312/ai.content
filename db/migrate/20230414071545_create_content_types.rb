class CreateContentTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :content_types do |t|
      t.string :content_type
      t.text :description
      t.text :template

      t.timestamps
    end
  end
end
