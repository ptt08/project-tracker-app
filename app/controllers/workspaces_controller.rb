class WorkspacesController < ApplicationController
  def index
    @workspaces = user_signed_in? ? current_user.workspaces : []
  end
end
