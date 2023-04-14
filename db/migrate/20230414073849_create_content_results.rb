class CreateContentResults < ActiveRecord::Migration[7.0]
  def change
    create_table :content_results do |t|
      t.belongs_to :content, null: false, foreign_key: true
      t.text :output_content

      t.timestamps
    end
  end
end
