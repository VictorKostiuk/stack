require 'faker'

module FeatureHelpers
  def log_in(user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: '12345678'
    click_on 'Log in'
  end

  def sign_up
    visit new_user_registration_path
    fill_in 'Email', with: Faker::Internet.unique.email
    fill_in 'Password', with: '12345678'
    fill_in 'Password confirmation', with: '12345678'
    click_on 'Sign up'
  end
end