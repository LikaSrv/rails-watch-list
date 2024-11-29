class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find_by(id: params[:id])
    @bookmarks = Bookmark.select { |bookmark| bookmark.list_id == @list.id}
    @movies = []
    @bookmarks.each do |b|
      @movies << Movie.select { |movie| movie.id == b.movie_id}
    end
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save!
      redirect_to lists_path
    end
  end

  private

  def list_params
    params.require(:list).permit(:name, :photo)
  end
end
