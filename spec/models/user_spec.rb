require 'rails_helper'

RSpec.describe User, type: :model do

  it 'creates a basic site on create' do
    user = FactoryGirl.create(:user)

    expect(user.has_site?).to be_truthy
  end
end
