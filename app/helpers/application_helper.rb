module ApplicationHelper
  def logged_in?
    !!session[:user_id]
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if logged_in?
  end

  def question_owner?(question)
    current_user == question.author
  end

  def format_time(object)
    localize(object.updated_at, :format => :long)
  end
end
