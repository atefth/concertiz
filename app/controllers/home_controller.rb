class HomeController < ApplicationController
	layout 'layouts/application'
	def index
		@page = 'home'
		render 'index'
	end

	def concerts
		@page = 'concerts'
		render 'concerts'
	end
end
