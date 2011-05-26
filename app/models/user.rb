class User 
  include Trippal
  key :user_id
  field :user_id
  field :fname
  field :lname
  field :birthday, type: Time
  field :profile
  timestamp :at
  references_many :auth
  references_many :articles
end
