class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.integer :amount
      t.integer :type
      t.references :survivor, foreign_key: true

      t.timestamps
    end
  end
end
