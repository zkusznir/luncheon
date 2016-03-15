require 'rails_helper'

feature 'Logging in' do
  background do
    configure_omniauth
  end

  scenario 'Log in' do
    login
    expect(page).to have_content 'Hi, John Doe!'
    expect(User.last.name).to eq('John Doe')
  end

  scenario 'Log out' do
    login
    click_link 'Log out'
    expect(page).to have_content 'Bye, bye!'
  end
end
