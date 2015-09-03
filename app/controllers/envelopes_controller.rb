class EnvelopesController < ApplicationController

  def show
    @envelope = Envelope.find_by! uuid: params[:id]
  end

  def new
    @envelope = Envelope.new
  end

  def create
    @envelope = Envelope.new
    @envelope.update_attributes envelope_params
    respond_with @envelope
  end

private

  def envelope_params
    params.require(:envelope).permit :name, :contents, :password, :owner_email
  end
end
