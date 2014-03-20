class Applicant < ActiveRecord::Base
  belongs_to :applicant_user

  validates_presence_of :firstname
  validates_presence_of :lastname
  validates_format_of :mail, 
  :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates_format_of :phone, :with => /\A\d{8}\z/
  validates_presence_of :information 
  validates_presence_of :background 
  validates_presence_of :heardof
  validates_numericality_of :position_id_1, :greater_than => 0


  def self.validate_field(field, value)
    validity = Applicant.new(field => value)
    validity.valid?
    if validity.errors.on field
      ajaxResponse = {:valid => false, field.to_sym => validity.errors[:field]}
    else
      ajaxResponse = {:valid => true}
    end
  end

  def lock
    self.locked = true
    self.save
  end

  def full_name
    "#{firstname} #{lastname}"
  end
end