class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end
  def new
    @message = Message.all
    @messages = Message.new
  end
  def create
    @message = Message.new(article_params)
    @message.userid = current_user.id
    @message.user_name = User.find(current_user).username
    if @message.save
      flash[:success] = "Message was submitted successfully"
        @messages = Message.all
      redirect_to new_message_path
    else
      @messages = Message.new
      redirect_to new_message_path
    end
  end
  def destroy
    @message = Message.find(params[:id])
    if @message.destroy
    flash[:danger] = "message was successfully deleted"
    redirect_to new_message_path
    end
  end
  private
  def article_params
    params.require(:message).permit(:messages)
  end
end
