module TestsHelper
  def configure_omniauth(uid = '123456789', name = 'John Doe')
    OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new(
      uid: uid,
      info: { name: name }
    )
  end

  def login
    visit root_path
    click_link 'Log in with Facebook'
  end

  def submit_meal_form(name, price)
    fill_in 'meal-form__name', with: name
    fill_in 'meal-form__price', with: price
    click_button 'Add'
  end
end

RSpec.configure do |config|
  config.include TestsHelper, type: :feature
end
