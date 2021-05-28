class UserSerializer
  include FastJsonapi::ObjectSerializer
  # attributes :id, :email, :created_at
  attributes :email

  # link :self do
  #   @url_helpers.api_user_url(@object.id)
  # end
end
