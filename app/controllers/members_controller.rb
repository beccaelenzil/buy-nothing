class MembersController < ApplicationController
  layout 'splash', :only => [:signup_form, :login_form]
  #validates :username, uniqueness: true
  #validates :email, uniqueness: true

  def index
    if params[:group_id]
      @members = Group.find(params[:group_id]).members
    else
      @members = Member.all
    end
  end

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

  def logout
    session[:member_id] = nil
    redirect_to login_path
  end

  def current
    @current_member = Member.find_by(id: session[:member_id])
    unless @current_user
      flash[:warning] = "You must be logged in to see this page"
      redirect_to root_path
    end
  end

  private
  def member_params
    return params.require(:member).permit(:username, :email, :first, :last)
  end
end
