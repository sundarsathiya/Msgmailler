class UserMailer < ApplicationMailer
	default from: "moorthisathiya722@gmail.com"
  def register_conforimed(user)
				  		@user = user
						mail(:to => @user.email, :subject=>"Registered")
					end
				
end
