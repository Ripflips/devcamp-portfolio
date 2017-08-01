class PortfoliosController < ApplicationController
  before_action :set_portfolio_item, only: [:edit, :update, :show, :destroy]
  layout 'portfolio'
  
  def index
    @portfolio_items = Portfolio.all
  end
  
  def angular
     @angular_portfolio_items = Portfolio.angular
  end
  
  
  def new
    @portfolio_items = Portfolio.new
    3.times { @portfolio_items.technologies.build }
  end
  
  def create
    @portfolio_items = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @portfolio_items.save
        format.html { redirect_to portfolios_path, notice: 'Portfolio item was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end
  
  def edit
  end
  
  def update
    respond_to do |format|
      if @portfolio_items.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: 'The record was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end
  
  def show
  end
  
  def destroy
    
    # Destroy/delete the record
    @portfolio_item.destroy
    
    # Redirect
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Portfolio item was successfully deleted.' }
    end
  end
  
  private
  
  def portfolio_params
    params.require(:portfolio).permit(:title,
                                      :subtitle, 
                                      :body, 
                                      technologies_attributes: [:name]
                                      )
  end 
end

def set_portfolio_item
   @portfolio_item = Portfolio.find(params[:id])
end

