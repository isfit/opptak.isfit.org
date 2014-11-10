class ChangeParliaments < ActiveRecord::Migration
  def up
	  	remove_column :parliaments, :phone
	  	add_column :parliaments, :why_ip_relevant, :string
	  	add_column :parliaments, :what_study, :string
	  	add_column :parliaments, :how_hear_about_day, :integer #få inn integer til string i hash
	  	add_column :parliaments, :how_corrupt, :integer
	  	add_column :parliaments, :had_cimilar_experience, :integer
	  	add_column :parliaments, :how_corrupt_tgi, :integer
  end

  def down
  	create_column :parliaments, :phone
  	remove_column :parliaments, :why_ip_relevant, :string
  	remove_column :parliaments, :what_study, :string
  	remove_column :parliaments, :how_hear_about_day, :integer
  	remove_column :parliaments, :how_corrupt, :integer  	  	
  	remove_column :parliaments, :had_cimilar_experience, :integer
		remove_column :parliaments, :how_corrupt_tgi, :integer
  end
end
