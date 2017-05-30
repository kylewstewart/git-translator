class CreateGifs < ActiveRecord::Migration[5.1]
  def change
    create_table :gifs do |t|
      t.string :query
      t.string :url
      t.integer :count

      t.timestamps
    end
  end
end
