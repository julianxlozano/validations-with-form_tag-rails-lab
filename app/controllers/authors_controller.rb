class AuthorsController < ApplicationController


  def new
    @author = Author.new(author_params)
  end
  

  def create
    @author = Author.new(author_params)
    if @author.valid?
       @author.save
       redirect_to author_path(@author)
    else  
     # binding.pry 
       render :new
    end
  end

  def show
    @author = Author.find(params[:id])
  end

  def edit 
    @author = Author.find(params[:id])
  end

  def update
    if @author.update(author_params) == true
     @author.save
     redirect_to author_path(@author)
    else 
     render :edit 
    end
   end
 

  private

  def author_params
    params.permit(:name, :email, :phone_number)
  end
end
