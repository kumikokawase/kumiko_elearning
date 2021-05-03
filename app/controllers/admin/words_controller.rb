class Admin::WordsController < ApplicationController
    before_action :if_not_admin
  
    def new
      @category = Category.find(params[:category_id])
      @word = @category.words.new
      @choice = Form::ChoiceCollection.new
    end
 
    def create
      @category = Category.find(params[:category_id])
      @word = @category.words.new(word_params)
      @choice = Form::ChoiceCollection.new(choice_collection_params)
      if @word.save
        redirect_to admin_category_path(@category)
        flash[:success] = "Created successfully!"
      else
        flash[:danger] = "Invalid"
        render 'new'
      end  
    end
   
    def edit
      @category = Category.find(params[:category_id])
      @word = @category.words.find(params[:id])
      @choice = @word.choices.find(params[:id])
    end
 
    def update
      @category = Category.find(params[:category_id])
      @word = Word.find(params[:id])
      @choice = @word.choices.find(params[:id])
      if @wod.update_attributes(word_params)
        redirect_to admin_category_path(@category)
        flash[:success] = "Saved!"
      else
        flash[:danger] = "Invalid"
        render 'edit'
      end
    end

    def index
      @category = Category.find(params[:id])
      @word = @category.words.find(params[:id])
    end
 
   def destroy
    @category = Category.find(params[:category_id])
    Word.find(params[:id]).destroy
    # @category = Category.find(params[:category_id])
    # @word = Word.find(params[:id]).destroy
     redirect_to admin_category_path(@category)
   end
 
   private
   def if_not_admin
     redirect_to root_path unless current_user.admin?
   end

   def word_params
    params.require(:word).permit(:words, choices_attributes: [:word_id, :choices, :correct_ans])
   end

   def choice_collection_params
    params.require(:form_choice_collection)
    .permit(choices_attributes: [:choices, :correct_ans])
    end

end
