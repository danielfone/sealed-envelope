require 'rails_helper'

RSpec.feature 'Seal deletion' do
  let!(:envelope) { create :envelope, password: 'password' }
  let!(:seal) { create :seal, envelope: envelope, name: 'New seal' }

  background do
    visit url_for envelope
    fill_in 'Password', with: 'password'
    click_on "Authorize"
  end

  scenario 'An envelope owner deletes a seal' do
    expect(page).to have_content /New seal .{14} Sealed/
    click_on 'Delete'
    expect(page).not_to have_content /New Seal/
  end

end
