require 'rails_helper'

RSpec.describe Page, type: :model do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:site) { user.site }
  subject { FactoryGirl.create(:page, site: site) }

  it_should_behave_like 'a liquid model', :title
end
