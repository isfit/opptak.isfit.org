class CreateApplicantUsers < ActiveRecord::Migration
  def change
    create_table :applicant_users do |t|

      t.timestamps
    end
  end
end
