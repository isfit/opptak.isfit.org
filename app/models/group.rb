class Group < ActiveRecord::Base
  self.primary_key = 'id'
  #lang_attr :name
  belongs_to :section
  has_and_belongs_to_many :positions
  def name
	I18n.locale.to_s.eql?("no") ? self.name_no : self.name_en
  end
end