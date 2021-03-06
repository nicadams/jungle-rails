class ReviewsController < ApplicationController
  before_filter :authorize

  def create
    @product = Product.find(params[:product_id])
    @review = Review.new(review_params)
    @review.product_id = @product.id
    @review.user = current_user
    if @review.save
      # redirect_to "/products/#{params[:product_id]}"
      redirect_to product_path(@product)
    else
      render :'products/show'
    end
  end

  def destroy
    @product = Product.find(params[:product_id])
    @review = Review.find params[:id]
    @review.destroy
    redirect_to product_path(@product), notice: 'Review deleted!'

  end


  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:rating, :description, :user_id)
    end
end

