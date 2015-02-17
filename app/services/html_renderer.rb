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

  private

  def page_html
    @page_html ||= Liquid::Template
      .parse(page.content)
      .render({
          'me' => user,
          'site' => site,
          'page' => page,
          'projects' => user.projects,
          'project' => project
        },
        filters: [::ProjectPathFilter]
      ).html_safe
  end

  def debug(msg)
    Rails.logger.debug("[DEBUG]: #{msg}")
  end
end
