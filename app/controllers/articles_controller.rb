class ArticlesController < ApplicationController

    before_action :set_article, only: [:edit, :update, :show, :destroy]

    def index
        @articles = Article.all
    end
    

    def new
        @article = Article.new
    end
    
    def edit
        
    end

    def create
        # render plain: params[:article].inspect
        @article = Article.new(article_params)
        if @article.save
            flash[:notice] = "Article created successfully!"
            redirect_to article_path(@article)
        else
            flash[:notice] = @article.errors.full_messages
            render :new
        end
    end
    
    def update
        if @article.update(article_params)
          flash[:success] = "Article was successfully updated"
          redirect_to article_path(@article)
        else
        #   flash[:error] = "Something went wrong"
          render :edit
        end
    end
    

    def show
        
    end


    def destroy
        puts "DELETE CALLED"
        if @article.destroy
            flash[:success] = 'Object was successfully deleted.'
            redirect_to articles_path(@article)
        else
            flash[:error] = 'Something went wrong'
            # redirect_to articles_url
        end
    end
    

    private

    def set_article
        @article = Article.find(params[:id])
    end
    

    def article_params
        params.require(:article).permit(:title, :description)
    end
    

end