class CategoriesController < ApplicationController
    
     def index
       @category = Category.select('id','title', 'description')
       @id = Category.select('id')
     end    
  
  end