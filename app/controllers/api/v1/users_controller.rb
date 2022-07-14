class Api::V1::UsersController < ApplicationController
  def index
    @users = User.all
    respond_with @users, only: [:id, :email], status: :ok
  end

  def show
    @user = User.find(params[:id])
    respond_with @user, only: [:id, :email], status: :ok
  end
end
