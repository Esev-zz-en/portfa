class HtmlRenderer
  attr_reader :user, :site, :page, :project
  def initialize(user, site, page, project: nil)
    @user = user
    @site = site
    @page = page
    @project = project
  end

  def html
    @html ||= Slim::Template
      .new('app/views/site/shared/_layout.html.slim')
      .render(self)
  end

  def page_title
    [user.name, project.try(:title)].compact.join(' - ')
  end

  def asset_url(file_name)
    route_helpers.site_asset_url(
      user.username, file_name,
      host: Rails.application.config.action_controller.asset_host
    )
  end

  def site_url
    route_helpers.site_url(
      user.username,
      host: Rails.application.config.action_controller.asset_host
    )
  end

  private

  def page_html
    @page_html ||= Liquid::Template
      .parse(page.content)
      .render({
          'me' => user,
          'site' => site,
          'page' => page,
          'projects' => user.projects,
          'project' => project,
          'site_url' => site_url
        },
        filters: [::ProjectPathFilter]
      ).html_safe
  end

  def route_helpers
    Rails.application.routes.url_helpers
  end

  def debug(msg)
    Rails.logger.debug("[DEBUG]: #{msg}")
  end
end
