class ApplicationController < ActionController::Base
  UnauthorizatedRequestError = Class.new StandardError

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  respond_to :html

  rescue_from UnauthorizatedRequestError, with: :redirect_to_sign_in

private

  def authorize_envelope(uuid)
    envelope = Envelope.find_by! uuid: uuid
    @envelope_uuid = envelope.uuid
    raise UnauthorizatedRequestError, envelope_uuid: @envelope_uuid unless session[:envelope_uuid] == @envelope_uuid
    envelope
  end

  def redirect_to_sign_in(e)
    redirect_to new_envelope_session_path(@envelope_uuid)
  end

  def grant_authorization(envelope)
    session[:envelope_uuid] = envelope.uuid if envelope
  end

end
