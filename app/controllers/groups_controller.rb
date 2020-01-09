class GroupsController < ApplicationController

  before_action :find_group, only: [:show, :edit, :update, :destroy]

  def index
    @groups = Group.all
  end

  def member_groups
    member = Member.find(session[:member_id])
    @groups = member.groups
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
    member_id = session[:member_id]

    if !member_id
      flash[:warning] = "You must be logged in to create a group" 
      redirect_to login_path
    elsif @group.save
      relationship = Relationship.new(group_id: @group.id, member_id: member_id, status: "owner")
      if relationship.save
        redirect_to group_path(@group.id)
        return
      end
      flash[:warning] = "Group could save by relationship could not"
      render :new
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
