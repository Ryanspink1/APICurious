require 'rails_helper'

describe "following events" do
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

  describe "when an authenticated user visits following events page" do
    it "displays all users events that user is following" do
      VCR.use_cassette("features/following_events_info") do

        visit(following_events_path)

        expect(page).to have_content("Recent Activity from Users You Follow")
        expect(page).to have_content("andrewdwooten")
        expect(page).to have_content("andrewdwooten/APICurious-GitHub2")
        expect(page).to have_content("PushEvent")
        expect(page).to_not have_content("alabaster")
      end
    end
  end
end
