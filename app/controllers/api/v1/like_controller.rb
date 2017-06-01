class Api::V1::LikeController < ApplicationController

  def create
    word = Word.find_by(word: params[:word])
    gif = Gif.find_by(url_id: params[:url_id])
    like = Like.create(word_id: word.id, gif_id: gif.id)

    render status: 200
  end




end
