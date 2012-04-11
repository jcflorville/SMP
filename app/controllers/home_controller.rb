class HomeController < ApplicationController
	layout "movies"
	def index
		@sales = Sale.select("DISTINCT movie_id").limit(10)
	end
end
