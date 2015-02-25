class Dashboard::SitesController < Dashboard::DashboardController
  respond_to :html

  def edit
    respond_with site
  end

  def update
    site.update(site_params)
    redirect_to edit_dashboard_site_path
  end

  protected

  def site_params
    params.require(:site).permit(:title, :description)
  end
end
