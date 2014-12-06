class StringToTextInParliaments < ActiveRecord::Migration
  def change
    change_column :parliaments, :why_ip_relevant, :text, :limit => nil
    change_column :parliaments, :why_attend, :text, :limit => nil
  end
end
