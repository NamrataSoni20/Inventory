class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /categories
  # GET /categories.json
  def index
    @products = Product.all
    respond_to do |format|
      format.html
      format.json {render json: @products}
    end
   
  end

  
  def show
    @product = Product.find_by(id: params[:id])
    respond_to do |format|
      format.html
      format.json {render json: @product}
    end
  end

  
  def new
    @categories = Category.all
    @product = Product.new
    
  end

  # GET /categories/1/edit
  def edit
    @categories = Category.all

  end

  
  def create

    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
       format.html { redirect_to @product, notice: 'product  was successfully created.' }
       format.json {render json: :show, status: :created, location: @product}
      else
         format.html {render :new}
         format.json { render json: @product.errors, status: :unprocessable_entity }
        end
      end
  
  end
 
  
  def update
     @product = Product.find_by(id: params[:id])
     respond_to do |format|
       if @product.update(product_params)
        format.html{redirect_to @product, notice: 'product was successfully updated.' }
        format.json{render :show, status: :ok, location: @product}
       else
        format.html {render 'edit'}
        format.json {render json: @category.errors, status: :unprocessable_entity}
       end
     end
   end
 

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
     respond_to do |format|
       format.html { redirect_to products_url, notice: 'product  was successfully destroyed.' }
       format.json { head :no_content}
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
      @category = Category.find(params[:id])

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name,:price,:quantity,:purchasedate,:category_id)
 end
end



















































































