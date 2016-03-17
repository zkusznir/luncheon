require 'rails_helper'

feature 'Orders listing' do
  given(:order) { create(:order, restaurant_name: 'Osiem misek') }

  background do
    create(:meal)
    login
  end

  scenario 'User visits main page' do
    expect(page).to have_content 'Burger Love (Delivered)'
    expect(page).to have_content 'Gonzales 21.5'
  end

  scenario 'User adds a new order' do
    fill_in 'Restaurant name', with: order.restaurant_name
    click_button 'Add'
    expect(page).to have_css '#order-form', text: ''
    expect(page).to have_content 'Osiem misek'
  end
end
