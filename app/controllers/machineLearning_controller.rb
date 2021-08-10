class MachineLearningController < ApplicationController
    
    before_action :set_quote, only: %i[ show edit update destroy ]
  
    # GET /quotes or /quotes.json
    def index
      redirect_to index_url
      @machineLearning = machineLearning.all
    end
  
    # GET /quotes/1 or /quotes/1.json
    def show
      redirect_to index_url
    end
  
    # GET /quotes/new
    def new
      redirect_to index_url
      @quote = Quote.new
    end
  
    # GET /quotes/1/edit
    def edit
      redirect_to index_url
    end

end