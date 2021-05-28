class ApplicationController < ActionController::API
    # def current_user
    #     User.first
    # end

    def render_jsonapi_response(resource)
        if resource.errors.empty?
            render jsonapi: resource
        else
            render jsonapi_errors: resource.errors, status: 400
        end
    end

end
