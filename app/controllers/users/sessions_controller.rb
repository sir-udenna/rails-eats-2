# frozen_string_literal: true
class Users::SessionsController < Devise::SessionsController
  respond_to :json
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    puts('sign-in new route hit')
    super
  end

  # POST /resource/sign_in
  def create
    email = params[:user][:email]
    password = params[:user][:password]
  
    user = User.find_by(email: email)
  
    if user&.valid_password?(password)
      # Authentication succeeded
      token = user.generate_authentication_token
  
      # Store the token in the user's session or wherever you intend to persist it
      session[:auth_token] = token
  
      # Respond with user information and token
      render json: { user: user, token: token }
    else
      # Authentication failed
      render json: { error: 'Invalid email or password' }, status: :unprocessable_entity
    end
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
