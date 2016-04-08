class WellController < ApplicationController

  def index

      @body = Body.all
  end
  def inbox
    @body = Body.where(to_id: current_user.id)
  end

  def new
    @body = Body.new
  end
  def create
      @body = Body.new(body_params)
      if @body.save
        redirect_to  well_index_path
      else
         render "new"
       end
    
  end
  def show
     @body =Body.find(params[:id])
     redirect_to some_user_default_path if @body.user != @current_user

  end
private
   def body_params
     params.require(:body).permit(:to, :image, :message,:user_id)
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