require 'rails_helper'

feature 'Meals management' do
  background do
    create(:order)
    login
  end

  scenario 'User adds a meal to order' do
    expect(page).to have_content 'Total: 0.00 zł'
    submit_meal_form('Classic', '18.5')
    expect(page).to have_css '#meal-form__name', text: ''
    expect(page).to have_css '#meal-form__price', text: ''
    expect(page).to have_content 'Classic'
    expect(page).to have_content '18.50 zł'
    expect(page).to have_content 'Total: 18.50 zł'
  end

  scenario 'User cannot add a meal to the same order more than once' do
    submit_meal_form('Classic', '18.5')
    submit_meal_form('Classic', '18.5')
    expect(page).to have_content 'You have already ordered something here!'
    expect(page).to have_content 'Classic', count: 1
    expect(page).to have_content '18.50 zł', count: 2
  end

  scenario 'User cannot add a meal to closed order' do
    expect(page).to have_css '#meal-form__name', count: 0
  end

  scenario 'User submits a meal without required fields' do
    click_button 'Add'
    expect(page).to have_content 'Please fill in both name and price fields'
    fill_in 'meal-form__name', with: 'Classic'
    click_button 'Add'
    expect(page).to have_content 'Please fill in both name and price fields'
    fill_in 'meal-form__price', with: '18.5'
    click_button 'Add'
    expect(page).not_to have_content 'Please fill in both name and price fields'
  end

  scenario 'User submits a meal with not numerical price' do
    submit_meal_form('Classic', 'Price')
    expect(page).to have_content 'Price has to be numerical'
    fill_in 'meal-form__price', with: '18.5'
    click_button 'Add'
    expect(page).not_to have_content 'Price has to be numerical'
  end

  scenario 'User submits a meal with non-positive price value' do
    submit_meal_form('Classic', '-3')
    expect(page).to have_content 'Price has to be greater than 0'
    fill_in 'meal-form__price', with: '18.5'
    click_button 'Add'
    expect(page).not_to have_content 'Price has to be greater than 0'
  end

  scenario 'User submits a meal with price of more than 2 decimal places' do
    submit_meal_form('Classic', '18.2222')
    expect(page).to have_content '18.22 zł'
  end

  scenario 'Multiple users add meals and total price is evaluated' do
    submit_meal_form('Classic', '18.5')
    expect(page).to have_content '18.50 zł'
    click_link 'Log out'
    configure_omniauth('987654321', 'Lucky Luke')
    login
    submit_meal_form('Gonalzes', '22')
    expect(page).to have_content '40.50 zł'
  end
end
