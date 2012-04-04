class SalesController < ApplicationController
	layout "movies"

	def new
		@sale = Sale.new
	end

	def create
		params
		ids = params[:ids]
		stocks = params[:stocks]
		i = 0

		ids.each{|id|
			Sale.create(:movie_id => id.to_i)
			movie = Movie.find(id.to_i)
			movie.stock = movie.stock - stocks[i].to_i
			movie.save
			i += 1
		}
		redirect_to new_sale_path	
	end



end
