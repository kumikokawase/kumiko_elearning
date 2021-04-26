class Admin::WordsController < ApplicationController
    before_action :if_not_admin
  
    def new
      @word = Word.new
    end
 
    def create
      @word = Word.create(word_params)
      if @word.save
        redirect_to admin_category_words_path
        flash[:success] = "Created successfully!"
      else
        flash[:danger] = "Invalid"
        render 'new'
      end  
    end
   
    def edit
      @word = Word.find(params[:id])
    end
 
    def update
      @word = Word.find(params[:id])
      if @word.update_attributes(word_params)
        redirect_to admin_category_words_path
        flash[:success] = "Saved!"
      else
        flash[:danger] = "Invalid"
        render 'edit'
      end
    end

    def index
      @category = Category.find(params[:category_id])
      @word = Word.find(params[:id])
    end
 
   def destroy
     Category.find(params[:id]).destroy
     redirect_to admin_categories_path
   end
 
   private
   def if_not_admin
     redirect_to root_path unless current_user.admin?
   end

   def word_params
    params.require(:word).permit(:words)
   end

end
