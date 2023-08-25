class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
    @list.bookmarks.build
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to lists_path
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to lists_path
    else
      render :new
    end
  end

  private

  def list_params
    params.require(:list).permit(:name, :photo, bookmarks_attributes: [:id, :movie_id, :comment])
  end
end
