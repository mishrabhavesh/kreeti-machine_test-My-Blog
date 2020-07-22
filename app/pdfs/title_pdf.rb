class TitlePdf < Prawn::Document


	def initialize(articles, user)
		super()
		@user = user
		email_heading(@user)
		title_text(articles)
	end

	def email_heading(user)
		text "#{user.email} Your articles title are listed below :", size: 25, style: :bold
	end

	def title_text(articles)
		move_down 30
		index = 1;
		articles.each do |article|
			text "#{index}) #{article.title}"
			index +=1
					move_down 15
		end
	end

end