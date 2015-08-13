class UsersController < ApplicationController
	before_action :set_params_id, only: [:show, :destroy]
	before_action :set_User_find , only: [:show, :edit, :update, :destroy]

	def index
		@users = User.all
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
	end

	def destroy
		@user.destroy
		redirect_to users_path
	end

	def edit
	end

	def update
		@user.update(params_username)
		redirect_to users_path
	end

	private
		def set_User_find
			@user = User.find(params[:id])
		end

		def set_params_id
			@id = params[:id]
		end

		def params_username
			params[:user].permit(:username)
		end

end
