class ArticlesController < ApplicationController

before_action :set_params , only: [:edit , :update , :show , :destroy ]

def index
  @article = Article.all
end

def new

@article = Article.new

end


def create
  #render plain: params[:article].inspect
  @article = Article.new(article_params)
  if @article.save
    flash[:notice] = "Article was successfully created"
    redirect_to article_path(@article)
  else
    render 'new'
  end

end

def update
  if @article.update(article_params)
    flash[:notice] = "Article was successfully updated"
    redirect_to article_path(@article)
  else
    render 'edit'
  end
end

def destroy
  if @article.destroy
  flash[:notice] = "Article was successfully deleted"
  redirect_to articles_path
  else
  redirect_to articles_path
  end
end

def edit

end

def show

end

private
def set_params
@article = Article.find(params[:id])
end

def article_params
   params.require(:article).permit(:title , :description)
end

end
