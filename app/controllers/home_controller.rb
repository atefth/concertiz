class HomeController < ApplicationController
	layout 'layouts/application'
	def index
		@page = 'home'
		render 'index'
	end

	def concerts
		@page = 'concerts'
		@concerts = Concert::all()
		render 'concerts'
	end
end
