module EnvelopeAuthorization
  extend ActiveSupport::Concern

  UnauthorizatedRequestError = Class.new StandardError

  included do
    rescue_from UnauthorizatedRequestError, with: :redirect_to_sign_in
  end

private

  def redirect_to_sign_in(e)
    redirect_to new_envelope_session_path(e.envelope_uuid)
  end

  def authorize_envelope(uuid)
    envelope = Envelope.find_by! uuid: uuid
    envelope_authorized?(envelope) or raise UnauthorizatedRequestError, envelope
    envelope
  end

  def grant_authorization(envelope)
    session[:envelope_uuid] = envelope.uuid if envelope
  end

  def envelope_authorized?(envelope)
    session[:envelope_uuid] == envelope.uuid
  end

end

class EnvelopeAuthorization::UnauthorizatedRequestError < StandardError
  attr_accessor :envelope

  def initialize(envelope)
    @envelope = envelope
  end

  def envelope_uuid
    envelope.uuid
  end
end
