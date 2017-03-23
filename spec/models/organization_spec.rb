require 'rails_helper'

describe Organization do
  describe '#find_organizations' do
    it "returns all users organizations" do
      VCR.use_cassette("services/find_organizations") do
        current_user = User.create(username: "Ryanspink1",
                                   uid: "21284870",
                                   token: "0d779490ad9212c27508514d9adba1381c8f879a",
                                   email: nil, provider: "github",
                                   image: "https://avatars0.githubusercontent.com/u/21284870"
                                  )

        organizations = Organization.find_by(current_user)
        organization = organizations.first

        expect(organizations.count).to eq(1)
        expect(organizations.count).to_not eq(2)

        expect(organization.login).to eq("Alabasters")
        expect(organization.url).to_not eq("Jabroneys")

        expect(organization.avatar_url).to eq("https://avatars2.githubusercontent.com/u/26609305?v=3")
        expect(organization.avatar_url).to_not eq("https://avatars2.githubusercontent.com/u/26609305?v=2")
      end
    end
  end
end
