class Api::V1::GifController < ApplicationController

  def index
  end

  def create
    gif = Gif.find_or_create_by(query: params[:word], gif_id: params[:id])
    gif.update(count: gif.count +=1)
    render status: 200
  end

  def show
  end



end
