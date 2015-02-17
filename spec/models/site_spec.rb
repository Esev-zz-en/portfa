require 'rails_helper'

RSpec.describe Site, type: :model do
  let!(:user) { FactoryGirl.create(:user) }
  subject { user.site }

  describe '#find_asset' do
    it 'searches for an asset by name and extension' do
      expect(subject.find_asset('site.js')).to be_kind_of(SiteAsset)
    end

    context 'when file does not exist' do
      it 'returns nil' do
        expect(subject.find_asset('other.js')).to be_nil
      end
    end
  end

  describe '#find_page' do
    it 'searches for a page by slug' do
      expect(subject.find_page('home')).to be_kind_of(Page)
    end
  end
end
