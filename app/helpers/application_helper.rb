module ApplicationHelper
  def object_owner?(object)
    current_user == object.author
  end

  def format_time(object)
    time_ago_in_words(object.updated_at)
  end

  def voted_already?(object)
    votes = object.votes.all
    votes.exists?(:user_id => current_user.id)
  end

end
