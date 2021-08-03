class Api::V1::NoauthUsersController < ApplicationController
  def create
    user = User.find_or_create_by(email: params[:email], password: params[:password])
  end
end