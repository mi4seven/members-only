class UsersController < ApplicationController
  
    def edit            
    end

    def update  
        @user.update(user_params)
     
        flash.notice = "Your has been successfully updated!"
        #render action: "edit"
        redirect_to root_path
      end
    
    private    

  def user_params
    params.require(:user).permit(:user)
  end     
end
