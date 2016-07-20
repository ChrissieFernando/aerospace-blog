class PostsController < ApplicationController
def index
     @users = User.all.order('username ASC')
     if params[:search]
       @users = User.where("username LIKE ?", "%#{params[:search]}%")
       @search = params[:search]
     else
       @users = User.all.order('username ASC')
     end
end
end
