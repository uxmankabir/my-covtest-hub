class CreateHomeTestKits < ActiveRecord::Migration[6.0]
  def change
    create_table :home_test_kits do |t|
      t.string :ttn_code
      t.timestamps
    end
  end
end
