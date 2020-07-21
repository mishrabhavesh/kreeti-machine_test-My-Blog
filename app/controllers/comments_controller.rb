class CommentsController < ApplicationController


def create 
	@comment = current_user.comments.build(comment_params)
	if @comment.save
		respond_to :js
	else
		flash[:error] = "Something went wrong"
	end
end

def destroy
	@comment = Comment.find(params[:id])
	if @comment.destroy
		respond_to :js
	else
		flash[:error] = "Something went wrong"
	end
end

def comment_params
	params.permit(:comment).require(:comment,:article_id)
end


end