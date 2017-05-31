class Api::V1::GifController < ApplicationController

  def index
  end

  def create
    # search = Search.find_recent_or_create(word: params[:word], 24)
    search = Search.new(word: params[:word])
    render json: search.gif_urls
  end

  def show
  end



end
