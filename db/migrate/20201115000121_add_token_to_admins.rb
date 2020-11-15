class AddTokenToAdmins < ActiveRecord::Migration[6.0]
  def change
    add_column :admins, :token, :string
  end
end
