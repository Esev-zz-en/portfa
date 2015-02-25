module ProjectPathFilter
  def project_path(slug)
    route_helpers.site_project_path(user.username, slug)
  end

  private

  def user
    OpenStruct.new(
      @context.find_variable('me')
    )
  end

  def site
    OpenStruct.new(
      @context.find_variable('site')
    )
  end

  def route_helpers
    Rails.application.routes.url_helpers
  end
end
