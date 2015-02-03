class CreateRates < ActiveRecord::Migration
  def change
    create_table :rates do |t|
      t.integer :min_age
      t.integer :max_age
      t.float :percentage
      t.string :person_type
      t.boolean :smoking

      t.timestamps
    end
  end
end
