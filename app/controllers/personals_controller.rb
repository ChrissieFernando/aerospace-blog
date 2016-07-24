class PersonalsController < ApplicationController
     def index
        @personals = Personal.all
     end
     def create
      @personal = Personal.new(:personal => params[:personal],:userid => params[:userid])
      @personal.articleid = current_user.id
          if @personal.save
            redirect_to :back
            flash[:success] = "message was successfully sent"
          else
             flash[:danger] = "message sent failed"
             redirect_to :back;
          end
     end
     def destroy
       @personal = Personal.find(params[:id])
       if @personal.destroy
       flash[:danger] = "Message was successfully deleted"
       redirect_to :back
       end
    end
end
