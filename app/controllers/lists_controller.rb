class ListsController < ApplicationController
  def new
    @project = Project.find(params[:project_id])
    @list = List.new
  end

  def sort
    @list = List.find(params[:id])
    @list.update(row_order_position: params[:row_order_position])
    head :no_content
  end

  def create
    @project = Project.find(params[:list][:project_id])
    @list = List.new(list_params)
    if @list.save
      render turbo_stream: [
        turbo_stream.prepend("lists", @list)
      ]
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def list_params
    params.require(:list).permit(:name, :project_id)
  end
end
