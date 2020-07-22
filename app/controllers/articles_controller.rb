class ArticlesController < ApplicationController
	before_action :find_params ,only: [:show,:edit,:destroy,:update]
	before_action :require_login, except: [:index,:show]

	def index
		if params[:search].present?
			@articles = Article.search(params[:search])
		else
		@articles = Article.all.includes(:category,:likes,:comments).order('created_at desc')
		end
		@comment = Comment.new
	end

	def category_search
		@articles = Article.where(category_id: params[:category_id])
		@comment = Comment.new
		
	end

	def show
		@comment = Comment.new

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

	def comment_post
		@comments = Comment.is_comment(current_user)
		@comment = Comment.new
	end

	def like_post
		@like_post = Like.like_art(current_user)
		@comment = Comment.new
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

     def download_pdf
    	@articles = Article.generate_title_pdf(current_user)
      respond_to do |format|
        format.pdf do
          pdf = TitlePdf.new(@articles, current_user)
         
          send_data pdf.render, filename: 'test.pdf', type: 'application/pdf', :disposition => 'inline'
        end
      end
      end

	private 

	def article_params
		params.require(:article).permit(:title,:description,:image,:category_id)
	end

	def find_params
		@article = Article.find(params[:id])
	end
end
