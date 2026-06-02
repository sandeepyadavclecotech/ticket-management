class CreateTickets < ActiveRecord::Migration[7.1]
  def change
    create_table :tickets do |t|
      t.integer :ticketnumber
      t.string :title
      t.string :description
      t.string :status
      t.string :priority
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
