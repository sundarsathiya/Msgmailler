class ApplicationController < ActionController::Base
	helper_method :jdenticon
  before_action :menu_count
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
  
  def menu_count
    if current_user
     
     p '********************************************'
       p @inbox_counts = Message.where(to: current_user.id).count
       @sendmail_counts = Message.where(user_id: current_user.id).count
       @contuct_counts = current_user.contacts.count
    end
  end
  
  private


  def configure_permitted_parameters

    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:email, :password, :password_confirmation, :firstname, :lastname, :birthday,:gender, :username,:state,:city,:street,:country,:zipcode,:image )}
    devise_parameter_sanitizer.for(:account_update) {|u| u.permit(:email, :password, :password_confirmation, :firstname, :lastname, :birthday,:gender,:username,:state,:city,:street,:country,:zipcode,:image)}
  end

  



  def jdenticon
  	md5 = Digest::MD5.new
  	md5.update current_user.email
  	md5.hexdigest  
  end               








end

