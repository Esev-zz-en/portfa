require 'rails_helper'

RSpec.describe User, type: :model do
  subject { FactoryGirl.create(:user) }
  it_should_behave_like 'a liquid model', :name

  it 'creates a basic site on create' do
    user = FactoryGirl.create(:user)
    expect(user.has_site?).to be_truthy
  end

  context '#validations' do
    context 'with invalid username' do
      it 'returns invalid' do
        user = User.new(username: 'daniel alves')
        user.valid?
        expect(user.errors).to have_key(:username)
      end

      it 'returns invalid' do
        user = User.new(username: 'Daniel')
        user.valid?
        expect(user.errors).to have_key(:username)
      end
    end

    context 'with valid username' do
      it 'returns valid' do
        user = User.new(username: 'daniel-alves')
        user.valid?
        expect(user.errors).to_not have_key(:username)
      end
    end
  end
end
