class ApplicationController < ActionController::API
    before_action :authenticate_user!
    # def current_user
    #     User.first
    # end
end
