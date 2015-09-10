require 'rails_helper'

RSpec.feature 'Seal deletion' do
  let!(:envelope) { create :envelope }
  let!(:seal) { create :seal, envelope: envelope, name: 'New seal' }

  background do
    visit url_for envelope
  end

  scenario 'An envelope owner adds a seal' do
    expect(page).to have_content /New seal .{14} Sealed/
    click_on 'Delete'
    expect(page).not_to have_content /New Seal/
  end

end
