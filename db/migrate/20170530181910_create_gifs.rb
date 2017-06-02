class CreateGifs < ActiveRecord::Migration[5.1]
  def change
    create_table :gifs do |t|
      t.string  :url_id
      t.string  :bitly_url

    end
  end
end
