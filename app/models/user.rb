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

  def admin?
    is_admin
  end
  def login?
    account_id.present? && name.present?
  end
end
