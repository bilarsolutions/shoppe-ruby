class Shoppe::ProductCategoriesController < Shoppe::ApplicationController

  before_filter { @active_nav = :products }  
  before_filter { params[:id] && @product_category = Shoppe::ProductCategory.find(params[:id]) }
  
  def new
    @product_category = Shoppe::ProductCategory.new
  end
  
  def create
    @product_category = Shoppe::ProductCategory.new(safe_params)
    if @product_category.save
      redirect_to :products, :flash => {:notice => "Category has been created successfully"}
    else
      render :action => "new"
    end
  end
  
  def edit
  end
  
  def update
    if @product_category.update(safe_params)
      redirect_to [:edit, @product_category], :flash => {:notice => "Category has been updated successfully"}
    else
      render :action => "edit"
    end
  end
  
  def destroy
    @product_category.destroy
    redirect_to :products, :flash => {:notice => "Category has been removed successfully"}
  end
  
  private
  
  def safe_params
    params[:product_category].permit(:name, :permalink, :description, :image_file)
  end
  
end
