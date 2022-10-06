class ReviewsController < ApplicationController
  # GET /reviews/new
  def new
    @game_id = params[:game_id]
    @review = Review.new
  end

  # POST /reviews or /reviews.json
  def create
    review_params[:game_id] = params[:game_id].to_i
    @review = Review.new(review_params)
    @review.user = current_user

    if @review.save
      redirect_to game_path(@review.game.id), notice: "Review was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /reviews/1 or /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to review_url(@review), notice: "Review was successfully updated." }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1 or /reviews/1.json
  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to game_path(@review.game), notice: "Review was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def review_params
      params.require(:review).permit(:title, :description, :score, :game_id)
    end
end
