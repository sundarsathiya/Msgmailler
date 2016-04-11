class WellController < ApplicationController
before_action :authenticate_user!
  def index
    
      @messages = Message.where(user_id: current_user.email)
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
      @messages = Message.where(to: current_user.id, status: nil)
    end
  def show
     @message =Message.find(params[:id])
  end
  def destroy
   @message=Message.find(params[:id])
 
     @message.destroy(status:'delete')
  
    redirect_to  root_path
  end
 def trash
		@message = Message.where(to_id: current_user.id, status: 'deleted')
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