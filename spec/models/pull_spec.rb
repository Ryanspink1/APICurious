require 'rails_helper'

describe Pull do
  describe '#find_pulls' do
    it "returns all open pull requests" do
      VCR.use_cassette("services/find_pulls") do
        current_user = User.create(username: "Ryanspink1",
                                   uid: "21284870",
                                   token: "0d779490ad9212c27508514d9adba1381c8f879a",
                                   email: nil, provider: "github",
                                   image: "https://avatars0.githubusercontent.com/u/21284870"
                                  )

        pulls = Pull.find_pulls(current_user)
        pull = pulls.first

        expect(pulls.count).to eq(1)
        expect(pulls.count).to_not eq(2)

        expect(pull.url).to eq("https://api.github.com/repos/Ryanspink1/storedom/pulls/1")
        expect(pull.url).to_not eq("https://api.github.com/Ryanspink1/storedom/pulls/1")

        expect(pull.title).to eq("add user and session functionality")
        expect(pull.title).to_not eq("add user and functionality")
      end
    end
  end
end
