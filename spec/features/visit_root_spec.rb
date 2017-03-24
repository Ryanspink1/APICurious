require 'rails_helper'

describe "dashboard" do
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

  describe "when an authenticated user visits the dashboard" do
    it "displays user information" do
      # VCR.use_cassette("features/dashboard_info") do

        visit(organizations_path)

        expect(page).to have_content("Ryanspink1")
      # end
    end
  end
end
