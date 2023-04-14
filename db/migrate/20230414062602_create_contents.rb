class CreateContents < ActiveRecord::Migration[7.0]
  def change
    create_table :contents do |t|
      t.text :business_ideal_customer
      t.text :business_problem_solved
      t.string :output_language
      t.string :content_topic
      t.integer :topic_quantity
      t.text :business_customer_subtype
      t.string :business_customer_subtype_needs
      t.text :business_customer_subtype_result

      t.timestamps
    end
  end
end
