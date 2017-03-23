require 'rails_helper'

describe Repo do
  describe '#find_by' do
    it "returns all repos" do
      VCR.use_cassette("services/find_repos") do
        current_user = User.create(username: "Ryanspink1",
                                   uid: "21284870",
                                   token: "0d779490ad9212c27508514d9adba1381c8f879a",
                                   email: nil, provider: "github",
                                   image: "https://avatars0.githubusercontent.com/u/21284870"
                                  )

        repos = Repo.find_by(current_user)
        binding.pry
        expect(repos.count).to eq(29)

        expect(repos.first.name).to eq("advanced_enums")
        expect(repos.first.name).to_not eq("web_guesser")

        expect(repos.last.name).to eq("web_guesser")
        expect(repos.last.name).to_not eq("prework")

        expect(repos[16].name).to eq("prework")
        expect(repos[16].name).to_not eq("advanced_enums")
      end
    end
  end
end
  # Repo.instance_eval('@service = GithubService.new(current_user)')
