require 'rails_helper'

RSpec.feature 'Envelope management' do
  let!(:envelope) { create :envelope, password: 'password', contents: "FOO CONTENT" }

  scenario "A visitor updates an existing envelope" do
    visit url_for envelope
    expect(page).to have_content "Access denied"

    fill_in 'Password', with: 'password'
    click_on 'Authorize'
    expect(page).to have_content "FOO CONTENT"
    pending
    fill_in "Content", with: 'UPDATED CONTENT'
    click_on 'Save'

    expect(page).to have_content "UPDATED CONTENT"
  end


end
