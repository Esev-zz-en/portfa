class Site::SiteController < ApplicationController

  protected

  def user
    @user ||= User.find_by(username: params[:username])
  end

  def site
    @site ||= user.site
  end

  def page
    @page ||= site.find_page(params[:page_slug])
  end

  def project
    return nil unless params[:project_slug]
    @project ||= user.projects
      .find_by(slug: params[:project_slug])
  end
end
