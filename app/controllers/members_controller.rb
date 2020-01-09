class MembersController < ApplicationController
  layout 'splash', :only => [:signup_form, :login_form]
  
  def signup_form
    @member = Member.new
  end

  def signup
    username = params[:member][:username]
    member = Member.find_by(username: username)
 
    if member
      flash[:warning] = "There's already a member with username #{username}. Please log in."  #Is that you? #{view_context.link_to 'Log in Here', login_path}."
      redirect_to root_path
    else
      member = Member.create(member_params)
      session[:member_id] = member.id
      flash[:success] = "Successfully signed up as new member #{username}" #in group #{Group.find(member.group_id).name}"
      redirect_to groups_path#group_path(member.group_id)
    end
  end
  
  def login_form
    @member = Member.new
  end

  def login
    username = params[:member][:username]
    member = Member.find_by(username: username)
    if member
      session[:member_id] = member.id
      flash[:success] = "Successfully logged in as returning member #{username}"
      redirect_to groups_path#group_path(member.group_id)
    else
      flash[:warning] = "You need to sign up"
      redirect_to signup_path
    end    
  end

  def join_form
    member_id = session[:member_id]
    member = Member.find(member_id)
    
  end

  def join
  end

  private
  def member_params
    return params.require(:member).permit(:username, :email, :first, :last)
  end
end
