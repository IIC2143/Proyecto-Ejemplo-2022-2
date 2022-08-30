class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string :name
      t.integer :year
      t.string :genre
      t.string :publisher
      t.string :description

      t.timestamps
    end
  end
end
