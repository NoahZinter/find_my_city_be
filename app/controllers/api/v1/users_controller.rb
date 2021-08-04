class Api::V1::UsersController < ApplicationController

  def create

    user = User.find_or_create_by(email: params[:user][:email], password: params[:user][:password])
    if user.save
        render json: UserSerializer.new(user), status: :created
      else
        render :json => {:error =>  "Unprocessable Entity"}.to_json, :status => 422
    end
  end

  # User params method for OAuth login

  # private

  # # def user_params
  # #   # params.require(:user).permit(:google_id, :email, :token)
    # # end
end