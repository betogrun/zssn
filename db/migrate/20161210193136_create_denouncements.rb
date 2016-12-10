class CreateDenouncements < ActiveRecord::Migration[5.0]
  def change
    create_table :denouncements do |t|
      t.references :survivor, foreign_key: true
      t.integer :denounced_id

      t.timestamps
    end
  end
end
