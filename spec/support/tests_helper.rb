module TestsHelper
  def configure_omniauth
    OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new(
      uid: '123456789',
      info: { name: 'John Doe' }
    )
  end

  def login
    visit root_path
    click_link 'Log in with Facebook'
  end
end

RSpec.configure do |config|
  config.include TestsHelper, type: :feature
end
