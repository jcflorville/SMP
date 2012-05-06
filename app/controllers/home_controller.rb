class HomeController < ApplicationController
	layout "movies"
	def index

		p @sales = Sale.select("DISTINCT movie_id, created_at").order("created_at DESC").limit(10)
		p @sales.to_yaml
	end
end
