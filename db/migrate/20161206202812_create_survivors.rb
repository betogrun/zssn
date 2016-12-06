class CreateSurvivors < ActiveRecord::Migration[5.0]
  def change
    create_table :survivors do |t|
      t.string :name
      t.integer :age
      t.integer :gender
      t.string :location, array:true, default: []
      t.boolean :is_infected
      t.integer :complaints

      t.timestamps
    end
  end
end
