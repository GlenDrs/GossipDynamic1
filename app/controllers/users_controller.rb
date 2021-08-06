class UsersController < ApplicationController
  def index
    @user=User.all
  end

  def show
    @user=User.find(params[:id])
  end

  def update
    @user=User.find(params[:id])
    @user.update(user_params)
  end

  def destroy
    @user=User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  def new
    @user=User.new
  end

  def create
@user = User.new(params[:user])
     
    if @user.save
      redirect_to users_path
    else
      render :new
    end
end
  
 
  def edit
    @user=User.find(params[:id])
    post_params=params.require(:user).permit(:first_name, :last_name, :description, :email, :age, :password, :city_id)
    @user.update(post_params)
    redirect_to users_path
  end

 private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :description, :email, :age, :city_id, :password)
  end

end
