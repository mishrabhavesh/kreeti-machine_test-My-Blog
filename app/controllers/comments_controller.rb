class CommentsController < ApplicationController


def create 
	@comment = current_user.comments.build(comment_params)
	if @comment.save
			flash.now[:notice] = "Comment posted!!! "

		redirect_to article_path(@comment.article.id)
	else
		flash[:error] = "Something went wrong"
	end
end

def destroy
	@comment = Comment.find(params[:id])
	if @comment.destroy
				flash[:error] = "Comment deleted!!!"
		redirect_to articles_path
	else
		flash[:error] = "Something went wrong"
		redirect_to articles_path
	end
end

def comment_params
	params.require(:comment).permit(:comment,:article_id)
end


end