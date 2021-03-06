require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder

  include EnvelopeAuthorization

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  respond_to :html
end
