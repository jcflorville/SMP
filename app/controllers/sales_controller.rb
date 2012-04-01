class SalesController < ApplicationController
	layout "movies"

	def new
		@sale = Sale.new
	end

	def create

		p params
			
	end



end
