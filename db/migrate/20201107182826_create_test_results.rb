class CreateTestResults < ActiveRecord::Migration[6.0]
  def change
    create_table :test_results do |t|
      t.string :email
      t.string :full_name
      t.integer :age
      t.integer :gender
      t.string :address
      t.string :post_code
      t.integer :home_test_kit_id
      t.integer :test_result

      t.timestamps
    end
  end
end
