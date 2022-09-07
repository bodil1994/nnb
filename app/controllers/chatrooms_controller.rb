class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    @chatroom_category = Loan.find(@chatroom.loan_id).loan_category
    @chatroom_amount = Loan.find(@chatroom.loan_id).amount
  end

  def index
    @user = current_user
    @chatroom = Chatroom.all
    @loans = Loan.where(user_id: @user.id, status: "Active")
  end

  def new
    @chatroom = Chatroom.new
  end
end
