class ArticlesController < ApplicationController
before_action :find_article , only: [:show,:edit,:update,:destroy]

  def show
  end

  def index
    @articles = Article.paginate(page: params[:page], per_page: 3)
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.new(article_params)
    if session[:user_id]
    @article.user = User.find(session[:user_id])
    else
      flash.now[:alert]= "You need to Sign up first to add a feedback"
      render 'new' and return
    end
    @article.save
    if @article.save
      flash[:notice] = "Article was created successfully."
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    if @article.update(article_params)
      flash[:notice] = "Article updates successfully"
      redirect_to @article
    else
      render 'edit'
    end
  end
  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

  def find_article
        @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end

end
