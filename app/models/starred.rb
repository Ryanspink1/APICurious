class Starred < OpenStruct

  def self.find_by(current_user)
    starred = GithubService.new(current_user).user("/starred").map do |starred|
      Starred.new(starred)
    end
    starred.count
  end
end
