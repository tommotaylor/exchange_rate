class CreateRates < ActiveRecord::Migration[5.0]
  def change
    create_table :rates do |t|
      t.decimal :rate, precision: 5, scale: 4
      t.date :date

      t.timestamps
    end
  end
end
