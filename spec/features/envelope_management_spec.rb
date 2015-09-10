require 'rails_helper'

RSpec.feature 'Envelope management' do
  let!(:envelope) { create :envelope, password: 'password', contents: "FOO CONTENT" }

  scenario "A visitor updates an existing envelope" do
    visit url_for envelope
    expect(page).to have_content "is locked"

    fill_in 'Password', with: 'password'
    click_on 'Unlock'
    expect(page).to have_content "FOO CONTENT"
    fill_in "Content", with: 'UPDATED CONTENT'
    click_on 'Update Envelope'

    expect(page).to have_content "UPDATED CONTENT"
  end


end
