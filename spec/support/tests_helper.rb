module TestsHelper
  def configure_omniauth
    OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new(
      uid: '123456789',
      info: { name: 'John Doe' }
    )
  end

  def login
    visit '/'
    click_link 'Log in with facebook'
  end
end

RSpec.configure do |config|
  config.include TestsHelper, type: :feature
end
