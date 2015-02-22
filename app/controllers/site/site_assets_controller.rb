class Site::SiteAssetsController < Site::SiteController
  skip_before_action :verify_authenticity_token
  def show
    render inline: asset_renderer.output,
      content_type: asset_renderer.content_type
  end

  private

  def site_asset
    name, extension = params[:file_name].split('.')
    @site_asset ||= site.site_assets.find_by(
      name: name, extension: extension
    )
  end

  def asset_renderer
    @asset_renderer ||= AssetRenderer.new(site_asset)
  end
end
