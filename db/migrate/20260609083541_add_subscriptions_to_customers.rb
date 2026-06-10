class AddSubscriptionsToCustomers < ActiveRecord::Migration[7.1]
  def change
    add_column :customers, :subscription_id, :string
  end
end
