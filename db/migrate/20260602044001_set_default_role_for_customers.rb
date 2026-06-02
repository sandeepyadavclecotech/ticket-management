class SetDefaultRoleForCustomers < ActiveRecord::Migration[7.1]
  def change
    change_column_default :customers, :role, from: nil, to: "customer"
  end
end

