class HomeController < ApplicationController
	before_action :authenticate_user!
  def index
    Setting.find_or_create_by(user_id:current_user.id) do |s|
      s.inboxlimit = 10
    end
   end 

     def update
   	inboxlimit = Setting.find_by(user_id: current_user.id)
   inboxlimit.update(setting_params)
    redirect_to  well_index_path
    end   
  private
   def setting_params
     params.require(:setting).permit(:inboxlimit)
end

end 