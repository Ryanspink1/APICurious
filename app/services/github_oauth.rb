class GithubOauth
  attr_reader :code,
              :client_id,
              :client_secret,
              :events,
              :repos,
              :pulls

  def initialize(code)
    @code           = code
    @client_id      = open('lib/assets/.client_id').read.gsub("\n","")
    @client_secret  = open('lib/assets/.client_secret').read.gsub("\n","")
  end

  def access_token
    response        = Faraday.post("https://github.com/login/oauth/access_token?client_id=#{client_id}&client_secret=#{client_secret}&code=#{code}")
    @access_token   = response.body.split(/\W+/)[1]
    @access_token
  end

  def data
    oauth_response  = Faraday.get("https://api.github.com/user?access_token=#{@access_token}")
    JSON.parse(oauth_response.body)
  end

  def self.client_id
    open('lib/assets/.client_id').read.gsub("\n","")
  end
end
