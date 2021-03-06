class PortfoliosController < ApplicationController

	def index
		@portfolio_items = Portfolio.all
	end

	def new
		@portfolio_item = Portfolio.new
	end

	def create
    	@portfolio_item = Portfolio.new(params.require(:portfolio).permit(:title ,:subtitle , :body))

	    respond_to do |format|
	      if @portfolio_item.save
	        format.html { redirect_to portfolios_path, notice: 'Your Portfolio is now live.' }
	      else
	        format.html { render :new }
	      end
	    end
  	end

  	def edit
  		@portfolio_item = Portfolio.find(params[:id])
  	end

  	def update
	    respond_to do |format|
	      if @blog.update(params.require(:portfolio).permit(:title ,:subtitle , :body))
	        format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully updated.' }
	      else
	        format.html { render :edit }
	      end
	    end
  	end

end
