module EventsHelper
  def description
    raw Kramdown::Document.new(@event.description).to_html
  end
  
  def rules
    raw Kramdown::Document.new(@event.rules).to_html
  end
end
