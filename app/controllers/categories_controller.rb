class CategoriesController < ApplicationController
before_action :category_params, only: [:update,:create]
before_action :require_login, only: [:index,:create,:edit,:update]
before_action :require_admin, only: [:index,:create,:edit,:update]


	def index
		@categories = Category.all.order('created_at desc')
		@category = Category.new
	end

	def create
		@category = Category.new(category_params)
		if @category.save
			flash[:notice] = "HURRY!!! CATEGORY CREATED SUCCESSFULLY"
			redirect_to categories_path
		else
			render :index
		end
	end

	def update
		@category = Category.find(params[:id])
		if @category.update(category_params)
			flash[:notice] = "HURRY!!! CATEGORY Updated"
		else
			flash[:alert] = "Something went wrong"
		end
		redirect_to categories_path
	end

	def edit
		@category = Category.find(params[:id])
	end

	private
	def category_params
		params.require(:category).permit(:name)
	end
end