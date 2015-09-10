class SealsController < ApplicationController

  def show
    @seal = Seal.find_by! uuid: params[:id]
    @opening = @seal.build_opening
  end

  def create
    @seal = envelope.seals.create params.require(:seal).permit :name
    respond_with @seal, location: @seal.envelope
  end

  def destroy
    @seal = envelope.seals.find_by! uuid: params[:id]
    @seal.destroy
    respond_with @seal, location: @seal.envelope
  end

  def opening
    @seal = Seal.find_by! uuid: params[:seal_id]
    @opening = @seal.build_opening params[:seal_opening]
    @opening.perform

    # What do we do once they break the seal?
    # We could redirect them back to seals#show and
    # add logic to the view to test if a seal's been broken
    # if seal.opened? -> show contents
    # else show form?
    #
    # This seems risky, since the *fundamental* business logic of the applicatio
    # is reduced to templating logic. WAY easier to accidentally break this and
    # harder to test since the difference is between a view with the contents and
    # a view without the contents.
    # Any test that is expect a page NOT to have content is easy to accidentally mess up
      # i.e. pass while inadvertantly revealing the content
      # there's an infinite number of scenarios that will pass that test
      # and exactly one that will fail it
      # c.f. the solution below, where ONLY if the action 404s will the test pass
    #
    # Instead, we'll redirect them to a subresource (another action on this controller)
    # In this action, we can scope our seal lookup to only be broken seals
    # and we can have a completely different view/template for rendering the content
    # with no logic. This is also much easier to test, since the difference
    # is now between a 404 and a 200 with envelope contents.
    #
    # It's now very hard to accidentally reveal the content when a user views the seal
    # and even if the user visits the `contents` url without officially breaking the seal
    # they'll get a 404.
    #
    # The failure case is really explicit here.
    respond_with @opening, location: [@seal, :contents], action: :show
  end

  def contents
    @seal = Seal.broken.find_by! uuid: params[:seal_id]
  end

private

  def envelope
    @envelope ||= authorize_envelope params[:envelope_id]
  end
end
