require 'rails_helper'

describe Following do
  describe '#find_by' do
    it "returns all users current user is following" do
      VCR.use_cassette("services/find_followers") do
        current_user = User.create(username: "Ryanspink1",
                                   uid: "21284870",
                                   token: "0d779490ad9212c27508514d9adba1381c8f879a",
                                   email: nil, provider: "github",
                                   image: "https://avatars0.githubusercontent.com/u/21284870"
                                  )

        following = Following.find_by(current_user)
        followed = following.first

        expect(following.count).to eq(1)
        expect(following.count).to_not eq(2)

        expect(followed.login).to eq("andrewdwooten")
        expect(followed.login).to_not eq("carmer")

        expect(followed.avatar_url).to eq("https://avatars2.githubusercontent.com/u/21285661?v=3")
        expect(followed.avatar_url).to_not eq("https://avatars2.githubusercontent.com/u/21285661?v=2")
      end
    end
  end

  describe '#following_events' do
    it "returns all followed users events ordered by date" do
      VCR.use_cassette("services/find_followers_events") do
        current_user = User.create(username: "Ryanspink1",
                                   uid: "21284870",
                                   token: "0d779490ad9212c27508514d9adba1381c8f879a",
                                   email: nil, provider: "github",
                                   image: "https://avatars0.githubusercontent.com/u/21284870"
                                  )

        events = Following.following_events(current_user)
        event = events.first
        event_last = events.last

        expect(events.count).to eq(30)
        expect(events.count).to_not eq(29)

        expect(event.type).to eq("IssuesEvent")
        expect(event.login).to_not eq("PushEvent")

        expect(event.id).to eq("5542984475")
        expect(event.id).to_not eq("5545893233")

        expect(event_last.id).to eq("5545893233")
        expect(event_last.id).to_not eq("5542984475")
      end
    end
  end
end
