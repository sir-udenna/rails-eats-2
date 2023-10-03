class ApplicationController < ActionController::Base
    # include ActionController::MimeResponds
    respond_to :json
    protect_from_forgery unless: -> { request.format.json? }
    # before_action :authenticate_user!
    # before_action :user_signed_in?
    # skip_before_action :verify_authenticity_token

end
