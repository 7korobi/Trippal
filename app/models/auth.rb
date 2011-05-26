class Auth 
  include Trippal
  key :user_id, :provider
  field :user_id
  field :provider
  field :name
  field :screen_name
  referenced_in :user, inverse_of: :auths
end
