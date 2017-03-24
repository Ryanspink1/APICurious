require 'rails_helper'

describe "Organizations page" do
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

  describe "when an authenticated user visits organizations page" do
    it "displays all users organizations" do
      VCR.use_cassette("features/organizations_info") do

        visit(organizations_path)

        expect(page).to have_content("Organizations")
        expect(page).to have_content("Alabasters")
        expect(page).to have_content("https://github.com/orgs/Alabasters")
        expect(page).to_not have_content("alabaster")
      end
    end
  end
end
