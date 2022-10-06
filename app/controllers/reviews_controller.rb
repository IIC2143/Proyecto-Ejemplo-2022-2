class ReviewsController < ApplicationController
  def new
    @game_id = params[:game_id]
    @review = Review.new
  end

  def create
    review_params[:game_id] = params[:game_id].to_i
    @review = Review.new(review_params)
    @review.user = current_user

    if @review.save
      redirect_to game_path(@review.game.id)
    else
      render :new
    end
  end

  def update
    respond_to do |format|
      if @review.update(review_params)
        redirect_to review_url(@review)
      else
        render :edit
      end
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to game_path(@review.game)
  end

  private
    def set_review
      @review = Review.find(params[:id])
    end

    def review_params
      params.require(:review).permit(:title, :description, :score, :game_id)
    end
end
