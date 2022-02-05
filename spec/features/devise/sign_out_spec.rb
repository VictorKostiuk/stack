feature 'User sign out', %q{
  As an user
  I want to be able to sign out
} do

  given(:user) { FactoryBot.create(:user, password: '12345678', password_confirmation: '12345678') }


  scenario 'User signed out' do

    log_in(user)

    expect(page).to have_content 'Signed in successfully'
    expect(current_path).to eq root_path

    click_on "Sign out"

    expect(page).to have_content 'Signed out successfully.'
    expect(current_path).to eq root_path
  end
end
