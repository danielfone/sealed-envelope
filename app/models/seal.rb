class Seal < ActiveRecord::Base
  scope :broken, -> { where(sealed: false) }

  belongs_to :envelope
  before_create :generate_token

  validates_presence_of :name

  after_create :reload # so we've got our UUID

  def envelope_name
    envelope.name
  end

  def notification_email
    envelope.owner_email
  end

  def formatted_token
    token.scan(/.{1,4}/).join(' ')
  end

  def to_param
    uuid
  end

  def contents
    envelope.contents
  end

  def build_opening(attrs={})
    SealOpening.new attrs.merge seal: self
  end

private

  def generate_token
    self.token ||= SecureRandom.hex(6)
  end

end
