require 'rails_helper'

feature 'Orders management' do
  background do
    create(:meal)
    create(:order)
    create(:order, status: 'Finalized')
    login
  end

  scenario 'User visits main page' do
    expect(page).to have_content 'Burger Love'
    expect(page).to have_content 'Gonzales'
    expect(page).to have_content '21.5'
  end

  scenario 'User adds a new order' do
    fill_in 'Restaurant name', with: 'Osiem misek'
    click_button 'Create order'
    expect(page).to have_css '#order-form', text: ''
    expect(page).to have_content 'Osiem misek'
  end

  scenario 'User selects to view finalized and archived orders' do
    expect(page).to have_css '.order', count: 2
    expect(page).to have_select 'order-status', selected: 'Opened'
    click_button 'History'
    expect(page).to have_select 'order-status', selected: 'Finalized'
    expect(page).not_to have_content 'Gonzales'
    expect(page).to have_css '.order', count: 1
  end

  scenario 'User submits an order with empty restaurant name' do
    click_button 'Create order'
    expect(page).to have_content 'Please fill in the restaurant name'
    fill_in 'Restaurant name', with: 'Osiem misek'
    click_button 'Create order'
    expect(page).not_to have_content 'Please fill in the restaurant name'
  end
end

feature 'Status change' do
  background do
    create(:order)
    login
  end

  scenario 'User changes order status' do
    expect(page).to have_button 'Add'
    select 'Finalized', from: 'order-status'
    expect(page).not_to have_button 'Add'
    expect(page).to have_select 'order-status', selected: 'Finalized'
  end
end
