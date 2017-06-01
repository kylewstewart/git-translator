class Api::V1::SearchController < ApplicationController

  def create
    word = Word.find_or_create_by(word: params[:word])
    search = Search.find_recent_or_create_search(word, 24)

    render json: Search.gif_urls(search)
  end




end
