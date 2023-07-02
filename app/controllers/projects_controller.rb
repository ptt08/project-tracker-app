class ProjectsController < ApplicationController
  def index
    @projects = current_user.projects
  end

  def show
    @project = Project.find(params[:id])
    @lists = @project.lists.rank(:row_order)
  end

  def new
    @project = Project.new
    @workspace = Workspace.find(params[:workspace_id])
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to @project
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def project_params
    params.require(:project).permit(:name, :workspace_id)
  end
end
