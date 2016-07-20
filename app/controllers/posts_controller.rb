class PostsController < ApplicationController
def index
     @users = User.all.order('username ASC')
     if params[:search]
       @str = params[:search].downcase
       @users = User.where("lower(username) LIKE ?", "%#{@str}%")
       @search = params[:search]
     else
       @users = User.all.order('username ASC')
     end
end
end
