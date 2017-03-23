class Basic < OpenStruct

  def self.find_by(current_user)
    GithubService.new(current_user).user("").map do |info|
      Basic.new(info)
    end
  end
end
