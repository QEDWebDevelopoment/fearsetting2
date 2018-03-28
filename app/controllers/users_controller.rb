class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    user = User.new(user_params)
    if user.save
      render json: {status: 'User created successfully'}, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end

  def login
    user = User.find_by(email: params[:email].to_s.downcase)
#   ... If email confirmation is used: replace statement:
#     if user && user.authenticate(params[:password])
#       if user.confirmed_at?
#         auth_token = JsonWebToken.encode({user_id: user.id})
#         render json: {auth_token: auth_token}, status: :ok
#       else
#         render json: {error: 'Email not verified' }, status: :unauthorized
#       end
#     else
#   ...
    if user && user.authenticate(params[:password])
        auth_token = JsonWebToken.encode({user_id: user.id})
        render json: {auth_token: auth_token}, status: :ok
    else
      render json: {error: 'Invalid username / password'}, status: :unauthorized
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation)
  end
end