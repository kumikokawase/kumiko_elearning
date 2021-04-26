class Admin::CategoriesController < ApplicationController
  before_action :if_not_admin
  
   def new
     @category = Category.new
   end

   def create
     @category = Category.new(category_params)
     if @category.save
       redirect_to admin_categories_path
       flash[:success] = "Created successfully!"
     else
       flash[:danger] = "Invalid"
       render 'new'
     end  
   end
   def show
    @category = Category.find(params[:id])
   end

   def edit
    @category = Category.find(params[:id])
   end

   def update
     @category = Category.find(params[:id])
     if @category.update_attributes(category_params)
       redirect_to admin_categories_path
       flash[:success] = "Saved!"
     else
       flash[:danger] = "Invalid"
       render 'edit'
     end
   end  

  def index
    @category = Category.select('id','title', 'description')
    @id = Category.select('id')
  end

  def destroy
    Category.find(params[:id]).destroy
    redirect_to admin_categories_path
  end

  private
  def if_not_admin
    redirect_to root_path unless current_user.admin?
  end

  def category_params
    params.require(:category).permit(:title, :description)
  end

end
