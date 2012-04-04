class HomeController < ApplicationController
	layout "movies"
	def index
		p @sales = Sale.limit(10).order("created_at DESC")
	end
end
