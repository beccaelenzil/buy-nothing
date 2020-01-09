require 'pry'

class RelationshipsController < ApplicationController
  #validates :member_id, uniqueness: {
  #  scope: :group_id, 
  #  message: "can only join a group once"
  #}

  def join_form
    @relationship = Relationship.new
  end

  def join
    member_id = session[:member_id]
    group_id = params[:relationship][:group_id]
    @relationship = Relationship.new(group_id: group_id, member_id: member_id, status: "regular")

    if !member_id
      flash[:warning] = "You must be logged in to join a group" 
      redirect_to login_path
    elsif @relationship.save 
      
      redirect_to groups_path#(group_id)
      return
    else 
      flash[:warning] = "Could not join group"
      render :join_form
      return
    end
    
  end

end
