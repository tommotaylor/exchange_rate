class CreateConversions < ActiveRecord::Migration[5.0]
  def change
    create_table :conversions do |t|
      t.date :date
      t.integer :usd_amount
      t.integer :euro_amount
      t.belongs_to :rate, index: true

      t.timestamps
    end
  end
end
