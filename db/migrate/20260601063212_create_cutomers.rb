class CreateCutomers < ActiveRecord::Migration[7.1]
  def change
    create_table :cutomers do |t|

      t.timestamps
    end
  end
end
