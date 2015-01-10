class AddStatusToParliaments < ActiveRecord::Migration
  def change
  	add_column :parliaments, :status, :integer
  end
end
