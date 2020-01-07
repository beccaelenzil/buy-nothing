class GroupsController < ApplicationController
  def root
  end

  def index
    @groups = ['Madison Valley', 'Madison Park', 'Capitol Hill']
  end
end
