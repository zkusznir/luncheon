require 'rails_helper'

feature 'Logging in' do
  background do
    configure_omniauth
  end

  scenario 'User visits main page not being logged in' do
    visit root_path
    expect(page).to have_content 'You have to be logged in to enter!'
  end

  scenario 'User logs in' do
    login
    expect(page).to have_content 'John Doe'
    expect(User.last.name).to eq 'John Doe'
  end

  scenario 'User logs out' do
    login
    click_link 'Log out'
    expect(page).to have_content 'You have to be logged in to enter!'
  end

  scenario 'Unauthorized user attempts to request resources' do
    visit '/orders'
    expect(page).to have_content 'You have to be logged in to enter!'
    expect(page).not_to have_content 'New order'
    visit '/orders/1/meals'
    expect(page).to have_content 'You have to be logged in to enter!'
  end
end
