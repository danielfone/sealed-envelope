require 'rails_helper'

RSpec.feature 'Envelope creation' do
  scenario 'A visitor creates an envelope' do
    visit '/'
    fill_in 'Name', with: 'Test envelope'
    fill_in 'Owner email', with: 'test@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Content', with: 'Test content'
    click_on 'Save'
    expect(page).to have_content "Test envelope"
    expect(page).to have_content "test@example.com"
    expect(page).to have_content "Test content"
  end
  scenario 'A visitor creates an invalid envelope' do
    visit '/'
    click_on 'Save'
    expect(page).to have_content "can't be blank"
  end
end
