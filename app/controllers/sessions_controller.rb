class SessionsController < ApplicationController

  def new
    @session = Session.new envelope_uuid: params[:envelope_id]
  end

  def create
    @session = Session.new params[:session]
    grant_authorization @session.authorized_envelope
    respond_with @session, location: envelope_path(@session.envelope_uuid)
  end

end
