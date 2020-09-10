class ProductsController < ApplicationController
  before_action :set_product, only: [:update, :show, :destroy, :update_stock_item]

  def create
    @product = Product.new(product_attributes)
    begin
      if @product.save
        render json: @product, status: 201
      else
        render json: @product.errors, status: 400
      end
    rescue => exception
      render json: {message: exception.message}, status: 500
    end
  end

  def update
    begin
      if @product.update(product_attributes)
        render json: @product, status: 200
      else
        render json: @product.errors, status: 400
      end
    rescue => exception
      render json: {message: exception.message}, status: 500
    end
  end

  def show
    render json: @product, status: 200
  end

  def destroy
    begin
      @product.destroy!
      head :no_content
    rescue => exception
      render json: {message: exception.message}, status: 500
    end
  end

  def by_store
    @product.store_id = params[:store_id]
    begin
      render json: @product.as_json(methods: :total_of_stock), status: 200
    rescue => exception
      render json: {message: exception.message}, status: 500
    end
  end

  def update_stock_item
    begin
      if @product.update_stock_item(stock_item_attributes)
        render json: @product.as_json(methods: :total_of_stock), status: 200
      else
        render json: @product.errors, status: 400
      end
    rescue => exception
      render json: {message: exception.message}, status: 500
    end
  end

  protected
    def set_product
      @product = Product.find(params[:id])
    end

    def product_attributes
      params.require(:product).permit(:name, :price)
    end

    def stock_item_attributes
      params.require(:product).permit(:store_id, :value)
    end
end
