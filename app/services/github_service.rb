class GithubService
  attr_reader :connection,
              :client_id,
              :client_secret

  def initialize(current_user)
    @current_user = current_user
    @connection = Faraday.new("https://api.github.com/users")
    @user_connection = Faraday.new("https://api.github.com/")
    @client_id      = open('lib/assets/.client_id').read.gsub("\n","")
    @client_secret  = open('lib/assets/.client_secret').read.gsub("\n","")
  end

  def user(criteria)
    parse(connection.get("#{@current_user.username}#{criteria}?client_id=#{client_id}&client_secret=#{client_secret}"))
  end

  def user_alt(criteria, route)
    parse(connection.get("/repos/#{@current_user.username}/#{criteria}/#{route}?client_id=#{client_id}&client_secret=#{client_secret}"))
  end

  def foreign_user(user, criteria)
    parse(connection.get("#{user}#{criteria}?client_id=#{client_id}&client_secret=#{client_secret}"))
  end

  def create_repo(name)
    connection.post do |c|
      c.url "/user/repos?client_id=#{client_id}&client_secret=#{client_secret}&access_token=#{@current_user.token}"
      c.body = { "name": name}.to_json
    end
  end

private

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
