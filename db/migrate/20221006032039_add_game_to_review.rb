class AddGameToReview < ActiveRecord::Migration[6.0]
  def change
    add_reference :reviews, :game, null: false, foreign_key: true
  end
end
