class QuotesController < ApplicationController
  before_action :set_quote, only: [:show, :edit, :update, :destroy]

  def index
    # @quotes = Quote.all
    @quotes = Quote.ordered
  end

  def show
    #show
  end

  def new
    @quote = Quote.new
  end

  def create
    @quote = Quote.new(quotes_params)

    if @quote.save
      respond_to do |format|
        format.html { redirect_to quotes_path, notice: "Quote was successfully created." }
        format.turbo_stream
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    #edit
  end

  def update
    if @quote.update(quotes_params)
      redirect_to quotes_path, notice: "Quote was successfully updated."
    end
  end

  def destroy
    @quote.destroy

    respond_to do |format|
      format.html { redirect_to quotes_path, notice: "Quote was successfuly destroyed." }
      format.turbo_stream
    end
  end

  private

  def set_quote
    @quote = Quote.find(params[:id])
  end

  def quotes_params
    params.require(:quote).permit(:name)
  end
end
