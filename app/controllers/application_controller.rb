class ApplicationController < ActionController::API
    # skip_before_action :verify_authenticity_token
    # protect_from_forgery unless: -> { request.format.json? }
    respond_to :json
    
end
