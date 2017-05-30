class Api::V1::GifController < ApplicationController

  def index
  end

  def create
    Search.find_or_new(word: params[:word])
    search = Search.create(word: params[:word])
    render json: search.gif_urls
  end

  def show
  end



end
