class CreateResults < ActiveRecord::Migration[5.1]
  def change
    create_table :results do |t|
      t.belongs_to :search
      t.belongs_to :gif

    end
  end
end
