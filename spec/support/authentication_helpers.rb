module AuthenticationHelpers
  def sign_in_as!(user)
    visit '/login'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'secret'
    click_button 'Login'
  end

  def login_as_admin
    admin = create(:admin_user, password: 'test123', password_confirmation: 'test123')
    visit spree.admin_path
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: 'test123'
    click_button 'Login'
    admin
  end
end

RSpec.configure do |config|
  config.include AuthenticationHelpers, type: :feature
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include Rack::Test::Methods, type: :feature
end
