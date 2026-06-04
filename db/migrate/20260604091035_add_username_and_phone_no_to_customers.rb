class AddUsernameAndPhoneNoToCustomers < ActiveRecord::Migration[7.1]
  def change
    add_column :customers, :username, :string
    add_column :customers, :phone_no, :string
  end
end
