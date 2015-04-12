require 'rails_helper'

RSpec.describe Project, type: :model do
  let!(:user) { FactoryGirl.create(:user) }
  subject { FactoryGirl.create(:project, user: user) }

  it_should_behave_like 'a liquid model', :title
end
