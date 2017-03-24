class Event < OpenStruct

  def self.find_by(current_user)
    GithubService.new(current_user).user("/events").map do |events|
      Event.new(events)
    end
  end

  def self.find_recent_commits(current_user)
    commit_events = Array.new
    Event.find_by(current_user).map do |event|
      if event.payload[:commits]
        commit_events << event
      end
    end
  end
end
