class Organization < OpenStruct

  def self.find_by(current_user)
    GithubService.new(current_user).user("/orgs").map do |orgs|
      Repo.new(orgs)
    end
  end
end
