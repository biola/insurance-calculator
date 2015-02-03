class CreateChildCoverages < ActiveRecord::Migration
  def change
    create_table :child_coverages do |t|
      t.integer :amount
      t.decimal :premium, precision: 4, scale: 2

      t.timestamps
    end
  end
end
