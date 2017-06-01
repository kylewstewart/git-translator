class CreateLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :likes do |t|
      t.integer :word_id
      t.integer :gif_id

    end
  end
end
