class CreateAlerts < ActiveRecord::Migration[7.0]
  def change
    create_table :alerts do |t|
      t.integer :user_id
      t.string :coin_symbol
      t.decimal :target_price
      t.string :status

      t.timestamps
    end
  end
end
