class User < ApplicationRecord
  validates :username, :uid, :token, :image, presence: true

  def self.from_github(data, access_token)
    user = User.find_or_create_by(username: data['login'],
                                  uid:      data['id'],
                                  provider: 'github',
                                  image:    data['avatar_url'],
                                  email:    data['email'],
                                  token:    access_token
                                 )
    return user
  end
end
