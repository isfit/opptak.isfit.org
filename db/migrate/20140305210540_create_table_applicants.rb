class CreateTableApplicants < ActiveRecord::Migration
  def change
    create_table :applicants do |t|
    	t.string :firstname
    	t.string :lastname
    	t.string :mail
    	t.integer :phone
    	t.text :information
    	t.text :background
    	t.text :heardof
    	t.integer :position_id_1
    	t.integer :position_id_2
    	t.integer :position_id_3
    	t.integer :status, :default => 0
    	t.text :comment
    	t.string :interview_place_1
    	t.string :interview_place_2
    	t.string :interview_place_3
    	t.datetime :interview_time_1
    	t.datetime :interview_time_2
    	t.datetime :interview_time_3
    	t.integer :interviewer_id_1_1
    	t.integer :interviewer_id_1_2
    	t.integer :interviewer_id_2_1
    	t.integer :interviewer_id_2_2
    	t.integer :interviewer_id_3_1
    	t.integer :interviewer_id_3_1
    	t.boolean :deleted, :default => 0
    	t.string :username
    	t.string :password
    	t.string :dn
    	t.boolean :has_account, :default => 0
    	t.integer :is_notified, :default => 0
    	t.string :birthyear
    	t.string :place_of_study
    	t.integer :applicant_user_id
    	t.boolean :locked
    	t.timestamps
    end
  end
end
