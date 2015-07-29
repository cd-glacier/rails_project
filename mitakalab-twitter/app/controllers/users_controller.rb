class UsersController < ApplicationController
  def index
  end

  def show
	@user = Hash.new
	if params[:username] == 'mayoshima'
		@user[:name] = 'Shohei Aoki'
		@user[:username] = 'moyashima'
		@user[:location] = 'Tottori, Japan'
		@user[:about] = 'Nice to meet you.a'
	elsif params[:username] == 'ryooopan'
		@user[:name] = 'Ryo Suzuki'
		@user[:username] = 'ryooopan'
		@user[:location] = 'Kanagawa, Japan'
		@user[:about] = 'Hello, I am Ryo..'
	end
  end
end

