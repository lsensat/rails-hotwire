class QuotesController < ApplicationController
  before_action :set_quote, only: [:show, :edit, :update, :destroy]

  def index
    # @quotes = Quote.all
    @quotes = current_company.quotes.ordered
  end

  def show
    # @line_item_dates = @quote.line_item_dates.ordered
    @line_item_dates = @quote.line_item_dates.includes(:line_items).ordered
  end

  def new
    @quote = Quote.new
  end

  def create
    @quote = current_company.quotes.build(quotes_params)

    if @quote.save
      respond_to do |format|
        format.html { redirect_to quotes_path, notice: "Quote was successfully created." }
        format.turbo_stream { flash.now[:notice] = "Quote was successfully created." }
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
      respond_to do |format|
        format.html { redirect_to quotes_path, notice: "Quote was successfully updated." }
        format.turbo_stream { flash.now[:notice] = "Quote was successfully updated." }
      end
    end
  end

  def destroy
    @quote.destroy

    respond_to do |format|
      format.html { redirect_to quotes_path, notice: "Quote was successfully destroyed." }
      format.turbo_stream { flash.now[:notice] = "Quote was successfully destroyed." }
    end
  end

  private

  def set_quote
    @quote = current_company.quotes.find(params[:id])
  end

  def quotes_params
    params.require(:quote).permit(:name)
  end
end
