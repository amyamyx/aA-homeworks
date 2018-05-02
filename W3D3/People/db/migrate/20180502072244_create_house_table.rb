class CreateHouseTable < ActiveRecord::Migration[5.1]
  def change
    create_table :houses do |t|
      t.timestamps
      t.string :address, null: false
    end
  end
end
