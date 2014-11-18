class AddColumnOtherToHowHearAboutDay < ActiveRecord::Migration
def change
	add_column :parliaments, :how_hear_about_day_other, :string
end
end
