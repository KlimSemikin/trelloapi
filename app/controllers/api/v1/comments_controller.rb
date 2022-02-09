class Api::V1::CommentsController < ApplicationController
  before_action :authenticate_api_v1_user!, only: [:create, :destroy, :update]

  def index
    @comments = find_card(params[:user_id], params[:card_id]).comments.all
    respond_with @comments, status: :ok
  end

  def show
    @comment = find_card(params[:user_id], params[:card_id]).comments.find(params[:id])
    respond_with @comment, status: :ok
  end

  def create
    @comment = Comment.new(card_params.merge(user_id: current_api_v1_user.id))
    if @comment.save
      head(:created)
    else
      head(:unprocessable_entity)
    end
  end

  def destroy
    @comment = Comment.find(params[:id])

    # разрушаем коммент если user его владелец либо владелец карточки
    if current_user_comment_owner(@comment) || !current_user_owner
      if @comment.destroy
        head(:ok)
      else
        head(:unprocessable_entity)
      end
    else
      head(403)
    end
  end

  def update
    @comment = Comment.find(params[:id])
    if current_user_comment_owner(@comment)
      if @comment.update(card_params)
        head(:ok)
      else
        head(:unprocessable_entity)
      end
    else
      head(403)
    end
  end

  private

  def current_user_comment_owner(comment)
    comment.user.id == current_api_v1_user.id
  end

  def card_params
    params.require(:content)
    params.permit(:content, :card_id)
  end

  def find_user(user_id)
    User.find(user_id)
  end

  def find_card(user_id, card_id)
    find_user(user_id).cards.find(card_id)
  end
end
