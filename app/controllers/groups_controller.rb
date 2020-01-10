class GroupsController < ApplicationController

  before_action :find_group, only: [:show, :edit, :update, :destroy]

  def index
    if params[:member_id]
      member = Member.find(session[:member_id])
      @groups = member.groups
    else
      @groups = Group.all
    end
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
    owner_id = @group.owner.id
    if session[:member_id] == owner_id
      @group.destroy
      redirect_to groups_path
      return
    else
      flash[:warning]="You must be the owner to delete the group."
      redirect_to groups_path
      return
    end
  end

  def join
    member_id = session[:member_id]
    group_id = params[:id]
    @relationship = Relationship.new(group_id: group_id, member_id: member_id, status: "regular")

    if !member_id
      flash[:warning] = "You must be logged in to join a group" 
      redirect_to login_path
    elsif @relationship.save 
      redirect_to groups_path
      return
    else 
      flash[:warning] = "Could not join group"
      render :join_form
      return
    end
    
  end

  private
  def group_params
    return params.require(:group).permit(:name, :description, :bounds, :map, :city, :state, :country)
  end

  def find_group
    @group = Group.find_by(id: params[:id])
  end

end
