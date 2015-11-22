class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :first_name
      t.string :last_name
      t.integer :bowling_type
      t.integer :batting_hand
      t.integer :bowling_hand
      t.boolean :keeper
      t.text :teams

      t.timestamps null: false
    end
  end
end
