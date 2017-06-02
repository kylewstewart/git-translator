class Api::V1::LikeController < ApplicationController


  def index
    word = Word.find_by(word: params[:word])
    likes = Like.where(word_id: word.id).group(:gif_id).count.sort_by(&:last).map{|array| Gif.find(array[0]).url_id}[0..2]
    render json: likes
  end


  def create
    word = Word.find_by(word: params[:word])
    gif = Gif.find_by(url_id: params[:url_id])
    like = Like.create(word_id: word.id, gif_id: gif.id)

    render status: 200
  end




end
