class CreateBasicSite
  DEFAULT_PAGES = %w[home project]
  DEFAULT_ASSETS = %w[site.js site.css]

  attr_reader :user
  def initialize(user)
    @user = user
  end

  def run!
    return if user.has_site?
    create_site
    create_site_basic_pages
    create_site_basic_assets
  end

  private

  def create_site
    user.create_site(
      title: "#{user.name}'s site",
      description: 'My brand new site'
    )
  end

  def create_site_basic_pages
    DEFAULT_PAGES.each do |file|
      content = File.read("db/templates/#{file}.html")
      title = file.capitalize

      user.site.pages.create(
        title: title,
        content: content,
        deletable: false
      )
    end
  end

  def create_site_basic_assets
    DEFAULT_ASSETS.each do |asset|
      name, extension = asset.split('.')

      user.site.site_assets.create(
        name: name,
        extension: extension,
        content: File.read("db/templates/assets/#{asset}")
      )
    end
  end
end
