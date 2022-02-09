class Api::V1::ColumnsController < ApplicationController
  before_action :authenticate_api_v1_user!, only: [:create, :destroy, :update]
  before_action :current_user_owner, only: [:create, :destroy, :update]

  # GET /columns
  def index
    @columns = find_user(params[:user_id]).columns.all
    respond_with @columns, only: [:id, :title], status: :ok
  end

  # GET /columns/:id
  def show
    @columns = find_user(params[:user_id]).columns.find(params[:id])
    respond_with @columns, only: [:id, :title], status: :ok
  end

  # POST /columns
  def create
    @column = Column.new(col_params)
    if @column.save
      head(:created)
    else
      # Что-то пошло не так
      head(:unprocessable_entity)
    end
  end

  # DELETE columns/:id
  def destroy
    column = Column.find(params[:id])
    if column.destroy
      head(:ok)
    else
      # Что-то пошло не так
      head(:unprocessable_entity)
    end
  end

  # PUT /columns
  def update
    @column = Column.find(params[:id]).update(col_params)
    if @column
      head(:created)
    else
      head(:unprocessable_entity)
    end
  end

  private

  def col_params
    params.require(:title)
    params.permit(:title, :user_id)
  end

  def find_user(user_id)
    User.find(user_id)
  end
end
