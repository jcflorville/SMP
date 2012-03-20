class MoviesController < ApplicationController
	
	def index
		
	end

	def new
		@movie = Movie.new
	end

	def create
		@movie = Movie.new params[:movie]
		@movie.save
		redirect_to :back
	end

	def edit
		
	end
end
