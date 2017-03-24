require 'rails_helper'

describe "Open Pull Requests" do
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

  describe "when an authenticated user visits open pull requests" do
    it "displays all users pull requests" do
      VCR.use_cassette("features/pulls_info") do

        visit(pulls_path)

        expect(page).to have_content("Open Pull Requests")
        expect(page).to have_content("add user and session functionality")
        expect(page).to have_content("https://github.com/Ryanspink1/storedom/pull/1")
        expect(page).to_not have_content("alabaster")
      end
    end
  end
end
