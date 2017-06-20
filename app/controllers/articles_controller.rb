class ArticlesController < ActionController::Base
  
  def new
    @article = Article.new
  end


  def edit
    @article = Article.find(params[:format])
  end

  def update
    @article = Article.find(params[:format])
    if @article.update(article_params)
      flash[:notice] = "Article was successfully updated"
      redirect_to articles_path(@article)
    else
      render 'edit'
    end
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to articles_path(@article)
      flash[:notice] = "Article was successfully created"
    else
      render 'new'
    end
  end

  def show
    @article = Article.find(params[:format])
  end

  private
    def article_params
      params.require(:article).permit(:title, :description)
    end
  

end