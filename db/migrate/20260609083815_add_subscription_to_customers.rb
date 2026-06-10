class AddSubscriptionToCustomers < ActiveRecord::Migration[7.1]
  def change
    
    add_column :customers, :subscription_status, :string
    add_column :customers, :subscription_end_date, :datetime
  end
end
