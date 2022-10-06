class ReviewsController < ApplicationController
  def new
    @game = Game.find(params[:game_id])
    @review = Review.new
  end

  def create
    @game = Game.find(params[:game_id])
    @review = Review.new(review_params)
    @review.game = @game
    @review.user = current_user

    if @review.save
      redirect_to game_path(@review.game.id)
    else
      render :new
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to game_path(@review.game)
  end

  private
    def review_params
      params.require(:review).permit(:title, :description, :score, :game_id)
    end
end
