class Site::PagesController < Site::SiteController
  def show
    renderer = HtmlRenderer.new(user, site, page, project: project)
    render inline: renderer.html, layout: false
  end
end
