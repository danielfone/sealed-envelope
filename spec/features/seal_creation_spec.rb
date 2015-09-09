require 'rails_helper'

RSpec.feature 'Seal creation' do
  let!(:envelope) { create :envelope }

  background do
    visit url_for envelope
  end

  scenario 'An envelope owner adds a seal' do
    fill_in 'Name', with: 'New Seal'
    click_on 'Create Seal'
    expect(page).to have_content /New Seal .{14} Sealed/
    expect(page).to have_link url_for envelope.seals.first
  end

end
