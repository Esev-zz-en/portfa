class AssetRenderer
  attr_reader :site_asset
  def initialize(site_asset)
    @site_asset = site_asset
  end

  def output
    site_asset.content
  end

  def content_type
    case site_asset.extension
    when 'js'
      'text/javascript; charset=utf-8'
    when 'css'
      'text/css'
    end
  end
end
