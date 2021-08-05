class Api::V1::UsersController < ApplicationController

  def create
    user = User.find_or_create_by(email: params[:email], password: params[:password])
    if user.save
        render json: UserSerializer.new(user), status: :created
      else
        render :json => {:error =>  "Unprocessable Entity"}.to_json, :status => 422
    end
  end

  def favorites
    user = User.find(params[:id])
    render json: FavoriteSerializer.new(user.favorites).serializable_hash.to_json
  end
end