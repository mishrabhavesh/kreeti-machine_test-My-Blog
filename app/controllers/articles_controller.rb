class ArticlesController < ApplicationController
	before_action :find_params ,only: [:show,:edit,:destroy,:update]
	before_action :require_login, except: [:index]


	def index
		@articles = Article.all.includes(:category,:likes).order('created_at desc')
	end

	def show

	end

	def edit
		if current_user.id == @article.user.id

		else
			flash[:alert] = "You can edit only your post"
			redirect_to articles_path
		end
	end

	def author

	end

	def like_post
		@like_post = Like.like_art(current_user)
	end

	def new 
		@article = Article.new
	end

	def destroy
			if @article.destroy
				redirect_to articles_path
				flash[:notice] = "Article deleted successfully"
			else
				flash[:alert] = "Something went wrong"
			end
	end

	def create
		@article = current_user.articles.build(article_params)
		if @article.save
			flash[:notice] = "Article published successfully"
					redirect_to articles_path
		else
			render :new
		end
	end

	def update
		if @article.update(article_params)
			flash[:notice] = "Article updated successfully"
		else
			flash[:alert] = "Something went wrong"
		end
	redirect_to articles_path

	end

	private 

	def article_params
		params.require(:article).permit(:title,:description,:image,:category_id)
	end

	def find_params
		@article = Article.find(params[:id])
	end
end
