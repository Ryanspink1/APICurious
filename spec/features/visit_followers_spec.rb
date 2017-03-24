require 'rails_helper'

describe "followers" do
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

  describe "when an authenticated user visits the followers_page" do
    it "displays all users followers" do
      VCR.use_cassette("features/followers_info") do

        visit(followers_path)

        expect(page).to have_content("Followers")
        expect(page).to have_content("Carmer")
        expect(page).to have_content("AELSchauer")
        expect(page).to have_content("meyerhoferc")
        expect(page).to have_content("blackknight75")
        expect(page).to_not have_content("alabaster")
      end
    end
  end
end
