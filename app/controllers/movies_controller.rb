class MoviesController < ApplicationController
	
	def index
		@movies = Movie.limit(10).order("created_at DESC")
		if params[:term]
      @movies = Movie.where("movies.title_esp ILIKE ? or movies.title_eng ILIKE ?", "%#{params[:term]}%","%#{params[:term]}%")
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
		p params
		@movie = Movie.find(params[:id])

		if params[:find] == "true"
			render :json => @movie
		end
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

	def show
		@movie = Movie.find(params[:id])
	end


end
