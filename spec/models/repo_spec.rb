require 'rails_helper'

describe Repo do
  describe '#find_by' do
    it "returns all repos" do
      current_user = User.create(username: "Ryanspink1",
                  uid: "21284870",
                  token: "0d779490ad9212c27508514d9adba1381c8f879a",
                  email: nil, provider: "github",
                  image: "https://avatars0.githubusercontent.com/u/21284870")

      Repo.instance_eval('@service = GithubService.new(current_user)')

      repos = Repo.find_by
      repo  = repos.first
      
      expect(repos.count).to eq(30)
      expect(repo.count).to eq(1)
      expect(repo.name).to eq("advanced_enums")
    end
  end
end
