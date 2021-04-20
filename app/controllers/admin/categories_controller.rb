class Admin::CategoriesController < ApplicationController
  before_action :if_not_admin
  before_action :set_categories, only: [:show, :edit, :destroy]

  def new
  end

  def edit
  end

  def show
  end

  def index
  end


  private
  def if_not_admin
    redirect_to root_path unless current_user.admin?
  end

  def set_categories
    @categories = Categories.find(params[:id])
  end

end
