class ApplicantUser < ActiveRecord::Base
    #attr_accessible :mail, :password_digest
    #attr_accessible :mail, :password_digest

  has_secure_password
  validates :mail,
              presence: true,
              uniqueness: true,
              format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

  has_one :applicant

  def set_password
  	self.password = random_password
    self.password_confirmation = self.password
    self.password
  end


  def application_any?
    self.applicant.nil?
  end

  private
  def random_password(size = 8)
  	chars = ['A'..'Z', 'a'..'z', '0'..'9'].collect(&:to_a).reduce(:+)
  	difficult_chars = %w(i o O 1 I l 0)
  	chars = chars - difficult_chars

    Array.new(size).collect { chars.sample }.join 
  end
end