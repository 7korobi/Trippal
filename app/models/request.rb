class Request
  include Trippal
  field :http_user_agent
  field :remote_ip
  field :handle
  timestamp :at
  
  def save
    raise "No save this model!"
  end

  def self.find_or_new(request)
    key = {
      remote_ip:  request.remote_ip,
      user_agent: request.env["HTTP_USER_AGENT"]
    }
    self.where(key).first || self.new(key)
  end
end
