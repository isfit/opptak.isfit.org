class CreateParliaments < ActiveRecord::Migration
  def change
    create_table :parliaments do |t|
    	t.string :name
    	t.string :email
    	t.integer :phone
    	t.integer :years_work_lost
    	t.string :place_of_study
    	t.string :remember_date
    	t.string :why_attend


    	t.timestamps
    end
  end
end
