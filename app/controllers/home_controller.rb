class HomeController < ApplicationController
	before_action :authenticate_user!
  def index
  	@settings = Setting.all
  end
 
  def new
  	@setting = Setting.new
  	end 
   def create
       @setting = Setting.new(setting_params)
      if @setting.save
        redirect_to home_index_path
       else
       	render "new"
     end
 end
 def edit
 	@setting = Setting.find(params[:id])

 end
 def update
 	@setting = Setting.find(params[:id])
 	if @setting.update(setting_params)
     redirect_to home_index_path
       else
       	render "edit"
     end
 end
  def show
  	@setting = Setting.find(params[:id])
  end
  private
   def setting_params
     params.require(:setting).permit(:inboxlimit)
end

end
