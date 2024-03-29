feature 'User sign in', %q{
  In order to be able to ask the question
  As an user
  I want to be able to sign in
} do

  given(:user) { FactoryBot.create(:user, password: '12345678', password_confirmation: '12345678') }


  scenario 'Registered user try to sign in' do

    log_in(user)

    expect(page).to have_content 'Signed in successfully'
    expect(current_path).to eq root_path
  end

  scenario 'Non-registered user try to sign in' do

    visit new_user_session_path
    fill_in 'Email', with: 'user@test.com'
    fill_in 'Password', with: '12345678'
    click_on 'Log in'

    expect(page).to have_content 'Invalid Email or password.'
    expect(current_path).to eq new_user_session_path
  end

end
