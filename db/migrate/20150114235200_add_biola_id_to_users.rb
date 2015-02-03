class AddBiolaIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :biola_id, :integer
  end
end