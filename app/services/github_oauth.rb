class GithubOauth
  attr_reader :code,
              :client_id,
              :client_secret
              :events

  def initialize(code)
    @code           = code
    # @client_id      = 'dc59d855037ad31d4948'
    @client_id      = open('lib/assets/.client_id').read.gsub("\n","")
    # binding.pry
    # @client_secret  = 'eb06c94517878d9cc8aa35a9afbe61383cbf2fe4'
    @client_secret  = open('lib/assets/.client_secret').read.gsub("\n","")
    binding.pry
  end

  def access_token
    response        = Faraday.post("https://github.com/login/oauth/access_token?client_id=#{client_id}&client_secret=#{client_secret}&code=#{code}")
    @access_token   = response.body.split(/\W+/)[1]
    @access_token
  end

  def data
    oauth_response  = Faraday.get("https://api.github.com/user?access_token=#{@access_token}")
    data            = JSON.parse(oauth_response.body)
    data
  end

  def self.events(current_user)
    binding.pry
    oauth_response  = Faraday.get("https://api.github.com/users/#{current_user.username}/events")
    data            = JSON.parse(oauth_response.body)
    data
  end
end
