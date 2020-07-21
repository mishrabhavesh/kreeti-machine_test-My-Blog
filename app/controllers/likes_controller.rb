class LikesController < ApplicationController

def create
	
	@like = current_user.likes.build(like_params)
	@article = @like.article
	if(@like.save)
		respond_to :js
	else
		flash[:alert] = "Sommething went wrong"
	end
end

def destroy
	@like = Like.find(params[:id])
	@article = @like.article
	@current_user = current_user
	if(@like.destroy)
		respond_to :js
	else
		flash[:alert] = "Sommething went wrong"
	end
end

private

def like_params
	params.permit(:article_id)
end


end
