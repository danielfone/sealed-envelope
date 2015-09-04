module ApplicationHelper
  def icon_text(icon, title="")
    "<span class='glyphicon glyphicon-#{icon}'></span> #{title}".html_safe
  end
end
