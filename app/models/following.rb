class Following < OpenStruct

  def self.find_by(current_user)
    GithubService.new(current_user).user("/following").map do |following|
      Following.new(following)
    end
  end

  def self.following_names(current_user)
    Following.find_by(current_user).map do |following|
      following.login
    end
  end

  def self.following_events(current_user)
    following_events = Array.new
    Following.following_names(current_user).each do |name|
      GithubService.new(current_user).foreign_user(name, "/events").map do |event|
        following_events<<Following.new(event)
      end
    end
    following_events.sort_by {|event| event.created_at}.reverse
  end
end
