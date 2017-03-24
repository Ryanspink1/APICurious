class Repo < OpenStruct

  def self.find_by(current_user)
    GithubService.new(current_user).user("/repos").map do |repos|
      Repo.new(repos)
    end
  end

  def self.create_repo(current_user, name)
    GithubService.new(current_user).create_repo(name)
  end
end
