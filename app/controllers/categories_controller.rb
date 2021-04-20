class CategoriesController < ApplicationController
    @admin_user = Categories.find(params[:id])
end
