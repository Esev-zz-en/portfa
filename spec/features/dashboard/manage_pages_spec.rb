require 'rails_helper'

RSpec.feature 'Manage pages' do
  before(:all) { @user = FactoryGirl.create(:user) }
  before { sign_in_test_user(@user) }

  scenario 'Create a page' do
    visit new_dashboard_page_path
    fill_in 'Title', with: 'Awesome page'
    find('#page_content').set('Just a test content')
    click_button 'Create Page'

    expect(page).to have_content 'Awesome page'
  end

  scenario 'Edit a page' do
    p = FactoryGirl.create(:page, site: @user.site)

    visit edit_dashboard_page_path(p)
    expect(page).to have_css('form #page_title')
    fill_in 'Title', with: 'Edited page'
    click_button 'Update Page'

    expect(page).to have_content('Edited page')
  end
end
