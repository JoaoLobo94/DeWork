class Api::V1::RepliesController < ApplicationController
  before_action :set_reply, only: %i[update create]
  before_action :set_contribution, only: %i[index]
  def index
    render json: @contribution.replies
  end

  def create
    @new_reply = Reply.new(contributions_params)
    @new_reply.save!
    render json: @new_reply
  end

  def update
    render :success if @reply.update(body: reply_params['body'], title: reply_params['title'])
  end

  private

  def reply_params
    params.permit(:body, :title, :parent_id, :contribution_id)
  end

  def set_reply
    @reply = Reply.find(reply_params[:id])
  end

  def set_contribution
    @contribution = Contribution.find(params[:contribution_id])
  end
end
