class Api::V1::GifController < ApplicationController

  def index
    byebug
    render "bite me"
  end

  def create
    search = Search.new("hello")
  end

  def show
  end



end
