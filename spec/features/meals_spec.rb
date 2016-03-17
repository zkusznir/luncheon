require 'rails_helper'

feature 'Meals management' do
  background do
    login
  end

  scenario 'User adds a meal to order' do
    create(:order)
    fill_in 'meal-form-name', with: 'Classic'
    fill_in 'meal-form-price', with: '18.5'
    click_button 'Add'
    expect(page).to have_css '#meal-form-name', text: ''
    expect(page).to have_css '#meal-form-price', text: ''
    expect(page).to have_content 'Classic 18.5'
  end

  scenario 'User cannot add a meal to the same order more than once' do
    create(:meal)
    fill_in 'meal-form-name', with: 'Classic'
    fill_in 'meal-form-price', with: '18.5'
    click_button 'Add'
    expect(page).to have_content 'Classic 18.5', count: 1
  end

  scenario 'User cannot add a meal to closed order' do
    create(:order, status: 'Delivered')
    expect(page).to have_css '#meal-form-name', count: 0
  end

  scenario 'User changes order status' do
    create(:order, status: 'Delivered')
    expect(page).to have_button 'Add'
    select 'Finalized', from: 'order-status'
    expect(page).not_to have_button 'Add'
    expect(page).to have_select 'order-status', selected: 'Finalized'
  end
end
