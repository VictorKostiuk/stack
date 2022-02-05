feature 'User sign up', %q{
  In order to be able to ask the question
  As an user
  I want to be able to sign up
} do

  given(:user) { FactoryBot.create(:user, password: '12345678', password_confirmation: '12345678') }

  scenario 'Successfully sign up' do
    sign_up

    expect(page).to have_content "Welcome! You have signed up successfully."
    expect(current_path).to eq root_path
  end

  scenario 'Not successful sign up' do

    visit new_user_registration_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: '12345678'
    fill_in 'Password confirmation', with: '12345678'
    click_on 'Sign up'

    expect(page).to have_content "Email has already been taken"
    expect(current_path).to eq user_registration_path
  end
end