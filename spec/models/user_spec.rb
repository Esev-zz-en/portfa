require 'rails_helper'

RSpec.describe User, type: :model do
  subject { FactoryGirl.create(:user) }
  it_should_behave_like 'a liquid model', :name

  it 'creates a basic site on create' do
    user = FactoryGirl.create(:user)
    expect(user.has_site?).to be_truthy
  end

end
