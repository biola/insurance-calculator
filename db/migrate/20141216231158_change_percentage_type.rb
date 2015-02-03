class ChangePercentageType < ActiveRecord::Migration
  def change
    change_column :rates, :percentage, :decimal, precision: 4, scale: 2
  end
end
