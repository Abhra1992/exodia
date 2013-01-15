class PagesController < ApplicationController
  def contacts
    @contacts = Contact.all
  end

  def credits
  end

  def hospitality
  end

  def how_to_reach
  end

  def index
  end

  def license
  end

  def privacy
  end

  def schedule
    @contests = Event.contests_list
    @insights = Event.insights_list
  end

  def sitemap
  end

  def sponsors
  end
end
