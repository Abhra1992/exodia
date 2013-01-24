module ApplicationHelper
  def icon(iname, label = '', color = 'black')
    raw "<i class='icon-#{iname} icon-#{color}'></i> #{label}"
  end
end
