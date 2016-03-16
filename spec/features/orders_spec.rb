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
end
