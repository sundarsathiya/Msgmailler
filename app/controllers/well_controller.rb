class WellController < ApplicationController
before_action :authenticate_user!
  def index
    @messages = Message.where(user_id: current_user.id,status: nil).paginate(page: params[:page], per_page: 5)
    @search = Message.ransack(params[:q])
    @messages =  @search.result.paginate(page: params[:page], per_page: 5)
     
  
    
    #  @messages = Message.where(user_id: current_user.id,status: nil).paginate(page: params[:page], per_page: 2)
  end
 

  def new
    @message = Message.new
  end
  def create
      @message = current_user.messages.new(message_params)

      if @message.save
        redirect_to  well_index_path
      else
         render "new"
       end
    end
    def inbox
      @message = Message.where(to: current_user.email, status: nil)
    end
  def show
     @message =Message.find(params[:id])
  end
  def destroy
   @message=Message.find(params[:id])
 
     @message.update(status:'deleted')
  
    redirect_to  root_path
  end
    def trash
		@message = Message.where(to_id: current_user.id, status: 'deleted')
		@message = Message.where(user_id: current_user.email, status:'deleted')
	end
		def remove
		@message = Message.find(params[:id])
		
		@message.destroy
		
		redirect_to messages_trash_path
		
	end

	def restore
		@message = Message.find(params[:id])
		
		@message.update(status: nil)
		
		redirect_to root_path
	end




private
   def message_params
     params.require(:message).permit(:user_id,:to,:image, :body,:status)
end
























 #  def index
 #  #	@body = Body.all

 #  end
 #  def new

 #  @body = Body.all
 #  end
 #  def create

 #      @body = Body.new(body_params)
	# 	if @body.save
	# 	redirect_to new_well_path	
 #        else
 #      redirect_to new_well_path
 #      end
 #    end
 #  def show
 #    @body=Body.find(params[:id])
 #  end
 
 #  private
 #  def body_params
 #    params.require(:body).permit(:to, :from, :image, :message)
 # end
end