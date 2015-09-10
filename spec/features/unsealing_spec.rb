require 'rails_helper'

RSpec.feature 'Unsealing' do
  let!(:envelope) { create :envelope, contents: "A SECRET", name: "Test envelope", owner_email: 'test@example.com' }
  let!(:seal) { create :seal, token: '1234', envelope: envelope, name: 'test seal' }

  background do
    visit url_for seal
  end

  scenario 'An visitor views a seal' do
    expect(page).to have_content /Test envelope .* test seal/
  end

  scenario 'An visitor unseals an envelope' do
    fill_in 'Token', with: '1234'
    click_on 'Open'
    expect(page).to have_content 'A SECRET'

    open_email 'test@example.com'
    expect(current_email.subject).to eq "The 'test seal' seal was broken on 'Test envelope'"
  end

  scenario 'An visitor unsuccessfully attempts to unseal an envelope' do
    fill_in 'Token', with: 'foo'
    click_on 'Open'
    expect(page).to have_content 'is invalid'
  end

end
