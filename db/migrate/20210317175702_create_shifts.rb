class CreateShifts < ActiveRecord::Migration[6.0]
  def change
    create_table :shifts do |t|
      t.boolean :shift_status
      t.string :role_name
      t.datetime :shift_start
      t.datetime :shift_end
      t.integer :shift_pay

      t.timestamps
    end
  end
end
