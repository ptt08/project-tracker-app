class ProjectsController < ApplicationController
  def index
    @projects = current_user.projects
  end

  def new
    @project = Project.new
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
