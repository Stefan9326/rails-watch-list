class BookmarksController < ApplicationController
  before_action :set_list, only: [:new, :create]

  def new
    @bookmark = Bookmark.new
    @movies = Movie.all
  end

  def create
    @bookmark = Bookmark.new(
      comment: take_bookmark_params[:comment],
      movie_id: take_bookmark_params[:movie_id],
      list_id: @list.id
    )
    if @bookmark.save
      redirect_to list_path(@list)
    else
      redirect_to new_list_bookmark_path(@list)
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list)
    # find the bookmark by list_id and movie_id
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def take_bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id, :list_id)
  end
end
