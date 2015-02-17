module BootstrapHelper
  def icon_tag(icon)
    content_tag :span, nil, class: ['glyphicon', "glyphicon-#{icon}"]
  end
end
