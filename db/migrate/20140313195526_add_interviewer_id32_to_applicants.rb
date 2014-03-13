class AddInterviewerId32ToApplicants < ActiveRecord::Migration
  def change
  	add_column :applicants, :interviewer_id_3_2, :integer, after: :interviewer_id_3_1
  end
end
