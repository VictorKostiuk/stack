feature 'User answer', '
  In order to exchange my knowledge
  As an authenticated user
  I want to be able to create answers
' do

  given(:user) { FactoryBot.create(:user) }
  given(:question) { FactoryBot.create(:question) }

  scenario 'Authenticated user create answer', js: true do
    log_in(user)
    visit question_path(question)

    fill_in 'My answer', with: 'My answer'
    click_on 'Create'
    binding.pry
    expect(current_path).to eq question_path(question)
    within '.answers' do
      expect(page).to have_content 'My answer'
    end
  end

  scenario 'User try to create invalid answer', js: true do

    log_in(user)
    visit question_path(question)

    click_on 'Create'

    expect(page).to have_content "Body can't be blank"
  end
end
