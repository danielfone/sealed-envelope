require 'rails_helper'

RSpec.feature 'Seal creation' do
  let!(:envelope) { create :envelope, password: 'password' }

  background do
    visit url_for envelope
    fill_in 'Password', with: 'password'
    click_on "Unlock"
  end

  scenario 'An envelope owner adds a seal' do
    fill_in 'Seal name', with: 'New Seal'
    click_on 'Create Seal'
    expect(page).to have_content /New Seal .{14} Sealed/
    expect(page).to have_link "New Seal"
  end

end
