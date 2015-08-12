class DiariesController < ApplicationController
	def index
		@id = params[:id]
		@user = User.find(params[:id])
		@diaries = Diary.all
	end

	def new
		@id = params[:id]
		@diary = Diary.new
	end

	def create
		@id = params[:id]
		@user = User.find(params[:id])
		redirect_to diaries_path(@user.id)
	end

end
