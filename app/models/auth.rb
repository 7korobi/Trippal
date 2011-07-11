class Auth 
  include Trippal
  key :user_id, :provider
  field :user_id
  field :provider
  field :name
  field :screen_name
  referenced_in :user, inverse_of: :auths
  key :user_id, :provider

  def initialize(attributes = {})
    super
    self.save!
  end

  def login?
    uid.present?
  end
end

# for omniauth
class Auth
  def self.authenticate(auth)
    o = self.find_or_new(auth.slice("provider","uid"))
    o.attributes = {
      name:        auth["user_info"]["name"],
      screen_name: auth["user_info"]["nickname"]
    }
    o.save
    o
  end

  def self.find_or_new(key)
    self.where(key).first || self.new(key)
  end
end
