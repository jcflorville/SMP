class ReturnsController < ApplicationController
	layout "movies"

	def create
		params
		id = params[:id]
		movie = Movie.find(id.to_i)
		movie.stock = movie.stock + 1
		movie.save
		
		redirect_to new_return_path	
	end
	
end
