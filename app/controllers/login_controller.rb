class LoginController < ApplicationController

	def index
		@sales = Sale.limit(10).order("created_at DESC")
	end
end