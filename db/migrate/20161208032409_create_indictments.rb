class CreateIndictments < ActiveRecord::Migration[5.0]
  def change
    create_table :indictments do |t|
      t.integer :accuser_id
      t.integer :indicted_id
      t.timestamps
    end
  end
end
