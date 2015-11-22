class ChangeColumnTypes < ActiveRecord::Migration
  def change
    change_column :players,:bowling_type,:string
    change_column :players,:batting_hand,:string
    change_column :players,:bowling_hand,:string
  end
end
