class Api::V1::UsersController < ApplicationController

  def create
    @user = User.create(user_params)
      if @user.save
        render json: UserSerializer.new(@user), status: :created
      else
        render :json => {:error =>  "Unprocessable Entity"}.to_json, :status => 422
    end
  end

  private

  def user_params
    params.require(:user).permit(:google_id, :email, :token)
  end
end