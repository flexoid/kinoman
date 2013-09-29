class ReviewsController < ApplicationController

  load_and_authorize_resource :movie
  load_and_authorize_resource through: :movie

  prepend_before_filter do
    params[:review] = review_params
  end

  respond_to :html

  def new
  end

  def create
    @review.user = current_user
    @review.save
    respond_with @review, location: @movie
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

    def review_params
      params.fetch(:review, {}).permit(:title, :content)
    end
end
