class PersonalsController < ApplicationController
     def index
        @personals = Personal.all
     end
     def create
      @personal = Personal.new(:personal => params[:personal],:userid => params[:userid])
      @personal.articleid = current_user.id
          if @personal.save
            redirect_to :back
            flash[:success] = "message was successfully posted"
          else
             flash[:danger] = "message failure"
             redirect_to :back;
          end
     end
     def destroy
       @personal = Personal.find(params[:id])
       if @personal.destroy
       flash[:danger] = "Post was successfully deleted"
       redirect_to :back
       end
    end
end
