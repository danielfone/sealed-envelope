class Envelope < ActiveRecord::Base
  has_secure_password
  has_many :seals

  validates :owner_email, {
    presence: true,
    format: /.+@.+/
  }

  after_create :reload # so we've got our UUID

  def to_param
    uuid
  end

end
