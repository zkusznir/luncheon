require 'rails_helper'

feature 'Orders listing' do
  background do
    create(:meal)
  end

  scenario 'User visits main page' do
    visit root_path
    expect(page).to have_content('Burger Love (Delivered)')
    expect(page).to have_content('Gonzales 21.5')
  end

  scenario 'User adds a new order' do
    visit root_path
    fill_in 'Restaurant name', with: 'Osiem misek'
    click_button 'Add'
    expect(page).to have_css '#order-form', text: ''
    expect(page).to have_content 'Osiem misek'
  end
end
