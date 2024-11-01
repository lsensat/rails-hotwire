class QuotesController < ApplicationController
  before_action :set_quote, only: i%[show, edit, update, destroy]

  def index
    @quotes = Quote.all
  end

  def show
    #show
  end

  def new
    @quote = Quote.new
  end

  def create
    @quote = Quote.new(quote_params)

    if @quote.save
      redirect_to quote_path, notice: "Quote was successfully created."
    else
      render :new
    end
  end

  def edit
    #edit
  end

  def uptate
    if @quote.update(quote_params)
      redirect_to quotes_path, notice: "Quote was successfully updated."
    end
  end

  def destroy
    @quote.destroy
    redirect_to quotes_path, notice: "Quote was successfuly destroyed."
  end

  private

  def set_quote
    @quote = Quote.find(params[:id])
  end

  def quotes_params
    params.require(:quote).permit(:name)
  end
end
