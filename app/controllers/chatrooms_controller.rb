class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    @chatroom_category = Loan.find(@chatroom.loan_id).loan_category
    @chatroom_amount = Loan.find(@chatroom.loan_id).amount
    @message = Message.new
  end

  def index
    @user = current_user
    @loans = Loan.where(user_id: @user.id)
  end
end
