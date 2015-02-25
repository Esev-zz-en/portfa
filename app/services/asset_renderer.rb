class AssetRenderer
  attr_reader :site_asset
  def initialize(site_asset)
    @site_asset = site_asset
  end

  def output
    return site_asset.content if site_asset.js?
    render_scss
  end

  def content_type
    if site_asset.js?
      'text/javascript; charset=utf-8'
    else
      'text/css'
    end
  end

  private

  def render_scss
    ::Sass::Engine.new(
      site_asset.content,
      syntax: :scss,
      cache: false,
      read_cache: false,
      style: :compressed
    ).render
  end
end
