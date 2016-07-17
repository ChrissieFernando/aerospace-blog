class CategoriesController < ApplicationController
  before_action :require_admin, except: [:index, :show]

  def index
    if logged_in?
    @categories = Category.paginate(page: params[:page], per_page: 5)
    else
      flash[:danger] = "You must be logged in to view the Categories"
      render ("pages/home")
    end
  end

  def new
    if logged_in?
    @category = Category.new
    else
      flash[:danger] = "You must be logged in to view the Categories"
      render ("pages/home")
    end

  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Category was created successfully"
      redirect_to categories_path
    else
      render 'new'
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash[:success] = "Category name was successfully updated"
      redirect_to category_path(@category)
    else
      render 'edit'
    end
  end

  def show
    if logged_in?
      @category = Category.find(params[:id])
      @category_articles = @category.articles.order('updated_at DESC').paginate(page: params[:page], per_page: 3)
    else
      flash[:danger] = "You must be logged in to view the Categories"
      render ("pages/home")
    end
  end
  private
  def category_params
    params.require(:category).permit(:name)
  end

  def require_admin
    if !logged_in? || (logged_in? and !current_user.admin?)
      flash[:danger] = "Only admins can perform that action"
      redirect_to categories_path
    end
  end
end
