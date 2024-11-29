class ReviewsController < ApplicationController

  def new
    @bookmark = Bookmark.find(params[:bookmark_id])
    @review = Review.new
  end
  def create
    @bookmark = Bookmark.find(params[:bookmark_id])
    @review = Review.new(review_params)
    @review.bookmark = @bookmark
    @review.save!
    redirect_to list_path(@bookmark.list)
  end

  private

  def review_params
    params.require(:review).permit(:content, :bookmark_id)
  end
end
