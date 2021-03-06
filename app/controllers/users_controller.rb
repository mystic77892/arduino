class UsersController < ApplicationController
	def show
		@user = User.find_by(slug: params[:id])
		respond_to do |format|
			format.json { render :json => @user.to_json(include: {projects: {include: :data_values}})}
		end
	end
end
