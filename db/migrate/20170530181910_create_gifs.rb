class CreateGifs < ActiveRecord::Migration[5.1]
  def change
    create_table :gifs do |t|
      t.string :query
      t.string :gif_id
      t.integer :count, default: 0

      t.timestamps
    end
  end
end
