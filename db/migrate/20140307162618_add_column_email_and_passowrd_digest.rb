class AddColumnEmailAndPassowrdDigest < ActiveRecord::Migration
  def change
  	  	add_column :applicant_users, :mail, :string
  	  	add_column :applicant_users, :password_digest, :string
  end
end
