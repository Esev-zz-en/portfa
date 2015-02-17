RSpec.describe CreateBasicSite do
  let(:user) { FactoryGirl.create(:user) }
  subject { described_class.new(user) }

  it 'creates a basic site for a given user' do
    subject.run!
    expect(user.site).to_not be_nil
  end

  it 'creates a basic site with default pages' do
    subject.run!
    site = user.site
    page_titles = site.pages.map { |p| p.title }

    expect(page_titles).to eq ["Home", "Project"]
    expect(site.pages.any?(&:deletable)).to be_falsey
  end

  it 'creates a basic site with default assets' do
    subject.run!
    site = user.site
    asset_names = site.site_assets.map { |a| a.file_name }

    expect(asset_names).to eq ['site.js', 'site.css']
  end
end
