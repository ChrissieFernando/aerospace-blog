class VideosController < ApplicationController
  def show
    @videos = Article.all
    @user = User.all
  end
end
