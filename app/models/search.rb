class Search < ApplicationRecord
  belongs_to :word
  has_many  :results
  has_many  :gifs, through: :results

  require 'uri'
  require 'net/http'

  def self.find_recent_or_create_search(word, how_recent)
    searches = word.searches.order(:created_at)
    if searches.length == 0 || (searches[0].updated_at - DateTime.now).abs > how_recent * 3600
      search = Search.create(word_id: word.id)
      Search.call_api(search)
    else
      search = searches[0]
    end
    search
  end

  def self.call_api(search)
    url = URI("http://api.giphy.com/v1/gifs/search?q=#{search.word.word}&api_key=dc6zaTOxFJmzC")
    http = Net::HTTP.new(url.host, url.port)
    request = Net::HTTP::Get.new(url)
    request["authorization"] = 'Token 2f9a56d5e1bbd1c3e695e8291949b11b5aa23b66'
    request["cache-control"] = 'no-cache'
    request["postman-token"] = '62b2aed9-28a7-06ba-9378-38cfb71f2cc9'
    response = http.request(request)
    JSON.parse(response.read_body)["data"][0..9].map do |data|
      gif = Gif.create(url_id: data["id"], bitly_url: data["bitly_url"])
      Result.create(search_id: search.id, gif_id: gif.id)
    end
  end

  def self.gif_urls(search)
    likes = Like.where(word_id: search.word.id).group(:gif_id).count.sort_by(&:last).map{|array| Gif.find(array[0]).url_id}[0..2]
    api_urls = search.results.map {|result|result.gif.url_id}
    {"#{search.word.word}": gif_urls = (likes + api_urls).uniq[0..9] }
  end

end
