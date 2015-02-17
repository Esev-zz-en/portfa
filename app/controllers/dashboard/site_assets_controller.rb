class Dashboard::SiteAssetsController < Dashboard::DashboardController
  respond_to :html
  def index
    render locals: { site_assets: site_assets }
  end

  def new
    respond_with site_asset
  end

  def create
    site_asset.save(site_asset_params)
    respond_with site_asset, location: dashboard_site_assets_path
  end

  protected

  def site_assets
    @site_assets ||= site.site_assets
  end

  def site_asset
    @site_asset ||= begin
      params[:id] and site.site_assets.find(params[:id]) or site.site_assets.new(site_assets_params)
    end
  end

  def site_assets_params
    return {} unless params[:site_asset].present?
    params.require(:site_asset).permit(:file_name, :content)
  end
end
