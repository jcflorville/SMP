class SalesController < ApplicationController
	layout "movies"

	def index
		@sales = Sale.limit(5)
		if params[:today]
			@sales = Sale.where(:created_at => DateTime.now.at_beginning_of_day..DateTime.now)
			@count = @sales.count
		elsif params[:datepicker] && params[:datepicker2]
			date1 = DateTime.strptime(params[:datepicker], "%m/%d/%Y").to_datetime
			date2 = DateTime.strptime(params[:datepicker2], "%m/%d/%Y").to_datetime.end_of_day
			@sales = Sale.where(:created_at => date1..date2)
			@count = @sales.count
		end
		p params
	end

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
