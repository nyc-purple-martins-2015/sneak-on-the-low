module ApplicationHelper

  def format_time(object)
    time_ago_in_words(object.updated_at)
  end


end
