class SealsController < ApplicationController

  def show
    @seal = Seal.find_by! uuid: params[:id]
    @opening = @seal.build_opening
  end

  def create
    envelope.seals.create params.require(:seal).permit :name
    respond_with @envelope
  end

  def opening
    @seal = Seal.find_by! uuid: params[:seal_id]
    @opening = @seal.build_opening params[:seal_opening]
    @opening.perform

    respond_with @opening, location: [@seal, :contents], action: :show
  end

  def contents
    @seal = Seal.broken.find_by! uuid: params[:seal_id]
  end

private

  def envelope
    @envelope ||= Envelope.find_by! uuid: params[:envelope_id]
  end
end
