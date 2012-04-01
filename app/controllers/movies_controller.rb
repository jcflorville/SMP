class MoviesController < ApplicationController
	
	def index
		@movies = Movie.limit(10)
		if params[:term]
      @movies = Movie.where("movies.title_esp LIKE ? or movies.title_eng LIKE ?", "%#{params[:term]}%","%#{params[:term]}%")
      #@movies = Movie.search(params[:term]) 
      list = @movies.map {|u| Hash[ id: u.id, label: u.title_esp+ " / " + u.title_eng , name: u.title_esp]}
      render :json => list
    end
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
