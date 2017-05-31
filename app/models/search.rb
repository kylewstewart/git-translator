class Search < ApplicationRecord
  require 'uri'
  require 'net/http'

  # def self.find_recent_or_create(word, recent)
  #   search_from_db ||= Search.where(word: word).order(:updated_at)
  #   return search = Search.create(word: word) if !search_from_db[0]
  #   if (search_from_db[0].updated_at - DateTime.now).abs > recent * 3600
  #     search = Search.create(word: word)
  #   else
  #     search = search_from_db[0]
  #   end
  # end

  def gif_urls
    {"#{word}": create_array}
  end

  def create_array
    (call_api - gifs).unshift(gifs).flatten[0..9]
  end

  def call_api
    url = URI("http://api.giphy.com/v1/gifs/search?q=#{word}&api_key=dc6zaTOxFJmzC")
    http = Net::HTTP.new(url.host, url.port)
    request = Net::HTTP::Get.new(url)
    request["authorization"] = 'Token 2f9a56d5e1bbd1c3e695e8291949b11b5aa23b66'
    request["cache-control"] = 'no-cache'
    request["postman-token"] = '62b2aed9-28a7-06ba-9378-38cfb71f2cc9'
    response = http.request(request)
    JSON.parse(response.read_body)["data"][0..9].map{|hsh| hsh["id"]}
  end

  def gifs
    db_gifs ||= Gif.where(query: word).order(:count).limit(3)
    db_gifs.length == 0 ? @gifs = [] : db_gifs.map{|gif| gif}
  end

end
