class User < ApplicationRecord
  enum role: [ "default", "admin" ]
  def self.from_omniauth(auth_info)
    where(uid: auth_info[:uid]).first_or_create do |new_user|
      new_user.uid                = auth_info.uid
      new_user.email              = auth_info.info.email
      new_user.token              = auth_info.credentials.token
      new_user.name               = auth_info.extra.raw_info.firstname + " " + auth_info.extra.raw_info.lastname
    end
  end
end
