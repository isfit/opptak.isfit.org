class ChangeHowHearAboutDayDatatype < ActiveRecord::Migration
  def up
  	change_table :parliaments do |t|
  		t.change :how_hear_about_day , :string
  	end
  end

  def down
  	change_table :parliaments do |t|
  		t.change :how_hear_about_day , :integer
  	end
  end
end
