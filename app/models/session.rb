class Session
  include ActiveModel::Model

  attr_accessor :envelope_uuid, :password

  validates_presence_of :password

  def authorized_envelope
    return unless valid?

    envelope.authenticate(password).tap do |successful|
      errors.add :password, :incorrect if ! successful
    end
  end

private

  def envelope
    @envelope ||= Envelope.find_by! uuid: envelope_uuid
  end

end
