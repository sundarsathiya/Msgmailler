class ProfilesController < ApplicationController
  
  def index
    @user = User.find(current_user.id)
  end
   
  def edit
     @user= User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	@user.update(user_params)
  	redirect_to profiles_path
  end

private
   	def user_params
     params.require(:user).permit(:state,:city,:street,:country,:zipcode,:image)
	end
end






