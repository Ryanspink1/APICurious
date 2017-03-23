class Follower < OpenStruct

  def self.find_by(current_user)
    GithubService.new(current_user).user("/followers").map do |follower|
      Follower.new(follower)
    end
  end
end
