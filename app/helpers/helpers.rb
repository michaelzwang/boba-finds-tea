helpers do
  def selected_quality
    case @post.quality
    when "none"
      "selected"
    when "plush"
      "selected"
    when "chewy"
      "selected"
    when "aight"
      "selected"
    when "mushy"
      "selected"
    when "hard"
      "selected"
    end
  end

   def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?(user)
    current_user == user
  end
end
