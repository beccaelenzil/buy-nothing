class GroupsController < ApplicationController
  GROUPS = ['Madison Valley', 'Madison Park', 'Capitol Hill']
  def index
    @groups = GROUPS
  end

  def show
    group_id = params[:id].to_i
    @group = GROUPS[group_id]
    if @group.nil?
      head :not_found
      return
    end
  end

  def new
  end

  def create
  end

end
