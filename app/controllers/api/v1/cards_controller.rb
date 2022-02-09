class Api::V1::CardsController < ApplicationController
  before_action :authenticate_api_v1_user!, only: [:create, :destroy, :update]
  before_action :current_user_owner, only: [:create, :destroy, :update]

  def index
    @cards = find_column(params[:user_id], params[:column_id]).cards.all
    respond_with @cards, only: [:id, :title], status: :ok
  end

  def show
    @card = find_column(params[:user_id], params[:column_id]).cards.find(params[:id])
    respond_with @card, only: [:id, :title, :description], status: :ok
  end

  def create
    @card = Card.new(card_params)
    if @card.save
      head(:created)
    else
      head(:unprocessable_entity)
    end
  end

  def destroy
    @card = Card.find(params[:id])
    if @card.destroy
      head(:ok)
    else
      # Что-то пошло не так
      head(:unprocessable_entity)
    end
  end

  def update
    @card = Card.find(params[:id]).update(card_params)
    if @card
      head(:ok)
    else
      # Что-то пошло не так
      head(:unprocessable_entity)
    end
  end

  private

  def card_params
    params.require(:title)
    params.permit(:title, :user_id, :column_id, :description)
  end

  def find_user(user_id)
    User.find(user_id)
  end

  def find_column(user_id, column_id)
    find_user(user_id).columns.find(column_id)
  end
end
