class Dashboard::ProjectsController < Dashboard::DashboardController
  respond_to :html
  def index
    render locals: { projects: projects }
  end

  def new
    respond_with project
  end

  def create
    project.save
    respond_with project, location: dashboard_projects_path
  end

  def edit
    respond_with project
  end

  def update
    project.update(project_params)
    respond_with project, location: dashboard_projects_path
  end

  def destroy
    project.destroy
    redirect_to dashboard_projects_path
  end

  protected

  def projects
    @projects ||= current_user.projects.order(title: :asc)
  end

  def project
    @project ||= begin
      params[:id] and current_user.projects.find(params[:id]) or current_user.projects.new(project_params)
    end
  end

  def project_params
    return {} unless params[:project].present?
    params.require(:project)
      .permit(:title, :slug, :content, :release_date,
      images_attributes: [:id, :url, :title, :description, :_destroy])
  end
end
