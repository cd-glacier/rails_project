class UsersController < ApplicationController
	def index
		@users = User.all
	end

	def show
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new
		@user.username = params[:user][:username]
		@user.save
		redirect_to users_path
	end

	def show
		@id = params[:id]
		@user = User.find(params[:id])
	end

	def destroy
		@id = params[:id]
		@user.destroy
		redirect_to users_path
	end
end
