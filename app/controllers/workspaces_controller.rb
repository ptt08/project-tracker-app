class WorkspacesController < ApplicationController
  def index
    @workspaces = current_user.workspaces
  end
end
