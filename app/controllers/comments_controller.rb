class CommentsController < ApplicationController


def create 
	@comment = current_user.comments.build(comment_params)
	if @comment.save
			flash[:notice] = "Comment posted!!! "
		redirect_to article_path(@comment.article.id)
	else
		flash[:error] = "Something went wrong"
	end
end

def destroy
	@comment = Comment.find(params[:id])
	@article = @comment.article
	if @comment.user.id == current_user.id
		if @comment.destroy
			flash[:error] = "Comment deleted!!!"
			redirect_to @article
		else
			flash[:error] = "Something went wrong"
			redirect_to articles_path
		end
	else
		flash[:notice] = "Can only delete your comment"
	end
end

def comment_params
	params.require(:comment).permit(:comment,:article_id)
end


end