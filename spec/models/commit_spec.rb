require 'rails_helper'

describe Commit do
  describe '#order_commits' do
    it 'returns all commits in chronological order' do
      VCR.use_cassette("services/find_commits") do
        current_user = User.create(username: "Ryanspink1",
                                   uid: "21284870",
                                   token: "0d779490ad9212c27508514d9adba1381c8f879a",
                                   email: nil, provider: "github",
                                   image: "https://avatars0.githubusercontent.com/u/21284870"
                                  )

        commits = Commit.order_commits(current_user)
        commit = commits.first
        commit_last = commits.last

        expect(commits.count).to eq(26)
        expect(commits.count).to_not eq(27)

        expect(commit_last.commit[:committer][:date]).to eq("2017-03-16T20:13:13Z")
        expect(commit_last.commit[:committer][:date]).to_not eq("2014-12-19T02:15:27Z")

        expect(commit.commit[:committer][:date]).to eq("2017-03-21T06:10:42Z")
        expect(commit.commit[:committer][:date]).to_not eq("2014-12-19T02:15:27Z")
      end
    end
  end
end
