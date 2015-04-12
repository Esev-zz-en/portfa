require 'rails_helper'

RSpec.describe ProjectImage, type: :model do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:project) { FactoryGirl.create(:project, user: user) }
  subject { FactoryGirl.create(:project_image, project: project) }

  it_should_behave_like 'a liquid model', :title
end
