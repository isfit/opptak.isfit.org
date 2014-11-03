class ChangeIsfitParliaments < ActiveRecord::Migration
  def up
	  	remove_column :isfit_parliaments, :phone
	  	add_column :isfit_parliaments, :why_ip_relevant, :string
	  	add_column :isfit_parliaments, :what_study, :string
	  	add_column :isfit_parliaments, :how_hear_about_day, :integer #få inn integer til string i hash
	  	add_column :isfit_parliaments, :how_corrupt, :integer
	  	add_column :isfit_parliaments, :had_cimilar_experience, :integer
	  	add_column :isfit_parliaments, :how_corrupt_tgi, :integer
  end

  def down
  	create_column :isfit_parliaments, :phone
  	remove_column :isfit_parliaments, :why_ip_relevant, :string
  	remove_column :isfit_parliaments, :what_study, :string
  	remove_column :isfit_parliaments, :how_hear_about_day, :integer
  	remove_column :isfit_parliaments, :how_corrupt, :integer  	  	
  	remove_column :isfit_parliaments, :had_cimilar_experience, :integer
		remove_column :isfit_parliaments, :how_corrupt_tgi, :integer
  end
end
