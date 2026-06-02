class AddRoleToCustomers < ActiveRecord::Migration[7.1]
  def change
    add_column :customers, :role, :string
  end
end
