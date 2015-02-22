module BootstrapHelper
  def icon_tag(icon)
    content_tag :span, nil, class: ['glyphicon', "glyphicon-#{icon}"]
  end

  def dropdown_button(label, group_class: nil, btn_class: 'btn-default', &block)
    button_content = label + content_tag(:span, nil, class: 'caret')

    content_tag(:div, class: ['btn-group', group_class]) do
      content_tag(:button, button_content,
                  class: ['btn', btn_class, 'dropdown-toggle'],
                  data: { toggle: 'dropdown' }) +

      content_tag(:ul, class: 'dropdown-menu', role: 'menu') do
        capture(&block)
      end
    end
  end
end
