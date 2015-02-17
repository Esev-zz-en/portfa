class Dashboard::PagesController < Dashboard::DashboardController
  respond_to :html
  def index
    render locals: { pages: pages }
  end

  def new
    respond_with page
  end

  def create
    page.save(page_params)
    respond_with page, location: dashboard_pages_path
  end

  def edit
    respond_with page
  end

  def update
    page.update(page_params)
    respond_with page, location: dashboard_pages_path
  end

  protected

  def pages
    @pages ||= site.pages
  end

  def page
    @page ||= begin
      params[:id] and site.pages.find(params[:id]) or site.pages.new(page_params)
    end
  end

  def page_params
    return {} unless params[:page].present?
    params.require(:page).permit(:title, :description, :content)
  end
end
