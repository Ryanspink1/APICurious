class Repo < OpenStruct

  def self.find_by(current_user)
    GithubService.new(current_user).user("/repos").map do |repos|
      Repo.new(repos)
    end
  end
end
