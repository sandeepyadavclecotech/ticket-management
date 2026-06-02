class RemoveTicketnumberFromTickets < ActiveRecord::Migration[7.1]
  def change
    remove_column :tickets, :ticketnumber, :integer
  end
end
