require 'rails_helper'

describe "Repos" do
  attr_reader :current_user, :session

  before(:each) do
    @current_user = User.create(username: "Ryanspink1",
                               uid: "21284870",
                               token: open('lib/assets/.client_token').read.gsub("\n",""),
                               email: nil, provider: "github",
                               image: "https://avatars0.githubusercontent.com/u/21284870"
                              )
    ApplicationController.any_instance.stub(:current_user).and_return(@current_user)
  end

  describe "when an authenticated user visits repositories page" do
    it "displays all users repositories" do
      VCR.use_cassette("features/repos_info") do

        visit(repos_path)

        expect(page).to have_content("Repositories")
        expect(page).to have_content("advanced_enums")
        expect(page).to have_content("https://github.com/Ryanspink1/advanced_enums")
        expect(page).to_not have_content("alabaster")
      end
    end
  end
end
