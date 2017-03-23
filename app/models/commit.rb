class Commit < OpenStruct

  def self.find_names(current_user)
    GithubService.new(current_user).user("/repos").map do |events|
      events[:name]
    end
  end

  def self.commits(current_user)
    array_of_commits = Array.new
      Commit.find_names(current_user).each do |repo|
        GithubService.new(current_user).user_alt(repo, "commits").map do |commits|
        unless ((commits == [:message, "Git Repository is empty."]) || (commits == [:documentation_url, "https://developer.github.com/v3"]))
          array_of_commits << Commit.new(commits)
        end
      end
    end
    array_of_commits
  end

  def self.order_commits(current_user)
    commits = Commit.commits(current_user).sort_by do |commit|
      commit.commit[:committer][:date]
    end
    commits.reverse[0..25]
  end
end
