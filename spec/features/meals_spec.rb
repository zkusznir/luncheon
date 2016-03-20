require 'rails_helper'

feature 'Meals management' do
  background do
    login
  end

  scenario 'User adds a meal to order' do
    create(:order)
    fill_in 'meal-form__name', with: 'Classic'
    fill_in 'meal-form__price', with: '18.5'
    click_button 'Add'
    expect(page).to have_css '#meal-form__name', text: ''
    expect(page).to have_css '#meal-form__price', text: ''
    expect(page).to have_content 'Classic'
    expect(page).to have_content '18.5 zł'
  end

  scenario 'User cannot add a meal to the same order more than once' do
    create(:meal)
    fill_in 'meal-form__name', with: 'Classic'
    fill_in 'meal-form__price', with: '18.5'
    click_button 'Add'
    expect(page).to have_content 'Classic', count: 1
    expect(page).to have_content '18.5 zł', count: 1
  end

  scenario 'User cannot add a meal to closed order' do
    create(:order)
    expect(page).to have_css '#meal-form__name', count: 0
  end

  scenario 'User submits a meal without required fields' do
    create(:order)
    click_button 'Add'
    expect(page).to have_content 'Please fill in both name and price fields!'
    fill_in 'meal-form__name', with: 'Classic'
    click_button 'Add'
    expect(page).to have_content 'Please fill in both name and price fields!'
    fill_in 'meal-form__price', with: '18.5'
    click_button 'Add'
    expect(page).not_to have_content 'Please fill in both name and price fields!'
  end

  scenario 'User submits a meal with invalid price' do
    create(:order)
    fill_in 'meal-form__name', with: 'Classic'
    fill_in 'meal-form__price', with: 'Price'
    click_button 'Add'
    expect(page).to have_content 'Price has to be numerical!'
    fill_in 'meal-form__price', with: '18.5'
    click_button 'Add'
    expect(page).not_to have_content 'Price has to be numerical!'
  end
end
