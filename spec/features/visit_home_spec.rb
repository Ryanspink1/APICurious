require 'rails_helper'

describe "Home page" do
  it "displays all home page info" do
    VCR.use_cassette("features/home_info") do

      visit(root_path)

      expect(page).to have_content("Welcome to Github Clone, please login with you Github account!")
      expect(page).to have_content("Login with Github")
      expect(page).to_not have_content("Logout")
    end
  end
end
