class SessionsController < ApplicationController

  def new
    @session = Session.new envelope_uuid: params[:envelope_id]
  end

  def create
    @session = Session.new params[:session]
    grant_authorization @session.authorized_envelope
    respond_with @session, location: envelope_path(@session.envelope_uuid)
  end

  def destroy
    revoke_authorization
    redirect_to envelope_path(params[:envelope_id])
  end

end
