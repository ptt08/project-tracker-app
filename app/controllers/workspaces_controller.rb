class WorkspacesController < ApplicationController
  def index
    @workspaces = user_signed_in? ? current_user.workspaces : []
  end

  def new
    @workspace = Workspace.new
  end

  def create
    @workspace = Workspace.new(workspace_params)
    current_user.workspaces << @workspace
    if @workspace.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def workspace_params
    params.require(:workspace).permit(:name)
  end
end
