require 'rails_helper'

RSpec.feature 'Manage projects' do
  before { sign_in_test_user }

  scenario 'Create a project' do
    visit new_dashboard_project_path
    fill_in 'Title', with: 'Awesome project'
    fill_in 'Content', with: 'Just a test content'
    click_button 'Create Project'

    expect(page).to have_content 'Awesome project'
  end

  scenario 'Edit a project' do
    project = FactoryGirl.create(:project, user: User.last)

    visit edit_dashboard_project_path(project)
    fill_in 'Title', with: 'Edited project'
    click_button 'Update Project'

    expect(page).to have_content('Edited project')
  end
end
