require 'rails_helper'

feature 'Create question', %q{
  In order to get answer from community
  As an authenticated user
  I want to be able to ask the questions
} do

  given(:user) { FactoryBot.create(:user) }

  scenario 'Authenticated user creates the question' do

    log_in(user)

    visit questions_path
    click_on 'Ask question'
    fill_in 'Title', with: 'Title'
    fill_in 'Body', with: 'Body'
    click_on 'Create'

    expect(page).to have_content "Your question successfully created."
  end

  scenario 'Non-authenticated user tries to create the question' do
    visit questions_path
    click_on 'Ask question'

    expect(page).to have_content "You need to sign in or sign up before continuing."
  end

end