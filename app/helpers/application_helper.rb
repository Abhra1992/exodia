module ApplicationHelper
  def icon(iname, label = '')
    raw "<i class='icon-#{iname}'></i> #{label}"
  end
end
