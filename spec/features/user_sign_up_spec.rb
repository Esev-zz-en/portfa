require 'rails_helper'

RSpec.feature 'User sign up', type: :feature do
  let(:user_details) do
    OpenStruct.new(
      username: 'testuser',
      name: 'Test User',
      email: 'testuser@example.com',
      password: '12345678'
    )
  end

  scenario 'Registration' do
    visit new_user_registration_path
    fill_in 'Username', with: user_details.username
    fill_in 'Name', with: user_details.name
    fill_in 'Email', with: user_details.email
    fill_in 'Password', with: user_details.password
    fill_in 'Confirm Password', with: user_details.password
    click_button "Sign up"

    expect(page).to have_text('Test User')
    expect(page).to have_text('Projects')
  end
end
