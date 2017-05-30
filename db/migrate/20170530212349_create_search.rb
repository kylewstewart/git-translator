class CreateSearch < ActiveRecord::Migration[5.1]
  def change
    create_table :searches do |t|
      t.string :word
      t.text :gif_urls

      t.timestamps
    end
  end
end
