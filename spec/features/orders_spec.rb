require 'rails_helper'

feature 'Orders listing' do
  background do
    create(:order, status: 'Delivered')
  end

  scenario 'User visits main page' do
    visit root_path
    expect(page).to have_content('Burger Love (Delivered)')
  end
end
