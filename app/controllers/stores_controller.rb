class StoresController < ApplicationController
  before_action :set_store, only: [:update, :show, :destroy]

  def create
    @store = Store.new(store_attributes)
    begin
      if @store.save
        render json: @store.attributes, status: 201
      else
        render json: @store.errors, status: 400
      end
    rescue => exception
      render json: {message: exception.message}, status: 500
    end
  end

  def update
    begin
      if @store.update(store_attributes)
        render json: @store.attributes, status: 200
      else
        render json: @store.errors, status: 400
      end
    rescue => exception
      render json: {message: exception.message}, status: 500
    end
  end

  def show
    render json: @store.attributes, status: 200
  end

  def destroy
    begin
      @store.destroy!
      head :no_content
    rescue => exception
      render json: {message: exception.message}, status: 500
    end
  end

  protected
    def set_store
      @store = Store.find(params[:id])
    end

    def store_attributes
      params.require(:store).permit(:name, :address)
    end
end
