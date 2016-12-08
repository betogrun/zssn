class UpdateColumnIsInfected < ActiveRecord::Migration[5.0]
  def change
    change_column_null(:survivors, :is_infected, false)
    change_column_default(:survivors, :is_infected, false)
  end
end
