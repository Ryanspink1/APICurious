require 'rails_helper'

describe GithubService do
  attr_reader :service
  current_user = User.create(username: "Ryanspink1",
              uid: "21284870",
              token: "0d779490ad9212c27508514d9adba1381c8f879a",
              email: nil, provider: "github",
              image: "https://avatars0.githubusercontent.com/u/21284870")

  before(:each) do
    @service = GithubService.new(current_user)
  end

  describe '#user("repos")' do
    it 'finds the repos for a users api' do
      
      repos = @service.user("repos")
      repo = repos.first

      expect(repos.count).to eq(30)
      expect(repo[:name]).to eq("advanced_enums")
    end
  end
end
