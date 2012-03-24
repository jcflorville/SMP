class MoviesController < ApplicationController
	
	def index
		@movies = Movie.limit(10)
	end

	def new
		@movie = Movie.new
	end

	def create
		@movie = Movie.new params[:movie]
		p @movie
		@movie.save
		redirect_to :back
	end

	def edit
		@movie = Movie.find(params[:id])
	end

	def update
		@movie = Movie.find(params[:id])
		@movie.update_attributes! params[:movie]
		redirect_to movies_path
	end

	def destroy
		@movie = Movie.find(params[:id])
		@movie.destroy
		redirect_to movies_path
	end
end
