require 'rails_helper'

describe Follower do
  describe '#find_by' do
    it 'returns all users followers' do
      VCR.use_cassette("services/find_user_followers") do
        current_user = User.create(username: "Ryanspink1",
                                   uid: "21284870",
                                   token: "0d779490ad9212c27508514d9adba1381c8f879a",
                                   email: nil, provider: "github",
                                   image: "https://avatars0.githubusercontent.com/u/21284870"
                                  )

        followers = Follower.find_by(current_user)
        follower = followers.first
        follower_last = followers.last

        expect(followers.count).to eq(4)
        expect(followers.count).to_not eq(2)

        expect(follower.login).to eq("Carmer")
        expect(follower.login).to_not eq("blackknight75")

        expect(follower_last.login).to eq("blackknight75")
        expect(follower_last.login).to_not eq("Carmer")
      end
    end
  end
end
