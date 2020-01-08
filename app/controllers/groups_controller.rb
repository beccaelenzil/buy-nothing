class GroupsController < ApplicationController

  before_action :find_group, only: [:show, :edit, :update, :destroy]

  def index
    @groups = Group.all
  end

  def show
    if @group.nil?
      head :not_found
      return
    end
  end

  def new
    @group = Group.new
  end

  def create  
    @group = Group.new(group_params)
    if @group.save
      redirect_to group_path(@group.id)
      return
    else 
      render :new 
      return
    end
  end

  def edit
  end

  def update
    if @group.update(group_params)
      redirect_to group_path(@group.id)
      return
    else 
      render :edit
      return
    end
  end

  def destroy
    @group.destroy
    
    redirect_to books_path
    return
  end

  def group_params
    return params.require(:group).permit(:name, :description, :bounds, :map, :city, :state, :country)
  end

  def find_group
    @group = Group.find_by(id: params[:id])
  end

end
