class CommentsController < ApplicationController


  def create
    @comments = Comment.new(article_params)
    @comments.article_id = params[:article_id]
    @comments.user = current_user
    if @comments.save
       @comt =  "<h3>"+@comments.comment+"</h3>" + " <h5>by</h5>" + "<h4><b><span class='comment_name'>"+current_user.username+"<b>"+"</span>"+"</h4>"
    @comments.update(comment: @comt)
      flash[:success] = "comment was successfully posted"
      @article = Article.find(@comments.article_id)
      redirect_to article_path(@article)
    else
      @comments = Comment.new
      @article = Article.find(params[:article_id])
      redirect_to article_path(@article)
    end
  end
  def destroy
    @comment = Comment.find(params[:id])
    @article = @comment.article_id
    @article = Article.find(@article)
    if @comment.destroy
    flash[:danger] = "Post was successfully deleted"
    redirect_to articles_path(@article)
    end
  end
  private
  def article_params
    params.require(:comment).permit(:comment)
  end
end
