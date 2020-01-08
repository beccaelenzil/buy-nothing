class MembersController < ApplicationController
  def root
    @member = Member.new
  end
  
  def signup_form
    @member = Member.new
  end

  def signup
    username = params[:member][:username]
    member = Member.find_by(username: username)
    if member
      session[:member_id] = member.id
      flash[:warning] = "There's already a member with username #{username}. Is that you? #{view_context.link_to 'Log in Here', login_path}."
      redirect_to root_path
    else
      member = Member.create(member_params)
      session[:member_id] = member.id
      flash[:success] = "Successfully signed up as new member #{username} in group #{Group.find(member.group_id).name}"
      redirect_to group_path(member.group_id)
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
    else
      member = Member.create(member_params)
      session[:member_id] = member.id
      flash[:success] = "Successfully logged in as new member #{username}"
    end
  
    puts(member)
    redirect_to group_path(member.group_id)
  end

  private
  def member_params
    return params.require(:member).permit(:username, :email, :first, :last, :status, :group_id)
  end

end
