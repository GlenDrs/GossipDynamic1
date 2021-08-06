class GossipsController < ApplicationController
  def index
    @gossip=Gossip.all 
  end

  def show
    @gossip=Gossip.find(params[:id])
  end

  def update
    @gossip=Gossip.find(params[:id])
    @gossip.update(gossip_params)
  end

  def destroy
    @gossip=Gossip.find(params[:id])
    @gossip.destroy
    redirect_to gossip_path
  end
 
  def new
    @gossip=Gossip.new
  end

  def create
    @user = Gossip.new(params[:gossip])
         
        if @gossip.save
          redirect_to gossip_path
        else
          render :new
        end
    end

  def edit
    @gossip=Gossip.find(params[:id])
    post_params=params.require(:gossip).permit(:title, :content)
    @gossip.update(post_params)
    redirect_to gossips_path
  end

  private
  def gossip_params
    params.require(:gossip).permit(:title, :content)
  end
end
