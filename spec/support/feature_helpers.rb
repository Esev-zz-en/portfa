def sign_in_test_user(created_user = nil)
  user = created_user || FactoryGirl.create(:user)
  visit new_user_session_path
  fill_in 'Email', with: user.email
  fill_in 'Password', with: '12345678'
  click_button 'Log in'
end
