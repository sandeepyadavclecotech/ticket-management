class CommentsController < ApplicationController
  before_action :authenticate_customer!

  def create
    @ticket = Ticket.find(params[:ticket_id])

    @comment = @ticket.comments.build(comment_params)
    @comment.customer = current_customer

    if @comment.save
      redirect_to @ticket, notice: "Comment added successfully"
    else
      redirect_to @ticket, alert: "Failed to add comment"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
