class Pull < OpenStruct

  def self.find_pulls(current_user)
    array_of_pulls = Array.new
    Commit.find_names(current_user).each do |repo|
      GithubService.new(current_user).user_alt(repo, "pulls").map do |pull|
        array_of_pulls << Pull.new(pull)
      end
    end
    array_of_pulls
  end
end
