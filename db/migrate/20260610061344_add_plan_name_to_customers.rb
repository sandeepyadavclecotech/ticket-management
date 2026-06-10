class AddPlanNameToCustomers < ActiveRecord::Migration[7.1]
  def change
    add_column :customers, :plan_name, :string
  end
end

